import 'package:dartz/dartz.dart';
import 'package:kamus_istilah/data/models/istilah_response_model.dart';
import 'package:kamus_istilah/domain/repositories/api_repository.dart';
import 'package:kamus_istilah/utility/failures.dart';

abstract class IstilahUseCase<Type> {
  Future<Either<Failure, IstilahResponseModel>> call();
}

class GetIstilah implements IstilahUseCase<String> {
  final ApiRepository repository;

  GetIstilah({required this.repository});

  @override
  Future<Either<Failure, IstilahResponseModel>> call() async {
    final result = await repository.getDaftarIstilah();
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }
}
