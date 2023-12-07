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
    );
  }
}
