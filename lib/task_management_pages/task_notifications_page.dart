import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_flow_app/common_pages/app_constants.dart';
import 'package:work_flow_app/task_management_pages/task_notifications_details.dart';

class TasknotificationsPage extends StatefulWidget {
  const TasknotificationsPage({Key? key}) : super(key: key);

  @override
  State<TasknotificationsPage> createState() => _TasknotificationsPageState();
}

class _TasknotificationsPageState extends State<TasknotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(






        child: Scaffold(

          appBar: AppBar(
            leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios),),
            elevation: 0.0,
            backgroundColor: AppConstants().appTheme,
            title: Text("Notifications"),
          ),











      body: ListView.separated(

          padding: EdgeInsets.symmetric(
              // vertical: 10,
              horizontal: 2),
          separatorBuilder: (
              BuildContext
              context,int index){
            return Container(

              decoration: BoxDecoration(

                  border: Border.all(
                      color: Colors.white12,
                          width: 0.4
                  )
              ),
            );
          },

          itemCount: 5,
          itemBuilder: (BuildContext context ,
              int index){
            return InkWell(

              onTap: (
                  )=> Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> TaskNotificationsDetails())),
              child: Container(
                decoration: BoxDecoration(
                  color: AppConstants().appTheme.withOpacity(0.6),

                border: Border.all(
                color: Colors.white38

              ),
                ),
                height:
                MediaQuery.of(context).size.height/9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [

                          SizedBox(width: 20,),
                        Icon(Icons.notification_add_outlined,
                        size: 25,
                            color: Colors.black,),
                        SizedBox(width: 10,),
                        // Expanded(child: Text("Task Name ")),
                        Expanded(
                          flex: 3,
                            child: Text("Task ${index+1}dgwqdgqwdqgdqgdqjj wewewewewewewew gqghjgqjgqjhgqjgqjqjjqjq"))
                        ,SizedBox(width: 2,),
                        // Expanded(child:
                        //
                        //
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Expanded(
                        //       child: IconButton(
                        //         onPressed: (){
                        //
                        //         },
                        //         icon: Icon(Icons.remove_circle),
                        //       ),
                        //     ),
                        //   ],
                        // )
                        //
                        // )
                      ],


                    ),

                  ],
                ),
              ),
            );
          }),
    ));
  }
}
