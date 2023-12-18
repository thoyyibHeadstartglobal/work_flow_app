

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:work_flow_app/common_pages/app_constants.dart';
import 'package:work_flow_app/common_pages/app_home_page.dart';
import 'package:work_flow_app/common_pages/login_page.dart';
import 'package:work_flow_app/common_pages/more_about_page.dart';
import 'package:work_flow_app/common_pages/user_profile_page.dart';
import 'dart:io';

import 'package:work_flow_app/task_management_pages/create_tasks.dart';
import 'package:work_flow_app/task_management_pages/task_notifications_page.dart';

class ViewAppHome extends StatefulWidget {
  const ViewAppHome({Key? key}) : super(key: key);


  @override
  State<ViewAppHome> createState() => _ViewAppHomeState();
}

class _ViewAppHomeState extends State<ViewAppHome> {

  int ? _currentIndex = 0;


  static   List<BottomNavigationBarItem> _pages = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home)
    ),


    BottomNavigationBarItem(
        label: "Profile",
        icon: Icon(Icons.person_add_alt)
    ),

    BottomNavigationBarItem(
      // activeIcon: Icon(Icons.more_horiz),
        label: "",
        icon: Icon(Icons.more_horiz,
          size: 40,)
    ),
  ];



  List<dynamic> statusList = [{"status":'Pending',
    'color':Colors.white54,'count':2,
    'icon':Icon(Icons.pending_actions,
      color: Colors.white,
      size: 35,)},
    {"status":'Processing','count':1,
      'icon':Icon(Icons.access_time_outlined,
        color: Colors.white,
        size: 35,),

      'color':Colors.white12},
    {"status":'Approved',
      'count':4,
      'icon':Icon(Icons.check,
        color: Colors.white,
        size: 35,),
      'color':Colors.green},
    {"status":'Rejected',
      'count':1,
      'icon':Icon(Icons.close,
          size: 35,
          color: Colors.white),
      'color':Colors.red},
    {"status":'Closed',
      'count':0,
      'icon':Icon(Icons.closed_caption_disabled_sharp, size: 35,),
      'color':Colors.orangeAccent}];

  @override
  void initState() {
    initializeData();
    super.initState();
  }
  initializeData(){
    print("initialization data Page");
  }

  
  List<Widget> _widgetBody =<Widget>[
    
    AppHome(),
    UserProfilePage(),
  MoreDetailsUser()
    
  ];
  
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async
      {
        return false;
      },
      child: SafeArea(

        child: Scaffold(

          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   elevation: 0,
          //   backgroundColor: Color(0xff87CEEB),
          //   centerTitle: true,
          //   actions: [IconButton(onPressed: (){
          //
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context)=>
          //
          //             TaskNotificationsPage()));
          //   }, icon: Icon(Icons.notifications_active_outlined))],
          //
          //
          //
          // ),
          body: _widgetBody.elementAt(_currentIndex!),
          bottomNavigationBar:

          Theme(

            data: Theme.of(context).copyWith(
                bottomAppBarColor: Colors.blue,
                selectedRowColor:  Colors.black38,
                hoverColor: Colors.red,
                canvasColor:  AppConstants().appTheme,
                primaryColor: Colors.white,
                textTheme: Theme.of(context)
                    .textTheme.copyWith(
                    caption: TextStyle(color: Colors.grey)
                )
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              // selectedIconTheme: IconThemeData(
              //   color: Colors.white
              // ),

              backgroundColor: AppConstants().appTheme,

              elevation: 0.0,
              fixedColor:Colors.white,
              onTap: (int ? value){
                setState((){
                  _currentIndex= value;
                });
                if(_currentIndex== 0){
                  AppHome();
                }

                if(_currentIndex== 1){
                  AppHome();
                }
                if(_currentIndex== 2){
                  TaskNotificationsPage();
                }
              },
              // selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              currentIndex: _currentIndex!,
              items: [

                BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home,
                    size: 35,)
                ),


                BottomNavigationBarItem(
                    label: "Profile",
                    icon: Icon(Icons.person_add_alt,
                    size: 35,)
                ),

                BottomNavigationBarItem(
                  // activeIcon: Icon(Icons.more_horiz),
                    label: "Settings",
                    icon: Icon(Icons.settings,
                      size: 35,)
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget SelectCard(){
    return Column(
      children: [
        InkWell(
          child: Container(child:
          Text("Pending"),),
        ),
        InkWell(
          child: Container(child:
          Text("Processing"),),
        ),
        InkWell(
          child: Container(child:
          Text("Rejected"),),
        ),
        InkWell(
          child: Container(child:
          Text("Closed"),),
        ),
      ],
    );
  }
}
