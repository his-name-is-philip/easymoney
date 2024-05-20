import 'package:easymoney/core/ui/visit_card_widget/visit_card_widget.dart';
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
          const SizedBox(height: 32),
          Center(
              child: VisitCardWidget(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.all(16.0).add(const EdgeInsets.only(top: 80)),
            visitAmount: 12,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
