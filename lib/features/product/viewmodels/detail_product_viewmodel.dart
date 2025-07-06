import 'package:flutter_tokonih/datasources/product_datasource.dart';
import 'package:flutter_tokonih/models/response/detail_product_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_product_viewmodel.g.dart';


@riverpod
class DetailProductViewmodel extends _$DetailProductViewmodel {
  final _datasource = ProductDatasource();

  @override
  FutureOr<DetailProductResponseModel?> build() async {
    return null;
  }

  Future<void> getDetailProduct(int id) async {
    state = const AsyncLoading();
    final result = await _datasource.getDetailProduct(id);
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