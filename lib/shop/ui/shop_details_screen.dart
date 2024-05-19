import 'package:easymoney/shop/domain/shop.dart';
import 'package:easymoney/shop/ui/widgets/path_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Shop shop;

  const ShopDetailsScreen({
    super.key,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(shop.name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox(
                  height: screenHeight / 3,
                  child: Puddle(height: screenHeight / 3),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight / 3 - screenWidth / 5 - 55),
                  child: Align(
                    child: _buildCircleImage(screenWidth),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(shop.address),
                  const SizedBox(height: 16),
                  Text(shop.description),
                  const SizedBox(height: 16),
                  if (shop.phone != null) Text(shop.phone!),
                  if (shop.email != null) Text(shop.email!),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildCircleImage(double screenWidth) {
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
}
