import 'package:easymoney/base/loader.dart';
import 'package:easymoney/base/navigation_cubit.dart';
import 'package:easymoney/base/shop_info.dart';
import 'package:get_it/get_it.dart';
import 'package:easymoney/home_page/_.dart';
import 'package:easymoney/shop_page/_.dart';
import 'package:easymoney/lk_page/_.dart';

final GetIt getIt = GetIt.instance;

void initializeInjection() {
  // Cubits
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt.get()));
  getIt.registerFactoryParam<ShopCubit, Shop, void>((shop, _) {
    return ShopCubit(getIt.get(), shop);
  });
  getIt.registerFactory<LkCubit>(() => LkCubit(getIt.get()));

  // Services
  getIt.registerFactory<IAppService>(() => const AppService());
}
