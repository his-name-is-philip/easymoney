part of 'package:easymoney/home_page/home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.shops,
    required this.loading,
  });

  factory HomeState.initial() => const HomeState(loading: false, shops: []);

  final bool loading;
  final List<Shop> shops;

  HomeState copyWith({bool? loading, List<Shop>? shops}) => HomeState(
        loading: loading ?? this.loading,
        shops: shops ?? this.shops,
      );

  @override
  List<Object?> get props => [loading];
}
