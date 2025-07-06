import 'package:flutter_tokonih/datasources/auth_datasource.dart';
import 'package:flutter_tokonih/models/response/login_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewmodel extends _$AuthViewmodel {
  @override
  FutureOr<LoginResponseModel?> build() {
    return null;
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final result = await AuthDatasource().login(
      username: username,
      password: password,
    );
    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (loginModel) {
        state = AsyncValue.data(loginModel);
      },
    );
  }
}
