import 'package:equatable/equatable.dart';
import 'package:kamus_istilah/data/models/register_response_model.dart';
import 'package:kamus_istilah/utility/failures.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponseModel data;
  RegisterSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class RegisterFailure extends RegisterState {
  final ServerFailure failure;

  RegisterFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
