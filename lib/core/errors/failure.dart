import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WrongCredentialFailure extends Failure {
  final String message;

  WrongCredentialFailure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
