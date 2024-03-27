import 'package:dio/dio.dart';
import 'package:eastern_dragon/core/common/data/exceptions/success_false.dart';
import 'package:eastern_dragon/core/common/domain/services/executor.dart';
import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/features/cart/data/cart_model.dart';
import 'package:eastern_dragon/features/cart/domain/test_cart_model.dart';
import 'package:elementary_helper/elementary_helper.dart';

class CartRepository {
  final RequestHelper requestHelper;

  final Executor executor;

  CartRepository({
    required this.requestHelper,
    required this.executor,
  });

  ListenableState<CartModel> get cartListenable => _cartState;

  final _cartState = StateNotifier<CartModel>();

  // CartProductModel? getCartProductByProductId(int productId) {
  //   return _cartState.value?.items.firstWhereOrNull(
  //     (e) => e.product.id == productId,
  //   );
  // }

  Future<void> loadCart() async {
    await executor.execute<CartModel>(
      () async {
        // return requestHelper.getObject<CartModel>(
        //   '/user/cart/list',
        //   fromJson: CartModel.fromJson,
        // );
        await Future.delayed(const Duration(seconds: 1));
        
        return testCartModel;
      },
      onSuccess: _cartState.accept,
      onError: (e) {
        throw SuccessFalse(e.title, e.stackTrace);
      },
    );
  }

  Future<void> addProductToCart({
    required int id,
    required int quantity,
  }) async {
    await executor.execute<CartModel>(
      () => requestHelper.postObject(
        '/user/cart/add',
        fromJson: CartModel.fromJson,
        data: FormData.fromMap(
          <String, dynamic>{
            'productId': id,
            'quantity': quantity,
          },
        ),
      ),
      onSuccess: _cartState.accept,
      onError: (e) {
        throw SuccessFalse(e.title, e.stackTrace);
      },
    );
  }

  Future<void> clearCart() async {
    await executor.execute<CartModel>(
      () => requestHelper.getObject(
        '/user/cart/clear',
        fromJson: CartModel.fromJson,
      ),
      onSuccess: _cartState.accept,
      onError: (e) {
        throw SuccessFalse(e.title, e.stackTrace);
      },
    );
  }

  Future<void> changeProductQuantity({
    required int id,
    required int quantity,
  }) async {
    await executor.execute<CartModel>(
      () => requestHelper.postObject(
        '/user/cart/upd/$id',
        fromJson: CartModel.fromJson,
        data: FormData.fromMap(
          <String, dynamic>{
            'quantity': quantity,
          },
        ),
      ),
      onSuccess: _cartState.accept,
      onError: (e) {
        throw SuccessFalse(e.title, e.stackTrace);
      },
    );
  }

  Future<void> removeProductFromCart({
    required int id,
  }) async {
    await executor.execute<CartModel>(
      () => requestHelper.getObject(
        '/user/cart/del/$id',
        fromJson: CartModel.fromJson,
      ),
      onSuccess: _cartState.accept,
      onError: (e) {
        throw SuccessFalse(e.title, e.stackTrace);
      },
    );
  }

  /// Используется при изменении авторизации на `false`
  void resetCart() {
    _cartState.accept(CartModel.empty());
  }
}
