import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/screens/signup_screen.dart';
import 'package:instagram_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBDyOKgmLhF7WxzLxUtGzwhi8M58tkmacQ",
            authDomain: "instagram-clone-app-fd1f5.firebaseapp.com",
            projectId: "instagram-clone-app-fd1f5",
            storageBucket: "instagram-clone-app-fd1f5.appspot.com",
            messagingSenderId: "1091621475503",
            appId: "1:1091621475503:web:344dfd27d4ab01b2f2f05a"));
  } else {
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const SignupScreen(),
    );

    // const ResponsiveLayout(
    //   mobileScreenLayout: MobileScreenLayout(),
    //   webScreenLayout: WebScreenLayout(),
    // ));
  }
}
