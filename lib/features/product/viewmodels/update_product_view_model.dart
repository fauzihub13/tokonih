import 'package:flutter_tokonih/datasources/product_datasource.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_product_view_model.g.dart';

@riverpod
class UpdateProductViewModel extends _$UpdateProductViewModel {
  final _datasource = ProductDatasource();

  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> updateProduct(Product product) async {
    state = const AsyncLoading();

    final result = await _datasource.updateProduct(product);

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
