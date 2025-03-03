import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UsrState> {
  Repo _repo ;
  UserCubit(this._repo) : super(UserInitial());

login(String username, String password) async {
    emit(UsrLoading());
    try {
      final user = await _repo.login(username, password);
      emit(UsrSuccess(user));
    } catch (e) {
      emit(UsrFailure(e.toString()));
    }
  }
}
