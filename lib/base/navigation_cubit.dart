import 'package:easymoney/base/app.dart';
import 'package:easymoney/base/shop_info.dart';
import 'package:easymoney/lk_page/_.dart';
import 'package:easymoney/shop_page/shop_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit({NavigationState? state})
      : super(state ?? const NavigationState(pages: []));

  //from home screen
  void goToShop(Shop shop) {
    //todo добавь проверки
    var pageList = [...state.pages, const ShopPage()];
    var newState = NavigationState(pages: pageList, clickedShop: shop);
    emit(newState);
  }

  //from home screen
  void goToLk() {
    var pageList = [...state.pages, const LkPage(title: '')];
    var newState = NavigationState(pages: pageList);
    emit(newState);
  }

  void popPage() =>
      emit(NavigationState(pages: [...(state.pages)..removeLast()]));
}

class NavigationState extends Equatable {
  const NavigationState({
    required this.pages,
    this.clickedShop,
  });

  final List<Cubited> pages;
  final Shop? clickedShop;

  @override
  List<Object?> get props => [pages, clickedShop];
}
