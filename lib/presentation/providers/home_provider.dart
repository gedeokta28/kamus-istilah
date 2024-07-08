import 'package:kamus_istilah/data/models/istilah_response_model.dart';
import 'package:kamus_istilah/domain/usecases/get_istilah.dart';
import 'package:kamus_istilah/presentation/providers/form_provider.dart';
import 'package:kamus_istilah/presentation/state/istilah_state.dart';
import 'package:kamus_istilah/utility/failures.dart';
import 'package:kamus_istilah/utility/helper.dart';

class HomeProvider extends FormProvider {
  final GetIstilah getIstilah;

  HomeProvider({required this.getIstilah});

  Stream<IstilahState> getIstilahApi() async* {
    showLoading();
    yield IstilahLoading();

    final istilahResult = await getIstilah.call();
    yield* istilahResult.fold((failure) async* {
      dismissLoading();
      yield IstilahFailure(failure: ServerFailure(message: failure.message));
    }, (result) async* {
      List<IstilahData> istilahData = result.data;
      istilahData.sort((a, b) {
        return a.namaIstilah
            .toLowerCase()
            .compareTo(b.namaIstilah.toLowerCase());
      });
      dismissLoading();
      yield IstilahSuccess(data: istilahData);
    });
  }
}
