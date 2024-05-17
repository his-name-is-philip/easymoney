import 'package:easymoney/core/domain/shop_repository.dart';
import 'package:easymoney/shop/cubit/shop_list_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Repo
  getIt.registerFactory<ShopRepository>(() => MockShopRepository());

  // Cubits&Blocs
  getIt.registerFactory<ShopListCubit>(() => ShopListCubit(getIt.get()));
}
