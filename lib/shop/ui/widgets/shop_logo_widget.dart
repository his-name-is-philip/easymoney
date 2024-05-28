part of 'package:easymoney/shop/ui/widgets/header.dart';

class ShopLogoWidget extends StatelessWidget {
  const ShopLogoWidget(this._, {super.key});

  final DetailsHeaderDelegate _;

  @override
  Widget build(BuildContext context) {
    final size = _._logoMaxSize + _._logoFrame * 2;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: ArcXXX(
            radius: _._logoFrame,
            color: const Color(0xBBFFFFFF),
            blur: 5,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: _._logoFrame),
          child: SizedBox(
            height: _._logoMaxSize,
            width: _._logoMaxSize,
            child: ClipOval(
              child: Image.asset(
                _._shop.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
