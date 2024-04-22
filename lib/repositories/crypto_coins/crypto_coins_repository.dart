import 'package:abobys/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';


// Нихуя не понял, тут надо гуглить и читать xdd
class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH&tsyms=USD');
    
    
    final data = response.data as Map<String, dynamic>;
    final cryptoCoinList = data.entries.map((e) => CryptoCoin(
      name: e.key, 
      priceInUSD: (e.value as Map<String, dynamic>)['USD'],
    ))
    .toList();
    return cryptoCoinList;
  }
}