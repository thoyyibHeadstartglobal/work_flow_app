import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:work_flow_app/common_pages/login_page.dart';
import 'dart:io';

import 'package:work_flow_app/task_management_pages/create_tasks.dart';
import 'package:work_flow_app/task_management_pages/task_notifications.dart';
import 'package:work_flow_app/task_management_pages/task_notifications_page.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);


  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {




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

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async
      {
        return false;
      },
      child: SafeArea(

        child: Scaffold(

          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Color(0xff87CEEB),
            centerTitle: true,
actions: [IconButton(onPressed: (){

  Navigator.push(context,
  MaterialPageRoute(builder: (context)=>

      TasknotificationsPage()));
}, icon: Icon(Icons.notifications_active_outlined))],



          ),
          body: ListView(
            children: [
              SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    // Expanded(
                    //   child: InkWell(
                    //
                    //   onTap: (){
                    //
                    //   },
                    //   child: Container(
                    //     decoration:
                    //     BoxDecoration(
                    //       border:  Border.all(
                    //         width: 0.9,
                    //         color: Color(0xff87CEEB),
                    //       )
                    //
                    //
                    //         // color: Colors.red.withOpacity(0.8),
                    //         // borderRadius: BorderRadius.only(
                    //         //     bottomLeft: Radius.circular(120.0),
                    //         //     bottomRight: Radius.circular(120.0)
                    //         // )
                    //   ),
                    //     height: MediaQuery.of(context).size.height/8,
                    //     // margin: EdgeInsets.symmetric(horizontal: 20),
                    //
                    //     child:
                    //     Center(child: Text("Current Status")),
                    //   ),
                    // ),
                    //     ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Expanded(
                      child: DottedBorder(
                        strokeWidth: 1.5,

                        child: InkWell(

                            //
                            // style: ElevatedButton.styleFrom(
                            //
                            //   shadowColor: Colors.black,
                            //
                            //     minimumSize: Size(
                            //         MediaQuery.of(context)
                            //             .size.width * 0.5,
                            //         90.0),
                            //     maximumSize: Size.fromHeight(90.0),
                            //     elevation: 0.0,
                            //     padding: EdgeInsets.symmetric(horizontal: 0,
                            //         vertical: 0),
                            //     primary: Colors.white
                            // ),
                            onTap: (){
                              // Navigator.push(
                              //     context, MaterialPageRoute(builder: (context)=>
                              //     LoginPage()));
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> CreateTaskPage())
                              )
                              .whenComplete(() =>

                              initializeData()
                              );

                              print("button Pressed");
                            }, child:
                        Container(
                          height: MediaQuery.of(context).size.height/8.5,
                          child:
                          Center(
                            child: Text("OPEN / CREATE TASK",
                              style: TextStyle(
                                  color: Colors.black
                              ),
                              textAlign: TextAlign.center,),
                          ),
                        )),

                      ),
                    ),

                  ],
                ),
              ),


              SizedBox(height: 30,),

            Container(
              height: 350,

              child: GridView.builder(
                // padding:
                // EdgeInsets.symmetric(horizontal: 10, vertical: 22),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // maxCrossAxisExtent: 200,
                    mainAxisExtent:
                    90,
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing:0,

                    mainAxisSpacing: 0,
                  ),
                  // const
                  // SliverGridDelegateWithMaxCrossAxisExtent(
                  //     maxCrossAxisExtent: 200,
                  //
                  //     childAspectRatio: 3 / 2,
                  //     crossAxisSpacing: 20,
                  //     mainAxisSpacing: 20,
                  //
                  // ),

                  itemCount:statusList.length,
                  // cacheExtent: 200,
                  itemBuilder: (BuildContext ctx, index) {
                    // setState((){
                    // listIndex = index;
                    // });
                    return
                      TextButton(

                        style: TextButton.styleFrom(
                          primary: statusList[index]['color']

                          // padding: EdgeInsets.symmetric(horizontal: 5),
                          // shadowColor: Color(0xff87CEEB),
                        ),
                        onPressed: () async {

                        },
                        child: Container(
                          // margin: EdgeInsets.only(left: 10,right: 0),
                          width:
                          // ?
                          MediaQuery.of(context).size.width * 0.9
                          // : MediaQuery.of(context).size.width
                          ,

                          decoration: BoxDecoration(

                            // gradient: LinearGradient(colors: [Colors.yellow,
                            //   Colors.blue, Colors.red]),

                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff87CEEB),
                                    blurRadius: 2.0,
                                    // offset: Offset(2, 100),
                                    blurStyle: BlurStyle.normal)
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              color:   statusList[index]['color'],
                              border: Border.all(
                                  width: 0.1, color: Colors.black)),
                          // margin: EdgeInsets.symmetric(horizontal: 10),

                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // color:Colors.red,
                                    child: Text("${statusList[index]['count'].toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15
                                    ),),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),

                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        // homeList[index]['type'] ==
                                        //     "GOODS RECEIVE"
                                        //     ?
                                        "${statusList[index]['status']}"
                                        // : homeList[index]['type']
                                        // .toString()
                                        ,
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style:
                                        TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize:
                                            // homeList .length ==4 ?
                                            // 15 :
                                            15),

                                      )),
                                  Expanded(
                                      child:IconButton(
                                    iconSize: 5,
                                  icon: statusList[index]['icon']
                                          ,
                                    onPressed: () {  },))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                  }),
            ),
              // Expanded(
              //   child: ElevatedButton(
              //       onPressed:() async {
              //         try {
              //           bool hasbiometrics = await auth.canCheckBiometrics; //check if there is authencations,
              //
              //           if(hasbiometrics){
              //             List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
              //             if (Platform.isIOS) {
              //               if (availableBiometrics.contains(BiometricType.face)) {
              //
              //                 bool pass = await auth.authenticate(
              //
              //                     localizedReason: 'Authenticate with fingerprint',
              //                     options: AuthenticationOptions(
              //                         biometricOnly: true
              //                     ) );
              //
              //                 if(pass){
              //                   msg = "You are Autenciated.";
              //                   setState(() {
              //
              //                   });
              //                 }
              //
              //               }
              //             }else{
              //               if (availableBiometrics.contains(BiometricType.fingerprint)) {
              //                 bool pass = await auth.authenticate(
              //                     localizedReason: 'Authenticate with fingerprint/face',
              //                     options: AuthenticationOptions(
              //                       biometricOnly: true
              //                     ));
              //                 if(pass){
              //                   msg = "You are Authenicated.";
              //                   setState(() {
              //
              //                   });
              //                 }
              //               }
              //             }
              //           }else{
              //             msg = "You are not alowed to access biometrics.";
              //           }
              //
              //
              //         } on PlatformException catch (e) {
              //           msg = "Error while opening fingerprint/face scanner";
              //         }
              //
              //       },
              //       child: Text("Authenticate with Fingerprint/Face Scan")
              //   ),
              // ),




              ],
        )
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
