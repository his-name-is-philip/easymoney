part of 'package:easymoney/shop_page/shop_cubit.dart';

class ShopState extends Equatable {
  final bool loading; //for additional shop info
  final Shop shop;

  const ShopState({
    required this.shop,
    required this.loading,
  });

  factory ShopState.initial(Shop shop) => ShopState(
        shop: shop,
        loading: false,
      );

  ShopState copyWith({Shop? shop, bool? loading}) => ShopState(
        shop: shop ?? this.shop,
        loading: loading ?? this.loading,
      );

  @override
  List<Object?> get props => [loading];
}
