import 'package:easymoney/shop/domain/shop.dart';
import 'package:flutter/material.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Shop shop;

  const ShopDetailsScreen({
    super.key,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: Column(
        children: [
          Text(shop.address),
          const SizedBox(height: 16),
          Text(shop.description),
          const SizedBox(height: 16),
          if (shop.phone != null) Text(shop.phone!),
          if (shop.email != null) Text(shop.email!),
        ],
      ),
    );
  }
}
