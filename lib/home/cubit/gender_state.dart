part of 'gender_cubit.dart';

@immutable
sealed class GenderState {}

final class GenderInitial extends GenderState {}
final class GenderLoading extends GenderState {
}
final class GenderSuccess extends GenderState {
  final Gender gender;

  GenderSuccess(this.gender);
}
final class GenderFailure extends GenderState {
  final String msg;

  GenderFailure(this.msg);
}