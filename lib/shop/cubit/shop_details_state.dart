part of 'shop_details_cubit.dart';

class ShopDetailsState extends Equatable {
  const ShopDetailsState({
    required this.shop,
  });

  final Shop shop;

  @override
  List<Object> get props => [shop];
}
