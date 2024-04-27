import 'package:abobys/repositories/crypto_coins/crypto_coins.dart';
import 'package:abobys/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';


// Нихуя не понял, тут надо гуглить и читать xdd
class CryptoCoinsRepository implements AbstractCoinsRepository {


  CryptoCoinsRepository({required this.dio});
  final Dio dio;
  
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,AID,SQL,CAG,DOV&tsyms=USD');
    
    
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return CryptoCoin(
        name: e.key, 
        priceInUSD: price, 
        imageURL: 'https://www.cryptocompare.com/' + imageUrl,
        );})
    .toList();
    return cryptoCoinList;
  }
}