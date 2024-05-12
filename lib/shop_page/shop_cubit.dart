import 'package:easymoney/base/loader.dart';
import 'package:easymoney/base/shop_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'package:easymoney/shop_page/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  final IAppService _service;
  ShopCubit(this._service, Shop shop) : super(ShopState.initial(shop));
}
