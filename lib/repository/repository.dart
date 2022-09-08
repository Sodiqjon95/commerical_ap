import 'package:commerical_ap/local_database/storage.dart';
import 'package:commerical_ap/models/cart/get_all_cart.dart';
import 'package:commerical_ap/models/product/product_item.dart';
import 'package:commerical_ap/models/users/user_item.dart';
import 'package:commerical_ap/service/api_cart.dart';

import '../local_database/local_database.dart';
import '../service/api_provider.dart';

class MyRepository {
  MyRepository({
    required this.apiProvider,
    required this.localDatabase,
    required this.myStorage,
    // required this.cartApiProvider

  });

  final ApiProvider apiProvider;
  final LocalDatabase localDatabase;
  final MyStorage myStorage;
  // final CartApiProvider cartApiProvider;

  Future<List<ProductItem>> getAllProducts() => apiProvider.getProductsList();
  Future<List<ProductItem>> getSpecificCategoryProducts(String categoryName) => apiProvider.getSpecificCategoryProducts(categoryName: categoryName);

  Future<ProductItem> getSingleProduct(int productId) =>
      apiProvider.getSingleProduct(productId: productId);

  Future<ProductItem> addProductToServer(ProductItem productItem) =>
      apiProvider.addNewProductToServer(productItem: productItem);

  Future<List<String>> getAllCategories() =>
      apiProvider.getAllCategories();

  Future<String> loginUser({required String userName, required String password}) =>
      apiProvider.loginUser(userName: userName, password: password);

  Future<List<CartItem>> getAllCarts() =>
      apiProvider.getAllCarts();

  Future<List<UserItem>> getAllUsers() =>
      apiProvider.getAllUsers();
}

