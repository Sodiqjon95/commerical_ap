import 'package:commerical_ap/local_database/local_database.dart';
import 'package:commerical_ap/local_database/storage.dart';
import 'package:commerical_ap/screens/tab/carts_page/carts_screen.dart';
import 'package:commerical_ap/screens/tab/home_page/home_page.dart';
import 'package:commerical_ap/screens/tab/users_page/users_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../repository/repository.dart';

import '../../service/api_provider.dart';



class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex = 0;

  late MyRepository myRepository;

  List<Widget> screens = [];

  @override
  void initState() {
    myRepository = MyRepository(
      apiProvider: ApiProvider(),
      localDatabase: LocalDatabase(),
      myStorage: MyStorage(),
      // cartApiProvider: CartApiProvider(),
    );

    screens = [
      HomeScreen(myRepository: myRepository,),
      CartsScreen(myRepository: myRepository,),
      UsersScreen(myRepository: myRepository,),

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:screens[currentIndex],
      // IndexedStack(
      //   index: currentIndex,
      //   children: screens,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        iconSize: 34,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFFF8AC5D),
        selectedLabelStyle: TextStyle(color: Colors.green),
        items: [
          getItem(icon: Icons.home_filled, labelText: ("Home")),
          getItem(icon: Icons.done_all, labelText: ("Carts")),
          getItem(icon: Icons.person_rounded, labelText:( "Users")),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.black,
        ),
        activeIcon: Icon(
          icon,
          size: 40,
          color: const Color(0XFFF8AC5D),
        ));
  }
}