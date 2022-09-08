import 'package:commerical_ap/data/storage.dart';
import 'package:commerical_ap/service/api_provider.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();

}

class _TaskState extends State<Task> {

  TextEditingController nameCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  late ApiProvider apiProvider;
  String getToken = '';




  _init()async{
    await StorageRepository.getInstance();
    apiProvider = ApiProvider();
  }
@override
  void initState() {
    _init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(height: 200,),
        TextField(
          controller: nameCon,
        ),
        SizedBox(height: 20,),
        TextField(
          controller: passCon,
        ),
        Center(child: TextButton(onPressed: ()async{


          if(nameCon.text.isNotEmpty && passCon.text.isNotEmpty){




            var token = await apiProvider.loginUser(userName: nameCon.text, password: passCon.text);


            setState((){
              getToken = token;

              print(getToken);
            });


            await StorageRepository.putString(key: "token", value: token);
          }


        }, child: Text("login"))),
        Text(getToken, style: TextStyle(fontSize: 40, color: Colors.black),),
      ],),
    );
  }
}
