import 'package:abobys/repositories/crypto_coins/abstract_coin_repository.dart';
import 'package:abobys/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:bloc/bloc.dart';


part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      final coinsList = await coinsRepository.getCoinsList();
      emit(CryptoListLoaded(coinsList: coinsList));
    });
  }

  final AbstractCoinsRepository coinsRepository;
}