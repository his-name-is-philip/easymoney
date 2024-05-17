import 'package:easymoney/injection.dart';
import 'package:easymoney/shop/cubit/shop_list_cubit.dart';
import 'package:easymoney/shop/ui/shop_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupGetIt();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopListCubit>(
            create: (context) => getIt.get()..loadShops()),
      ],
      child: const MaterialApp(
        home: ShopListScreen(),
      ),
    );
  }
}
