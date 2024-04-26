import 'package:abobys/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:abobys/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:abobys/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  var cryptoCoinsRepository = CryptoCoinsRepository();
  List<CryptoCoin>? _cryptoCoinList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto List'),
      ),
      // Абоба
      body: (_cryptoCoinList == null) 
      ? const Center(child: CircularProgressIndicator(),) 
      : ListView.separated(
        padding: EdgeInsets.only(top: 16),
        itemCount: _cryptoCoinList!.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          final coin = _cryptoCoinList![i];
          return CryptoCoinTile(coin: coin);
        }
      ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}

