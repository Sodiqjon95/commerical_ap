import 'package:commerical_ap/global_widgets/info_widget.dart';
import 'package:commerical_ap/global_widgets/menu_widget.dart';
import 'package:commerical_ap/models/product/product_item.dart';
import 'package:commerical_ap/repository/repository.dart';
import 'package:commerical_ap/screens/tab/home_page/widgets/product_page_shimmer.dart';
import 'package:commerical_ap/utiles/my_text_stile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.myRepository}) : super(key: key);

  final MyRepository myRepository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  List<ProductItem> products = [];
  List<String> categories = [];
  bool isLoaded = true;


  @override
  void initState() {
    _init();
    super.initState();
  }

  void updateUI(String categoryName) async {
    isLoaded = true;
    products = await widget.myRepository.getSpecificCategoryProducts(categoryName);
    isLoaded = false;
    setState(() {});
  }

  void _init() async {
    //1-usul
    // categories = await widget.myRepository.getAllCategories();
    // products = await widget.myRepository.getAllProducts();
    // isLoaded = false;

    //2-usul tezroq
    final getTotals = await Future.wait([
      widget.myRepository.getAllCategories(),
      widget.myRepository.getAllProducts(),
    ]);
    categories = getTotals[0] as List<String>;
    products = getTotals[1] as List<ProductItem>;

    isLoaded = false;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Commercial App",style: MyTextStyle.interSemiBold600.copyWith(color: Colors.black,fontSize: 18),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  categories.length,
                      (index) =>
                      GestureDetector(
                        onTap: () async {
                          selectedCategory = index;
                          setState(() {});
                          updateUI(categories[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              color: selectedCategory == index
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 2)),
                          child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: selectedCategory != index
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              )),
                        ),
                      ),
                ),
              ),
            ),
            Visibility(
                visible: !isLoaded,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      children: List.generate(
                          products.length,
                              (index) =>
                              Expanded(child:
                              myWidget2(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return ProductInfo(
                                      productItem: products[index],
                                    );
                                  }));
                                },
                                httpImage: products[index].image,
                                title: products[index].category,
                                author: products[index].title,
                              ),
                              )),
                    ),
                  ),
                )
            ),
            Visibility(
                visible: isLoaded,
                child: ProductGridShimmer()
        )]));
  }
}