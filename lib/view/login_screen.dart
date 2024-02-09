import 'package:flutter/material.dart';
import 'package:oficepreactice/utils/routes/routes_name.dart';
import 'package:oficepreactice/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            // Navigator.pushNamed(context,RoutesName.home);
            Utils.flushBarErrorMessage('No Internet Connection', context);
            Utils.toastMessage("This Is toast",);
            Utils.snackBar("Click",context);


          },
          child: Text("Click",style: TextStyle(color: Colors.red),),
        ),
      ),
    );
  }
}
