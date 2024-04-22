import 'package:abobys/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:abobys/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  var cryptoCoinsRepository = CryptoCoinsRepository();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto List'),
      ),
      // Абоба
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return const CryptoCoinTile(coinName: coinName);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () {
          cryptoCoinsRepository.getCoinsList();
        },),
    );
  }
}

