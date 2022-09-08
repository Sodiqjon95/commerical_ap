import 'package:commerical_ap/utiles/my_text_stile.dart';
import 'package:flutter/material.dart';

Widget myWidget2(
    {required String httpImage,
      required String author,
      required String title,
      required VoidCallback onTap})=>
    Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 100,

              child: Image.network(httpImage),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(child: Text(title, style: MyTextStyle.interBold700.copyWith(fontSize: 15))),

            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(author,
                  style: MyTextStyle.interMedium500.copyWith(fontSize: 10),maxLines: 2,),
            ),
          ],
        ),
      ),
    );
