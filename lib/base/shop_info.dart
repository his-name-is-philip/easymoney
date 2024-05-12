import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

void main() {
  Shop sh =
      Shop(name: 'abrakadabra', phoneNumber: 9876543210, color: Colors.red);
  log(sh.phoneNumber);
}

// разберись здесь с доступностью полей, добавь операции, геттеры-фигитеры
class Shop {
  Shop({
    required this.name,
    // 300`000`00`00 <= [phoneNumber] <= 999`999`99`99
    required int phoneNumber,
    required this.color,
    this.menu,
    this.imagePath,
    this.location,
  }) : _phoneNumber = phoneNumber;

  final String name;
  final (double, double)? location;

  final int _phoneNumber;

  String get phoneNumber {
    const k = 1000;
    int first3Digits = _phoneNumber ~/ (k * 10000);
    int second3Digits = _phoneNumber ~/ 10000 % k;
    int other = _phoneNumber % (10000);
    return '+7 $first3Digits-$second3Digits-$other';
  }

  final Menu? menu;
  final Color color;
  final String? imagePath;
  CurrentShopInfo? currentShopInfo;
}

// Класс содержит информацию, которая не будет кэшироваться на устройстве.
// Не все ооо будут готовы вносить актуальную информацию.
class CurrentShopInfo extends Equatable {
  const CurrentShopInfo({
    this.availableProducts,
    this.bonuses,
    this.frontman,
  });

  final int? bonuses;

  //кто сегодня за баром
  final Frontman? frontman;

  // наличие (в т.ч. стоп-лист)
  // Позже добавь настройку сохранения количества остатков
  final Set<Product>? availableProducts;

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Frontman {
  Frontman(this.name, {this.number, this.photoPath});

  final String name;
  final int? number;
  final String? photoPath;
}

class Menu {
  Menu(this.catalogs);

  final List<Catalog> catalogs;
}

class Catalog {
  Catalog(this.name, {required this.products});

  final String name;
  final List<Product> products;
}

class Product extends Equatable {
  const Product(this.name, {required this.price, required this.photoPath});

  final String name;
  final double price;
  final String? photoPath; //if null then use def photo (for view class)

  @override
  List<Object?> get props => throw UnimplementedError();
}

// это на случай добавления количества остатков
// typedef ProductAvailability = Map<Product, int>;
