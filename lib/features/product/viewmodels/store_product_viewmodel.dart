import 'package:flutter_tokonih/datasources/product_datasource.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_product_viewmodel.g.dart';

@riverpod
class StoreProductViewModel extends _$StoreProductViewModel {
  final _datasource = ProductDatasource();

  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> storeProduct(Product product) async {
    state = const AsyncLoading();

    final result = await _datasource.storeProduct(product);

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
