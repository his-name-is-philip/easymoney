import 'package:easymoney/base/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easymoney/home_page/_.dart';
import 'package:easymoney/base/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(primaryColor: Colors.deepPurple),
      home: BlocProvider<NavigationCubit>(
        create: (context) => getIt.get(),
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return Navigator(
              pages: [
                MaterialPage(
                  child: const HomePage(title: 'def title').blocProvider(),
                ),
                ...state.pages.map(
                  (page) => MaterialPage(
                    child: page.blocProvider(),
                  ),
                ),
              ],
              onPopPage: (route, result) {
                context.read<NavigationCubit>().popPage();
                return route.didPop(result);
              },
            );
          },
        ),
      ),
    );
  }
}

abstract interface class Cubited {
  blocProvider();
}

// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // debugPaintSizeEnabled = true;
//     return MaterialApp(
//       theme: Theme.of(context).copyWith(primaryColor: Colors.deepPurple),
//       home: MultiBlocProvider(
//         providers: [
//           // припилить сюда восстановление после закрытия приложения todo
//           BlocProvider<NavigationCubit>(create: (context) => getIt.get()),
//           BlocProvider<HomeCubit>(create: (context) => getIt.get()),
//           BlocProvider<ShopCubit>(create: (context) => getIt.get()),
//           BlocProvider<LkCubit>(create: (context) => getIt.get()),
//         ],
//         child: BlocBuilder<NavigationCubit, NavigationState>(
//             builder: (context, state) {
//           return Navigator(
//             pages: state.pages.map((e) => MaterialPage(child: e)).toList(),
//             onPopPage: (route, result) {
//               getIt.get<NavigationCubit>().popPage();
//               return route.didPop(result);
//             },
//           );
//         }),
//       ),
//     );
//
//     /*return MaterialApp(
//       debugShowCheckedModeBanner: true,
//       initialRoute: '/home',
//       routes: {
//         '/home': (context) => BlocProvider<HomeCubit>(
//               create: (context) => getIt.get(),
//               child: const HomePage(title: 'Def txt'),
//             ),
//         '/shop': (context) => BlocProvider<ShopCubit>(
//               create: (context) => getIt.get(),
//               child: const ShopPage(title: 'Purchasable page'),
//             ),
//         '/lk': (context) => BlocProvider<LkCubit>(
//               create: (context) => getIt.get(),
//               child: const HomePage(title: 'Def txt'),
//             ),
//       },
//     );*/
//   }
// }
