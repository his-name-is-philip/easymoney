import 'package:flutter/material.dart';

extension PushMaterialPage on BuildContext {
  Future<T?> pushPage<T extends Object?>(BuildContext context, Widget page) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
