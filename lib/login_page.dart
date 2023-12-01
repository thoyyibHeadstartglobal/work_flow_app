import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_flow_app/app_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async
      {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
             automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Color(0xff87CEEB),
            centerTitle: true,
            title: Text("APP LOGIN"),
          ),
          body:
              // SingleChildScrollView(
              //   scrollDirection: Axis.vertical,
              //   child:
              Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              margin:  EdgeInsets.only(top: 150,bottom: 150),
              color: Color(0xff87CEEB).withOpacity(0.2),
          clipBehavior: Clip.antiAlias,
              elevation: 0.0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    TextFormField(
                      // controller: ,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.1, color: Colors.black12)),
                      ),
                    ),
                    SizedBox(height: 10,),
                     TextFormField(
                // controller: ,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 0.1, color: Colors.black12)),
                ),
              ),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end
                      ,
                      children: [
                        ElevatedButton(
                          // onHover: false,
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Color(0xff87CEEB)
                          ),

                            onPressed: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context)=>
                                    AppHome()));
                        }, child:
                        Text("Login")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // ) ,
        ),
      ),
    );
  }
}
