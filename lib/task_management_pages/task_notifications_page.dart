import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasknotificationsPage extends StatefulWidget {
  const TasknotificationsPage({Key? key}) : super(key: key);

  @override
  State<TasknotificationsPage> createState() => _TasknotificationsPageState();
}

class _TasknotificationsPageState extends State<TasknotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.separated(


        separatorBuilder: (
        BuildContext
            context,int index){
          return Container(
            decoration: BoxDecoration(

              border: Border.all(
                color: Colors.white38
              )
            ),
          );
        },

        itemCount: 5,
          itemBuilder: (BuildContext context ,
          int index){
            return Column(
              children: [
                Row(
                  children: [


                    Expanded(child: Text("Task Name ")),
                  Expanded(child: Text("......"))],
                ),
              ],
            );
          }),
    );
  }
}
