// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easymoney/base/app.dart';
import 'package:easymoney/base/injection.dart';
import 'package:easymoney/base/navigation_cubit.dart';
import 'package:easymoney/base/shop_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:easymoney/shop_page/_.dart';

class ShopPage extends StatelessWidget implements Cubited {
  const ShopPage({super.key}); // передать что-нибудь, что будет final

  // final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
      final the = state.shop;
      final theme = Theme.of(context);
      return PopScope(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                // pinned: true,
                // forceMaterialTransparency: true,
                stretch: true,
                shape: SquircleBorder(
                  radius: BorderRadius.all(Radius.circular(40.0)),
                ),
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(the.name),
                  stretchModes: const [StretchMode.blurBackground],
                  background: Image.asset(
                    the.imagePath ?? 'assets/images/dishes.jpg',
                    color: the.color,
                    colorBlendMode: BlendMode.dstOver,
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
                      Text('инфа о сотруднике'),
                      Text('сколько баллов'),
                      Text(the.phoneNumber),
                      Text('меню'),
                      Text('карта'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: const FloatingActionButton(
            onPressed: null,
            tooltip: 'dunno',
            child: Icon(Icons.add),
          ),
        ),
      );
    });
  }

  @override
  blocProvider() {
    return BlocProvider<ShopCubit>(
      create: (context) {
        var selectedShop = context.read<NavigationCubit>().state.clickedShop;
        assert(selectedShop != null);
        return getIt.get(param1: selectedShop);
      },
      child: this,
    );
  }
}
