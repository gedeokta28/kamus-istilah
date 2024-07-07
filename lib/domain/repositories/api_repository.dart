import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kamus_istilah/data/models/login_response_model.dart';
import 'package:kamus_istilah/data/models/register_response_model.dart';
import 'package:kamus_istilah/utility/failures.dart';

abstract class ApiRepository {
  Future<Either<Failure, LoginResponseModel>> doLogin(FormData data);
  Future<Either<Failure, RegisterResponseModel>> doRegister(FormData data);
}
