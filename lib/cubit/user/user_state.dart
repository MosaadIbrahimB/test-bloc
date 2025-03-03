part of 'user_cubit.dart';

@immutable
sealed class UsrState {}

final class UserInitial extends UsrState {}


class UsrFailure extends UsrState{
  String error;
  UsrFailure(this.error);
}

class UsrSuccess extends UsrState{
  User user;
  UsrSuccess(this.user);
}

class UsrLoading extends UsrState{
}

