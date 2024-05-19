import 'package:easymoney/shop/cubit/shop_list_cubit.dart';
import 'package:easymoney/shop/domain/shop.dart';
import 'package:easymoney/shop/ui/widgets/shop_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список заведений'),
      ),
      body: BlocBuilder<ShopListCubit, ShopListState>(
        builder: (context, state) {
          return switch (state) {
            ShopListInitial() => const SizedBox(),
            ShopListLoading() =>
              const Center(child: CircularProgressIndicator()),
            ShopListFailed() => Center(
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () =>
                            context.read<ShopListCubit>().loadShops(),
                        icon: const Icon(Icons.replay, size: 42)),
                    Text('Ошибка при загрузке заведений.\n${state.error}')
                  ],
                ),
              ),
            ShopListSuccess() => _buildShopList(state.shops),
          };
        },
      ),
    );
  }

  Widget _buildShopList(List<Shop> shops) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        itemCount: shops.length,
        itemBuilder: (context, index) {
          final shop = shops[index];
          return ShopListTile(shop: shop);
        },
      ),
    );
  }
}
