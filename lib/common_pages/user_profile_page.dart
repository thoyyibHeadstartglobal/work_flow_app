import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_flow_app/common_pages/app_constants.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppConstants().appTheme,
        title: Text("Profile"),
      ),
      body:

      ListView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        children: [

         Row(
           children: [
             Expanded(child: Text("Username")),
             SizedBox(width: 20,),
             Expanded(
                 flex: 3,
                 child: Text("..USER.."))
           ],
         ),
SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: Text("email")),
              SizedBox(width: 20,),
              Expanded(
                  flex: 3,
                  child: Text("..EMAIL.."))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: Text("USER ID")),
              SizedBox(width: 20,),
              Expanded(
                  flex: 3,
                  child: Text("..USER ID.."))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: Text("ADDRESS")),
              SizedBox(width: 20,),
              Expanded(
                  flex: 3,
                  child: Text("..ADDRESS.."))
            ],
          )
        ],
      ),
    );
  }
}
