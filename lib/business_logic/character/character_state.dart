part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}
final class CharacterLoading extends CharacterState {}
final class CharacterSuccess extends CharacterState {
  final List<CharacterModel> character ;

  CharacterSuccess({required this.character});
}
final class CharacterFailure extends CharacterState {
  final String errMessage ;

  CharacterFailure({required this.errMessage});
  
}
