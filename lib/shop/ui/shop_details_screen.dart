import 'package:easymoney/injection.dart';
import 'package:easymoney/main.dart';
import 'package:easymoney/shop/domain/shop.dart';
import 'package:easymoney/shop/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/shop_details_cubit.dart';

class ShopDetailsScreen extends StatelessWidget implements Cubited {
  const ShopDetailsScreen(this.shop, {super.key});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context);
//https://stackoverflow.com/questions/59321479/design-this-animation-using-sliverappbar-flutter/59323713#59323713
    return Scaffold(
      body: BlocBuilder<ShopDetailsCubit, ShopDetailsState>(
          builder: (context, state) {
        return CustomScrollView(
          slivers: [
            DetailsHeader(
              shop: shop,
              screenSize: (width, height),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (shop.phone != null)
                        ListTile(
                          title: Text(shop.phone!),
                          subtitle: const Text('Phone number'),
                        ),
                      if (shop.phone != null)
                        ListTile(
                          title: Text(shop.email!),
                          subtitle: const Text('E-mail'),
                        ),
                      ListTile(
                        title: Text(shop.address),
                        subtitle: const Text('Address'),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height / 4,
                        color: const Color(0xff666666),
                        child: const Center(
                          child: Text('Menu'),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height / 4,
                        color: const Color(0xff666666),
                        child: const Center(
                          child: Text('Map'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverFillRemaining()
          ],
        );
      }),
    );
  }

  Widget _buildCircleImage(ShopDetailsState state, double screenWidth) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipOval(
          child: Container(
            height: screenWidth / 2.5,
            width: screenWidth / 2.5,
            color: Colors.white,
          ),
        ),
        ClipOval(
          child: SizedBox(
            height: screenWidth / 2.5 - 5,
            width: screenWidth / 2.5 - 5,
            child: Image.asset(
              shop.imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  @override
  BlocProvider<ShopDetailsCubit> buildBlocProvider() {
    return BlocProvider<ShopDetailsCubit>(
      create: (context) => getIt(param1: shop),
      child: this,
    );
  }
}
