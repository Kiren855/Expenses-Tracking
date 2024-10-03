import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/view/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/service/auth.dart';
import 'package:trackizer/model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "dev env",
    options: const FirebaseOptions(
      apiKey: "AIzaSyDGbo2J30RsAJB093XdgS5qR-yhjT3MYZY",
      authDomain: "expense-tracker-b6f36.firebaseapp.com",
      databaseURL:
          "https://expense-tracker-b6f36-default-rtdb.asia-southeast1.firebasedatabase.app",
      projectId: "expense-tracker-b6f36",
      storageBucket: "expense-tracker-b6f36.appspot.com",
      messagingSenderId: "911520216482",
      appId: "1:911520216482:web:273ce73c39727d817d2efb",
    ),
  );
  final AuthService _auth = AuthService();
  await _auth.signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Trackizer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Inter",
          colorScheme: ColorScheme.fromSeed(
            seedColor: TColor.primary,
            background: TColor.gray80,
            primary: TColor.primary,
            primaryContainer: TColor.gray60,
            secondary: TColor.secondary,
          ),
          useMaterial3: false,
        ),
        home: Wrapper(),
      ),
    );
  }
}
