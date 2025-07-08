import 'package:flutter_tokonih/datasources/product_datasource.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_viewmodel.g.dart';

@Riverpod(keepAlive: true)
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
}
