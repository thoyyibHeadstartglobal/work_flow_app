import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:work_flow_app/app_home_page.dart';

import 'biometric_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication auth = LocalAuthentication();


  // 2. created object of localauthentication class
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  // 3. variable for track whether your device support local authentication means
  //    have fingerprint or face recognization sensor or not
  bool _hasFingerPrintSupport = false;
  // 4. we will set state whether user authorized or not
  String _authorizedOrNot = "Not Authorized";
  // 5. list of avalable biometric authentication supports of your device will be saved in this array
  List<BiometricType> _availableBuimetricType = [];

  Future<void> _getBiometricsSupport() async {
    // 6. this method checks whether your device has biometric support or not
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }

  Future<void> _getAvailableSupport() async {
    // 7. this method fetches all the available biometric supports of the device
    List<BiometricType> availableBuimetricType = [];
    try {
      availableBuimetricType =
      await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBuimetricType = availableBuimetricType;
    });
  }

  bool ? isAuthenticated =false;

  Future<void> _authenticateMe() async {

    // BiometricPrompt.PromptInfo.Builder().setDeviceCredentialAllowed(true);
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      isAuthenticated  = await _localAuthentication.authenticate(
          localizedReason: 'Please complete the biometrics to proceed.',
          options:
          AuthenticationOptions(
            stickyAuth: true,
              biometricOnly: true
          ),
        // authMessages:
        //
        //    AndroidAuthMessages(
        //       cancelButton: "Close",
        //       biometricHint: "Hint of biometric",
        //       biometricNotRecognized: "Custom not recognized",
        //       biometricRequiredTitle: "Custom title",
        //       goToSettingsButton: "Custom setting button",
        //       goToSettingsDescription: "Custom setting description",
        //       signInTitle: "Custom Title")
        // ,

      );

      print("authenticated : ${isAuthenticated.toString()} line 87");
      // _authorizedOrNot ="Authorized";
      setState((){

      });
      // = await _localAuthentication
      // .authenticate(
      //
      //     localizedReason: 'Authenticate with fingerprint',
      //     options: AuthenticationOptions(
      //
      //       stickyAuth: true,
      //         biometricOnly: true,
      //       useErrorDialogs: true
      //     ) )
      //
      // ;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      // isAuthenticated = true ? "Authorized" : "Not Authorized";
    });
  }



  @override
  void initState() {
    _getBiometricsSupport();
    _getAvailableSupport();
    super.initState();
  }

  String msg = "You are not authorized.";


  Widget buildAvailability(BuildContext context) => buildButton(
    text: 'Check Availability',
    icon: Icons.event_available,
    onClicked: () async {
      final isAvailable = await LocalAuthApi.hasBiometrics();
      final biometrics = await LocalAuthApi.getBiometrics();

      final hasFingerprint = biometrics.contains(BiometricType.fingerprint);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Availability'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildText('Biometrics', isAvailable),
              buildText('Fingerprint', hasFingerprint),
            ],
          ),
        ),
      );
    },
  );

  Widget buildText(String text, bool checked) => Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        checked
            ? Icon(Icons.check, color: Colors.green, size: 24)
            : Icon(Icons.close, color: Colors.red, size: 24),
        const SizedBox(width: 12),
        Text(text, style: TextStyle(fontSize: 24)),
      ],
    ),
  );

  Widget buildAuthenticate(BuildContext context) => buildButton(
    text: 'Authenticate',
    icon: Icons.lock_open,
    onClicked: () async {
      final isAuthenticated = await LocalAuthApi.authenticate();

      if (isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AppHome()),
        );
      }
    },
  );

  Widget buildButton({
    String  ? text,
     IconData ?  icon,
     VoidCallback ? onClicked,
  }) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 26),
        label: Text(
          text!,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );




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
                    ),
                    // Expanded(child: ElevatedButton(
                    //     onPressed:() async {
                    //       try {
                    //
                    //         isAuthenticated = await auth.authenticate(
                    //             localizedReason: 'Authenticate with pattern/pin/passcode',
                    //             options: AuthenticationOptions(
                    //                 biometricOnly: true,
                    //                 useErrorDialogs: true,
                    //                 stickyAuth: true
                    //             )
                    //         );
                    //         // if(pass){
                    //         //
                    //         //   msg = "You are Authenticated.";
                    //         //   // _authorizedOrNot ="Authorized";
                    //         //   setState(() {
                    //         //
                    //         //   });
                    //         // }
                    //
                    //       } on PlatformException catch (e) {
                    //         msg = "Error while opening fingerprint/face scanner";
                    //       }
                    //
                    //     },
                    //     child: Text("Authenticate with Pin/Passcode/Pattern Scan")
                    // )),



                    // Text("Has FingerPrint Support : $_hasFingerPrintSupport"),
                    // Text(
                    //     "List of Biometrics Support: ${_availableBuimetricType.toString()}"),
                    // Text("Authorized : $_authorizedOrNot"),
                    ConstrainedBox(
                      constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width * 0.8,
                          150)),
                      child: ElevatedButton(
                        child: Text("Authorize Now"),
                        // color: Colors.green,
                        // onPressed:()=>_authenticate(),
                        onPressed: _authenticateMe,
                      ),
                    ),
                    Center(
                      child: Text(!canAuthenticate
                          ? "Biometrics Not available"
                          : didAuthenticate
                          ? "Authenticated"
                          : "Please Unlock with biometrics"),
                    ),

                    buildAvailability(context),
                    SizedBox(height: 24),
                    buildAuthenticate(context),
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
  bool canAuthenticate = false;
  bool didAuthenticate = false;
  _authenticate() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

      canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      if (!canAuthenticate) {
        return;
      }
      setState(() {
        canAuthenticate = canAuthenticate;
      });
      didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to Goto Next Screen',
          options: const AuthenticationOptions(
              biometricOnly: true));
      setState(() {});
      if (didAuthenticate) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  AppHome()),
                (route) => false);
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
