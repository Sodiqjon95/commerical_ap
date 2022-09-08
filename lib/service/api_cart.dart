// import 'dart:convert';
//
// import 'package:commerical_ap/models/cart/cart_products.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as https;
//
// class CartApiProvider {
//   // Serverdan barcha cartlarni olib keladi
//
//   Future<List<CartProductsItem>> getCartsList() async {
//     try {
//       Response response =
//       await https.get(Uri.parse("https://fakestoreapi.com/carts"));
//       if (response.statusCode == 200) {
//         List<CartProductsItem> products = (jsonDecode(response.body) as List?)
//             ?.map((item) => CartProductsItem.fromJson(item))
//             .toList() ??
//             [];
//         return products;
//       } else {
//         throw Exception();
//       }
//     } catch (e) {
//       print(e.toString());
//       throw Exception(e);
//     }
//   }
//
//   //Serverdan bergan sonimizcha cart olib keladi
//   Future<List<CartProductsItem>> getLimitedList({required limitedCount}) async {
//     try {
//       Response response = await https.get(
//           Uri.parse("https://fakestoreapi.com/carts?limit=$limitedCount"));
//       if (response.statusCode == 200) {
//         List<CartProductsItem> carts = (jsonDecode(response.body) as List?)
//             ?.map((item) => CartProductsItem.fromJson(item))
//             .toList() ??
//             [];
//         return carts;
//       } else {
//         throw Exception();
//       }
//     } catch (e) {
//       print(e.toString());
//       throw Exception(e);
//     }
//   }
// }
