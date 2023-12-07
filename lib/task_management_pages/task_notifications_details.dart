import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_flow_app/common_pages/app_constants.dart';

class TaskNotificationsDetails extends StatefulWidget {
  const TaskNotificationsDetails({Key? key}) : super(key: key);

  @override
  State<TaskNotificationsDetails> createState() => _TaskNotificationsDetailsState();
}

class _TaskNotificationsDetailsState extends State<TaskNotificationsDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
leading: IconButton(
  onPressed: (){
    Navigator.pop(context);
  },
  icon: Icon(Icons.arrow_back_ios_new),
),
          centerTitle: true,
          // title: Text("Notification Details"),
        backgroundColor: AppConstants().appTheme,),

        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
         Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Container(
               padding: const EdgeInsets.
               symmetric(horizontal: 8.0,
                   vertical: 4),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Expanded(child: Text("Task Name :",
                       style: TextStyle(

                           fontSize: 20
                       ))),
                   Expanded(child: Text(".........")),

                 ],
               ),
             ),

             SizedBox(height: 10,),
             Container(
               padding: const EdgeInsets
                   .symmetric(horizontal: 8.0,
                   vertical: 4),

               child: Row(
                 children: [
                   Expanded(child: Text("Assigne Name :",
                     style: TextStyle(

                         fontSize: 20
                     ),)),
                   Expanded(child: Text(".........")),

                 ],
               ),
             ),

             SizedBox(height: 10,),
             Container(
               padding: const EdgeInsets
                   .symmetric(horizontal: 8.0,
                   vertical: 4),

               child: Row(
                 children: [
                   Expanded(
                       flex:2,
                       child: Text("Date Of Assignment :",
                           style: TextStyle(

                               fontSize: 20
                           ))),
                   Expanded(child: Text(".....")),

                 ],
               ),
             ),
           ],
         ),
// SizedBox(height: 30,),
            Spacer(),
            Spacer(),
            Container(
              // height: 150,
              margin: EdgeInsets.symmetric(horizontal: 5,
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: IgnorePointer(
                      ignoring: false,
                      child: ElevatedButton(
                          style:
                          ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {},
                          child: Text("Approve")),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: IgnorePointer(
                        ignoring: false,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Reject",
                            style: TextStyle(color: Colors.white),
                          ),
                          style:
                          TextButton.styleFrom(backgroundColor: Colors.red),
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: IgnorePointer(
                        ignoring: false,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Pending",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.yellow),
                        ),
                      ))
                ],
              )
            ),
            SizedBox(height: 30,),












          ],
        ),
      ),
    );
  }
}

