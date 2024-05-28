import 'dart:math';
import 'dart:ui';

import 'package:easymoney/shop/domain/shop.dart';
import 'package:easymoney/shop/ui/widgets/path_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'package:easymoney/shop/ui/widgets/shop_card.dart';

part 'package:easymoney/shop/ui/widgets/shop_logo_widget.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    super.key,
    required Shop shop,
    required (double, double) screenSize,
  })  : _shop = shop,
        _screenSize = screenSize;
  final Shop _shop;

  //width & height
  final (double, double) _screenSize;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: DetailsHeaderDelegate(
        minExtent: _screenSize.$2 * 0.12,
        maxExtent: _screenSize.$2 * 0.5,
        shop: _shop,
        screenWidth: _screenSize.$1,
      ),
    );
  }
}

// <------------------------------------------------------------------------->
class DetailsHeaderDelegate implements SliverPersistentHeaderDelegate {
  DetailsHeaderDelegate({
    required Shop shop,
    required this.minExtent,
    required this.maxExtent,
    required double screenWidth,
  })  : _screenX = screenWidth,
        _shop = shop;

  final double _screenX;
  final Shop _shop;

  //preferences
  static const _cardHeightPortion = 0.35;
  static const _cardWidthPortion = 0.85;
  static const _diagonalStartHeightPortion = 0.25;
  static const _cuttingPortion = 0.18;
  static const _cardBottomPortion = 0.16;
  static const _logoPortion = 0.6;
  static const _scaleStop = 0.3;
  static const _logoFramePortion = 0.07;

  //здесь используются только постоянные величины
  double get _cardHeight => maxExtent * _cardHeightPortion;

  double get _cardWidth => _screenX * _cardWidthPortion;

  double get _diagonalStartHeight => maxExtent * _diagonalStartHeightPortion;

  double get _cutting => _screenX * _cuttingPortion;

  double get _logoMaxSize => _cardHeight * _logoPortion;

  double get _cardBottomPadding => maxExtent * _cardBottomPortion;

  double get _logoFrame => _logoMaxSize * _logoFramePortion;

  //непостоянные
  double _scaleFormula(double shrink) {
    final pre = (1 - (shrink * shrink) / (maxExtent * maxExtent));
    return max(pre, _scaleStop);
  }

  //нужна ли тут проверка
  double _diagonalEaveFormula(double shrinkOffset) =>
      lerpDouble(0, _diagonalStartHeight, 1 - shrinkOffset / maxExtent)!;

  double _opacityFormula(double shrink) {
    if (maxExtent - shrink > _cardBottomPadding) {
      return 0;
    } else {
      return 1 - (maxExtent - shrink) / _cardBottomPadding;
    }
  }

  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(BuildContext context, double shrink, bool overlapsContent) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        // region bg
        Positioned(
          height: maxExtent - _diagonalStartHeight,
          left: 0,
          right: 0,
          bottom: _diagonalEaveFormula(shrink),
          child: Image.asset(
            _shop.imagePath,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
        ),
        //endregion
        // region gradient
        //todo с ним что-то надо сделать, он не располагается
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        //endregion
        // region diagonal
        DiagonalPiece(
          overallHeight: _diagonalEaveFormula(shrink) + _cutting,
          cutting: _cutting,
          color: Colors.grey,
        ),
        //endregion

        Transform.translate(
          offset: Offset(0, -1 * _cardBottomPadding),
          child: ShopCard(this),
        ),
        //logo
        Positioned(
          bottom: _cardHeight -
              (0.5 * _logoMaxSize + _logoFrame) +
              _cardBottomPadding,
          child: Transform.scale(
            alignment: AlignmentDirectional.center,
            scale: _scaleFormula(shrink), //todo
            child: ShopLogoWidget(this),
          ),
        ),
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   right: 0,
        //   height: minExtent,
        //   child: Container(
        //     color: Colors.red.withOpacity(_opacityFormula(shrink)),
        //   ),
        // )
      ],
    );
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; //надо проверить
  }
}
