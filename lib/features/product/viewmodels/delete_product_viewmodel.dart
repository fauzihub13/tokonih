import 'package:flutter_tokonih/datasources/product_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_product_viewmodel.g.dart';

@riverpod
class DeleteProductViewModel extends _$DeleteProductViewModel {
  final _datasource = ProductDatasource();

  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> deleteProduct(int id) async {
    state = const AsyncLoading();

    final result = await _datasource.deleteProduct(id);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (message) {
        state = const AsyncData(true);
      },
    );
  }
}
