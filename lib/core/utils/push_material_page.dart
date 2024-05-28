import 'package:easymoney/main.dart';
import 'package:flutter/material.dart';

extension PushMaterialPage on BuildContext {
  Future<T?> pushPage<T>(BuildContext context, Cubited cubitPage) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => cubitPage.buildBlocProvider()),
    );
  }
}
