import 'package:easymoney/base/shop_info.dart';
import 'package:flutter/material.dart';

class AppService implements IAppService {
  const AppService();

  @override
  Future<List<String>> loadFirst() {
    throw UnimplementedError();
  }

  @override
  Future<String> loadSecond(String dunno) {
    throw UnimplementedError();
  }

  @override
  Future<List<Shop>> loadShopList() async {
    return [
      Shop(
        name: 'Starbucks',
        phoneNumber: 9999999999,
        color: const Color(0xff006241),
        imagePath: 'assets/images/starbucks_logo.png',
      )
    ];
  }

  void _handleError(int statusCode) {
    if (statusCode == 400) {
      throw RequestFailed();
    } else if (statusCode == 403) {
      throw Forbidden();
    } else if (statusCode == 404) {
      throw NotFound();
    } else if (statusCode != 200) {
      throw UnknownException();
    }
  }
}

sealed class HttpException implements Exception {
  @override
  String toString() => switch (this) {
        RequestFailed() => 'Ошибка запроса. Проверьте параметры запроса!!',
        Forbidden() =>
          'Пользователь ограничен в доступе к указанному ресурсу!!',
        NotFound() => 'Ошибка в написании адреса Web-страницы!!',
        UnknownException() => 'Неизвестная ошибка!'
      };
}

abstract interface class IAppService {
  // эти методы заглушка. Ничего не значат.
  Future<List<String>> loadFirst();

  Future<String> loadSecond(String type);

  Future<List<Shop>> loadShopList();
}

final class RequestFailed extends HttpException {} // 400 - ошибка запроса

final class Forbidden extends HttpException {} // 403 – доступ запрещен

final class NotFound extends HttpException {} //404 – не найдено

final class UnknownException extends HttpException {} // != 200
