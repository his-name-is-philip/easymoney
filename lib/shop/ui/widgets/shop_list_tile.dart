import 'package:easymoney/core/utils/push_material_page.dart';
import 'package:easymoney/shop/domain/shop.dart';
import 'package:easymoney/shop/ui/shop_details_screen.dart';
import 'package:flutter/material.dart';

class ShopListTile extends StatelessWidget {
  final Shop shop;
  const ShopListTile({
    super.key,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushPage(context, ShopDetailsScreen(shop));
      },
      title: Text(shop.name),
      subtitle: Text(shop.address),
    );
  }
}
