import 'package:easymoney/base/loader.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:easymoney/lk_page/lk_state.dart';

class LkCubit extends Cubit<LkState> {
  final IAppService _service;
  LkCubit(this._service) : super(LkState.initial());
}
