import 'package:abobys/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: Image.network(coin.imageURL),
    title: Text(
      coin.name, 
      style: Theme.of(context).textTheme.bodyMedium,),
    subtitle: Text(
      "${coin.priceInUSD} \$",
      style: Theme.of(context).textTheme.labelSmall,
    ),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: () {
      Navigator.of(context).pushNamed(
        '/coin',
        arguments: coin 
      );
    },
  );
  }
}