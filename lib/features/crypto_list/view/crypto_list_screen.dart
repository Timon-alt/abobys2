import 'package:abobys/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:abobys/repositories/crypto_coins/abstract_coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {


  final _cryptoListBloc = CryptoListBloc(
    GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto List'),
      ),
      body: BlocBuilder<CryptoListBloc,CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          return Container();
        },
      ),
      
      // (_cryptoCoinList == null) 
      // ? const Center(child: CircularProgressIndicator(),) 
      // : ListView.separated(
      //   padding: EdgeInsets.only(top: 16),
      //   itemCount: _cryptoCoinList!.length,
      //   separatorBuilder: (context, index) => Divider(),
      //   itemBuilder: (context, i) {
      //     final coin = _cryptoCoinList![i];
      //     return CryptoCoinTile(coin: coin);
      //   }
      );
  }

  Future<void> _loadCryptoCoins() async {
    
    setState(() {});
  }
}