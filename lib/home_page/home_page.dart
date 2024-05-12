// ignore_for_file: prefer_const_constructors

import 'package:easymoney/base/app.dart';
import 'package:easymoney/base/injection.dart';
import 'package:easymoney/base/navigation_cubit.dart';
import 'package:easymoney/base/shop_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:easymoney/home_page/_.dart';

class HomePage extends StatelessWidget implements Cubited {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var theme = Theme.of(context);

      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // pinned: true,
              // forceMaterialTransparency: true,
              stretch: true,

              shape: SquircleBorder(
                radius: BorderRadius.all(Radius.circular(40.0)),
              ),
              backgroundColor: Colors.white10,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(title,
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.black)),
                stretchModes: const [StretchMode.blurBackground],
                background: Image(
                  image: AssetImage('assets/images/dishes.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () =>
                          context.read<HomeCubit>().goToLk(context),
                      child: Text('account'),
                    ),
                    SizedBox(height: 50),
                    for (final (index, e) in state.shops.indexed)
                      TextButton(
                        onPressed: () => context
                            .read<HomeCubit>()
                            .goToShopAt(context, index),
                        child: Text(e.name),
                      ),
                    SizedBox(height: 50),
                    Text([for (int i = 0; i < 200; i++) '$i$i$i$i$i$i$i$i$i']
                        .join('\n')),
                  ],
                ),
              ),
            ),
          ],
        ),

        /*SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Image.asset('assets/images/dishes.jpg'),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                height: height,
                child: Container(
                  constraints: BoxConstraints(minHeight: height),
                  height: height,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ),*/
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          tooltip: 'dunno',
          child: Icon(Icons.add),
        ),
      );
    });
  }

  @override
  blocProvider() {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt.get()..loadShops(),
      child: this,
    );
  }
}
