import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kamus_istilah/data/datasources/api_data_source.dart';
import 'package:kamus_istilah/data/models/login_response_model.dart';
import 'package:kamus_istilah/domain/repositories/api_repository.dart';
import 'package:kamus_istilah/utility/failures.dart';

class ApiRepoImpl implements ApiRepository {
  final ApiDataSource dataSource;

  ApiRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, LoginResponseModel>> doLogin(FormData formData) async {
    try {
      final data = await dataSource.doLogin(formData);
      return Right(data);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
