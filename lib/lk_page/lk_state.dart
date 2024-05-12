part of 'package:easymoney/lk_page/lk_cubit.dart';

class LkState extends Equatable {
  final bool loading;

  const LkState({required this.loading});

  factory LkState.initial() => const LkState(loading: false);

  LkState copyWith({bool? loading}) => LkState(
        loading: loading ?? this.loading,
      );

  @override
  List<Object?> get props => [loading];
}
