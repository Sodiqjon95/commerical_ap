import 'package:commerical_ap/models/users/user_item.dart';
import 'package:commerical_ap/utiles/my_text_stile.dart';
import 'package:flutter/material.dart';

import '../../../repository/repository.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({
    Key? key,
    required this.myRepository,
  }) : super(key: key);
  final MyRepository myRepository;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserItem> users = [];
  List<String> photoImage = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    users = await widget.myRepository.getAllUsers();
    photoImage = [
      "https://randomuser.me/api/portraits/women/31.jpg",
      "https://randomuser.me/api/portraits/women/84.jpg",
      "https://randomuser.me/api/portraits/women/34.jpg",
      "https://randomuser.me/api/portraits/men/4.jpg",
      "https://randomuser.me/api/portraits/men/14.jpg",
      "https://randomuser.me/api/portraits/men/27.jpg",
      "https://scontent.ftas3-1.fna.fbcdn.net/v/t1.6435-9/191812078_500638527918832_6649420418489344587_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=vpKaLhr2Z6gAX_RQyf1&tn=aTZWOnC6OCCaA_GY&_nc_ht=scontent.ftas3-1.fna&oh=00_AT9L_gr-oi5N0w33i9XPgNuHnLiGOnZQMbiWY0BKCQ5bRQ&oe=63142B7C",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHh9Y7tcmwEr_od64uK2G5DokOr_yxia1xVw&usqp=CAU",
      "https://randomuser.me/api/portraits/men/70.jpg",
      "https://randomuser.me/api/portraits/men/42.jpg",
      "https://randomuser.me/api/portraits/men/70.jpg",
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "All Users",
            style: MyTextStyle.interSemiBold600.copyWith(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: List.generate(
              users.length,
              (index) => Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    photoImage[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 120,
                                  child: Text(
                                    users[index].nameItem.firstname,
                                    style: MyTextStyle.interSemiBold600.copyWith(fontSize: 20),
                                  )),
                              Positioned(
                                  left: 120,
                                  top: 25,
                                  child: Text(
                                    users[index].nameItem.lastname,
                                    style: MyTextStyle.interSemiBold600.copyWith(fontSize: 20),
                                  )),
                              Positioned(
                                  left: 120,
                                  top: 55,
                                  child: Text(
                                    users[index].phone,
                                    style: MyTextStyle.interRegular400.copyWith(fontSize: 20),
                                  )),
                            ],
                          ))
                    ],
                  )),
        ));
  }
}
