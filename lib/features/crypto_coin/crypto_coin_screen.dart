import 'dart:developer';

import 'package:flutter/material.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {

  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args!');
    if (args == null)
    {
      log('You must provide args!');
      return;
    }

    if (args is! String)
    {
      log('You must provide String args!');
      return;
    }
    super.didChangeDependencies();
    coinName = args;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/',
            );

          },)
      ),
    );
  }
}