import 'package:flutter/material.dart';
import 'package:work_flow_app/common_pages/app_constants.dart';

class MoreDetailsUser extends StatefulWidget {
  const MoreDetailsUser({Key? key}) : super(key: key);

  @override
  State<MoreDetailsUser> createState() => _MoreDetailsUserState();
}

class _MoreDetailsUserState extends State<MoreDetailsUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppConstants().appTheme,
        title: Text("Settings"),
      ),
    );
  }
}
