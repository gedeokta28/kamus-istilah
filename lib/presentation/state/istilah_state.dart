import 'package:equatable/equatable.dart';
import 'package:kamus_istilah/data/models/istilah_response_model.dart';
import 'package:kamus_istilah/utility/failures.dart';

abstract class IstilahState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IstilahLoading extends IstilahState {}

class IstilahSuccess extends IstilahState {
  final List<IstilahData> data;
  IstilahSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class IstilahFailure extends IstilahState {
  final ServerFailure failure;

  IstilahFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
