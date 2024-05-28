import 'dart:developer';

import 'package:easymoney/core/domain/shop_repository.dart';
import 'package:easymoney/shop/domain/shop.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_details_state.dart';

class ShopDetailsCubit extends Cubit<ShopDetailsState> {
  ShopDetailsCubit(this._shopRepository, Shop shop)
      : super(ShopDetailsState(shop: shop));

  final ShopRepository _shopRepository;
}
