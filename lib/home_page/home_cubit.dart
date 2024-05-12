import 'package:easymoney/base/navigation_cubit.dart';
import 'package:easymoney/base/shop_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easymoney/base/loader.dart';

part 'package:easymoney/home_page/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._service) : super(HomeState.initial());

  final IAppService _service;

  Future<void> loadShops() async {
    emit(state.copyWith(loading: true));
    final shops = await _service.loadShopList();
    emit(state.copyWith(
      loading: false,
      shops: shops,
    ));
  }

  void goToShopAt(BuildContext context, int index) {
    context.read<NavigationCubit>().goToShop(state.shops[index]);
  }

  void goToLk(BuildContext context) => context.read<NavigationCubit>().goToLk();
}
