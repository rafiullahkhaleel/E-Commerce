import 'package:e_commerce/core/sevices/auth_sevices.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Column(
                    spacing: height * .02,
                    children: [
                      Text(
                        'Sign in to Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(),
                      Text(
                        'Vegi',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(),
                      Container(
                        height: height * .07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: width * .05),
                            // Image.asset(
                            //   'assets/apple.png',
                            //   height: height * .055,
                            // ),
                            SizedBox(width: width * .05),
                            Text(
                              'Sign in with Apple',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          AuthServices.signInWithGoogle(context);
                        },
                        child: Container(
                          height: height * .07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: width * .05),
                              // Image.asset(
                              //   'assets/google.png',
                              //   height: height * .055,
                              // ),
                              SizedBox(width: width * .05),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'By signing in you are agreeing to our',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Terms and Pricacy Policy',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Scaffold(
// body: Container(
// height: double.infinity,
// width: double.infinity,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/background.jpg'),
// fit: BoxFit.cover,
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 30),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Card(
// color: Colors.transparent,
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 30,
// vertical: 20,
// ),
// child: Column(
// //spacing: height * .02,
// children: [
// Text(
// 'Sign in to Continue',
// style: TextStyle(
// color: Colors.white,
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// ),
// SizedBox(),
// Text(
// 'Vegi',
// style: TextStyle(
// color: Colors.greenAccent,
// fontSize: 40,
// fontWeight: FontWeight.bold,
// ),
// ),
// SizedBox(),
// Container(
// height: height * .07,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(10),
// ),
// child: Row(
// children: [
// SizedBox(width: width * .05),
// Image.asset(
// 'assets/apple.png',
// height: height * .055,
// ),
// SizedBox(width: width * .05),
// Text(
// 'Sign in with Apple',
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 18,
// ),
// ),
// ],
// ),
// ),
// InkWell(
// onTap: (){
// // AuthServices.signInWithGoogle(context);
// },
// child: Container(
// height: height * .07,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(10),
// ),
// child: Row(
// children: [
// SizedBox(width: width * .05),
// Image.asset(
// 'assets/google.png',
// height: height * .055,
// ),
// SizedBox(width: width * .05),
// Text(
// 'Sign in with Google',
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 18,
// ),
// ),
// ],
// ),
// ),
// ),
// Column(
// children: [
// Text(
// 'By signing in you are agreeing to our',
// style: TextStyle(
// color: Colors.greenAccent,
// fontSize: 18,
// ),
// ),
// Text(
// 'Terms and Pricacy Policy',
// style: TextStyle(
// color: Colors.greenAccent,
// fontSize: 18,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// );