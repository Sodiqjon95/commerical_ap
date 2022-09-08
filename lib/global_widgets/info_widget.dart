import 'package:commerical_ap/models/product/product_item.dart';
import 'package:commerical_ap/utiles/my_text_stile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key, required this.productItem}) : super(key: key);
  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info product"),
      ),
      body: Column(
          children: [
       const SizedBox(
         height: 15,
       ),
       SizedBox(
           width: 200,
           child: Image.network(productItem.image)),
       const SizedBox(
         height: 10,
       ),

       Padding(
         padding: const EdgeInsets.all(15.0),
         child: Text(productItem.title, style: MyTextStyle.interBold700.copyWith(fontSize: 25)),
       ),
       const SizedBox(
         height: 5,
       ),
       Container(
           padding: const EdgeInsets.all(15),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [Text("id:",style: MyTextStyle.interSemiBold600,), Text(productItem.id.toString(), style: MyTextStyle.interRegular400.copyWith(fontSize: 15))],
           )),
       Padding(
         padding: const EdgeInsets.only(left: 18),
         child: Row(
           children: [
             Text("price: ", style: MyTextStyle.interBold700.copyWith(fontSize: 15)),
             Text(productItem.price.toString()),
           ],
         ),
       ),
       const SizedBox(
         height: 5,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 18),
         child: Row(
           children: [
             Text("Rating: ", style: MyTextStyle.interBold700.copyWith(fontSize: 15)),
             Text(productItem.ratingItem.toString()),
           ],
         ),
       ),
       const SizedBox(
         height: 5,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 18,right: 10),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Description: ", style: MyTextStyle.interBold700.copyWith(fontSize: 15)),
             Expanded(
               child: Text(
                 productItem.description.toString(),
                 maxLines: 2,
               ),
             ),
           ],
         ),
       ),
       const SizedBox(
         height: 5,
       ),

       Padding(
         padding: const EdgeInsets.only(left: 18),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("title: ", style: MyTextStyle.interBold700.copyWith(fontSize: 15)),
             Expanded(child: Text(productItem.title,maxLines: 2,)),
           ],
         ),
       ),
       const SizedBox(
         height: 5,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 18),
         child: Row(
           children: [
             Row(
               children: [
                 Text("Category: ", style: MyTextStyle.interBold700.copyWith(fontSize: 15)),
                 Text(productItem.category),
               ],
             ),
           ],
         ),
       ),
          ],
        ),
    );
  }
}
