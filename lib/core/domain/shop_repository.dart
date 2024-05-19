import 'package:easymoney/shop/domain/shop.dart';

abstract interface class ShopRepository {
  Future<List<Shop>> getShops();
}

final class MockShopRepository implements ShopRepository {
  @override
  Future<List<Shop>> getShops() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Shop(
        name: 'Starbucks',
        address: 'address 1',
        description: 'Have forgotten what it is exactly but okay',
        phone: '79985674323',
        email: 'someemail@gmail.com',
        imagePath: 'assets/images/starbucks_logo.png',
      ),
      Shop(
        name: 'Domino pizza',
        address: 'address 2',
        description:
            'We dont like to make pizza for you but we do like to earn money from you',
        phone: '71233213344',
        email: 'someemail@gmail.com',
        imagePath: 'assets/images/dishes.jpg',
      ),
    ];
  }
}
