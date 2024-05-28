part of 'package:easymoney/shop/ui/widgets/header.dart';

class ShopCard extends StatelessWidget {
  const ShopCard(this._s, {super.key});

  final DetailsHeaderDelegate _s;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return FittedBox(
      fit: BoxFit.none,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)), //todo
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: _s._cardHeight,
            width: _s._cardWidth,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(15)), //todo constant it
              color: Color(0xBBFFFFFF),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, _s._logoMaxSize / 2, 30, 15),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    _s._shop.name,
                    style: theme.headlineSmall!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 2),
                  Text(
                    _s._shop.description,
                    textAlign: TextAlign.center,
                    style: theme.bodySmall,
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
