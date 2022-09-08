import 'package:commerical_ap/global_widgets/info_widget.dart';
import 'package:commerical_ap/models/users/user_item.dart';
import 'package:commerical_ap/screens/tab/carts_page/widgets/carts_page_shimmer.dart';
import 'package:commerical_ap/screens/tab/carts_page/widgets/carts_widget.dart';
import 'package:commerical_ap/utiles/my_text_stile.dart';
import 'package:flutter/material.dart';
import '../../../models/cart/get_all_cart.dart';
import '../../../models/product/product_item.dart';
import '../../../repository/repository.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({Key? key, required this.myRepository}) : super(key: key);
  final MyRepository myRepository;

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  late List<CartItem> carts = [];
  List<ProductItem> products = [];
  List<UserItem> users = [];
  bool isLoaded = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

//List<CartItem> shartmas buni metodda qaytarish
  Future<void> _init() async {
//     // carts = await widget.myRepository.getAllCarts();
//     // products = await widget.myRepository.getAllProducts();
//     // users = await widget.myRepository.getAllUsers();
//     setState(() {});
//   }
    isLoaded = true;
    final getTotals = await Future.wait(
      [
        widget.myRepository.getAllCarts(),
        widget.myRepository.getAllProducts(),
        widget.myRepository.getAllUsers(),
      ],
    );
    carts = getTotals[0] as List<CartItem>;
    products = getTotals[1] as List<ProductItem>;
    users = getTotals[2] as List<UserItem>;

    isLoaded = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Carts Screen",
          style: MyTextStyle.interSemiBold600.copyWith(color: Colors.black, fontSize: 18),
        ),
      ),
      body: ListView(
        children: List.generate(
          carts.length,
          (index) => Column(
            children: [
              // Text(carts[index].userId.toString()),
              // Text(products[index].price.toString()),
              // Text(users[index].username),
              Visibility(
                visible: !isLoaded,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ProductInfo(
                        productItem: products[index],
                      );
                    }));
                  },
                  child: CartsWidget(
                      usersPassword: users[index].password,
                      userName: users[index].username,
                      cartsDate: carts[index].date,
                      cartsProductsQuantity: carts[index].products[0].quantity,
                      productImage: products[index].image,
                      productsPrice: products[index].price,
                      userEmail: users[index].email,
                      userLong: users[index].addressItem.geolocation.long,
                      usersLat: users[index].addressItem.geolocation.lat,
                      usersPhone: users[index].phone,
                      userStreet: users[index].addressItem.street),
                ),
              ),
              Visibility(
                visible: isLoaded,
                child: const CartsGridShimmer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
