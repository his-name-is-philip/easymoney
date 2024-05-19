import 'dart:developer';

import 'package:easymoney/core/domain/shop_repository.dart';
import 'package:easymoney/shop/domain/shop.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_list_state.dart';

class ShopListCubit extends Cubit<ShopListState> {
  final ShopRepository _shopRepository;

  ShopListCubit(this._shopRepository) : super(ShopListInitial());

  Future<void> loadShops() async {
    emit(ShopListLoading());
    try {
      final shops = await _shopRepository.getShops();
      emit(ShopListSuccess(shops: shops));
    } catch (e) {
      var msg = e.toString();
      log(msg);
      emit(ShopListFailed(error: msg));
    }
  }
}
