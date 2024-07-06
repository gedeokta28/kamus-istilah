import 'package:dio/dio.dart';
import 'package:kamus_istilah/data/models/login_response_model.dart';

abstract class ApiDataSource {
  Future<LoginResponseModel> doLogin(FormData data);
}

class ApiDataSourceImplementation implements ApiDataSource {
  final Dio dio;

  ApiDataSourceImplementation({required this.dio});

  @override
  Future<LoginResponseModel> doLogin(FormData data) async {
    String url = 'login/apicek_login';

    try {
      final response = await dio.post(
        url,
        data: data,
      );
      final model = LoginResponseModel.fromJson(response.data);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
