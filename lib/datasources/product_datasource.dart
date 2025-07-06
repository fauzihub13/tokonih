import 'package:dartz/dartz.dart';
import 'package:flutter_tokonih/core/error/failure.dart';
import 'package:flutter_tokonih/core/network/api_service.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:flutter_tokonih/models/response/detail_product_response_model.dart';

class ProductDatasource {
  final ApiService _apiService = ApiService.instance;

  Future<Either<Failure, AllProductResponseModel>> getAllProduct() async {
    final response = await _apiService.request(
      endpoint: '/products',
      method: DioMethod.get,
    );
    if (response.statusCode == 200) {
      // print('dari source berhasil-----------------------------------------');
      return Right(AllProductResponseModel.fromMap(response.data));
    } else {
      // print('dari source gagal');
      return Left(Failure(message: 'Failed to get products, please try again'));
    }
  }

  Future<Either<Failure, DetailProductResponseModel>> getDetailProduct(
    int productId,
  ) async {
    final response = await _apiService.request(
      endpoint: '/products/$productId',
      method: DioMethod.get,
    );
    if (response.statusCode == 200) {
      return Right(DetailProductResponseModel.fromMap(response.data));
    } else {
      return Left(
        Failure(message: 'Failed to get detail product, please try again'),
      );
    }
  }

  Future<Either<Failure, String>> storeProduct() async {
    final response = await _apiService.request(
      endpoint: '/products/add',
      method: DioMethod.post,
    );
    if (response.statusCode == 200) {
      return Right('Success add new product');
    } else {
      return Left(
        Failure(message: 'Failed to get add new product, please try again'),
      );
    }
  }

  Future<Either<Failure, String>> updateProduct(int productId) async {
    final response = await _apiService.request(
      endpoint: '/products/$productId',
      method: DioMethod.put,
    );
    if (response.statusCode == 200) {
      return Right('Success edit product');
    } else {
      return Left(
        Failure(message: 'Failed to get edit product, please try again'),
      );
    }
  }

  Future<Either<Failure, String>> deleteProduct(int productId) async {
    final response = await _apiService.request(
      endpoint: '/products/$productId',
      method: DioMethod.delete,
    );
    if (response.statusCode == 200) {
      return Right('Success delete product');
    } else {
      return Left(
        Failure(message: 'Failed to get detail product, please try again'),
      );
    }
  }
}
