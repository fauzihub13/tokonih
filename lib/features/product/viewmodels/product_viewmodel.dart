import 'package:flutter_tokonih/datasources/product_datasource.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_viewmodel.g.dart';

@riverpod
class ProductViewmodel extends _$ProductViewmodel {
  final _datasource = ProductDatasource();

  @override
  FutureOr<AllProductResponseModel?> build() async {
    return null;
  }

  Future<void> getAllProduct() async {
    final result = await _datasource.getAllProduct();
    state = AsyncValue.loading();
    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }

  Future<bool> storeProduct() async {
    state = const AsyncLoading();
    final result = await _datasource.storeProduct();
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (msg) async {
        await getAllProduct();
        return true;
      },
    );
  }

  Future<bool> updateProduct(int id) async {
    state = const AsyncLoading();
    final result = await _datasource.updateProduct(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (msg) async {
        await getAllProduct();
        return true;
      },
    );
  }

  Future<bool> deleteProduct(int id) async {
    state = const AsyncLoading();
    final result = await _datasource.deleteProduct(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (msg) async {
        await getAllProduct();
        return true;
      },
    );
  }
}
