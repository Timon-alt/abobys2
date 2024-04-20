import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

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
          final coinName = 'Bitcoin';
          return ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin-logo.svg', 
            width: 30, 
            height: 30,),
          title: Text(
            coinName, 
            style: Theme.of(context).textTheme.bodyMedium,),
          subtitle: Text(
            "200000\$",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/coin',
              arguments: coinName 
            );
          },
        );
        }
      ),
    );
  }
}