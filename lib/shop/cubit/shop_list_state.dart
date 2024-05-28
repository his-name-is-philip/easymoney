part of 'shop_list_cubit.dart';

sealed class ShopListState extends Equatable {
  const ShopListState();

  @override
  List<Object> get props => [];
}

final class ShopListInitial extends ShopListState {}

final class ShopListLoading extends ShopListState {}

final class ShopListFailed extends ShopListState {
  final String error;

  const ShopListFailed({required this.error});
}

final class ShopListSuccess extends ShopListState {
  final List<Shop> shops;

  const ShopListSuccess({required this.shops});

  @override
  List<Object> get props => [shops];
}
