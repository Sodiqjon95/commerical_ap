import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utiles/icons.dart';
import '../../../../utiles/my_text_stile.dart';

class CartsWidget extends StatelessWidget {
   const CartsWidget({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userLong,
    required this.cartsDate,
    required this.cartsProductsQuantity,
    required this.productImage,
    required this.productsPrice,
    required this.usersLat,
    required this.usersPassword,
    required this.usersPhone,
    required this.userStreet,
  }) : super(key: key);
  final String userName;
  final String userEmail;
  final String usersLat;
  final String userLong;
  final String usersPassword;
  final String usersPhone;
  final String userStreet;
  final String productImage;
  final double productsPrice;
  final int cartsProductsQuantity;
  final String cartsDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      width: 350,
      height: 265,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 60,
            width: 350,
            // color: Colors.grey,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 120,
                        child: Text(
                          userName,
                          style: MyTextStyle.interSemiBold600.copyWith(fontSize: 25),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Text(userEmail),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset(MyIcons.geolocation2)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(usersLat),
                          Text(userLong),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 80,
            width: 350,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.lock_clock_sharp,
                      color: Color(0xFFF8AC5D),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(usersPassword),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(usersPhone),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: Colors.indigo,
                    ),
                    const SizedBox(width: 10),
                    Text(userStreet),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 100,
                width: 70,
                child: Image.network(productImage),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(
                      "\$ $productsPrice",
                      style: MyTextStyle.interSemiBold600.copyWith(fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "\$ ${productsPrice * cartsProductsQuantity} ",
                      style: MyTextStyle.interSemiBold600.copyWith(fontSize: 15, color: Colors.red),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(cartsDate.substring(0, 10))
                ],
              ),
              Container(
                width: 145,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "-",
                        style: MyTextStyle.interRegular400.copyWith(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    Text(
                      cartsProductsQuantity.toString(),
                      style: MyTextStyle.interRegular400.copyWith(fontSize: 20, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "+",
                        style: MyTextStyle.interRegular400.copyWith(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
