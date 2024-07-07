import 'package:dio/dio.dart';
import 'package:kamus_istilah/domain/usecases/do_register.dart';
import 'package:kamus_istilah/presentation/providers/form_provider.dart';
import 'package:kamus_istilah/presentation/state/register_state.dart';
import 'package:kamus_istilah/utility/failures.dart';
import 'package:kamus_istilah/utility/helper.dart';
import 'package:kamus_istilah/utility/injection.dart';
import 'package:kamus_istilah/utility/session_helper.dart';

class RegisterProvider extends FormProvider {
  final DoRegister doRegister;
  final session = locator<Session>();

  RegisterProvider({required this.doRegister});

  Stream<RegisterState> doRegisterApi() async* {
    showLoading();
    yield RegisterLoading();
    FormData formData = FormData.fromMap({
      'username': usernameController.text,
      'nama_lengkap': fullNameController.text,
      'password': passwordController.text
    });

    final loginResult = await doRegister.call(formData);
    yield* loginResult.fold((failure) async* {
      dismissLoading();
      yield RegisterFailure(failure: ServerFailure(message: failure.message));
    }, (result) async* {
      if (result.status == 'failed') {
        dismissLoading();
        yield RegisterFailure(failure: const ServerFailure());
      } else {
        dismissLoading();
        yield RegisterSuccess(data: result);
      }
    });
  }
}
