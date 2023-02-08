import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_handling_http/controller/home_controller.dart';
import 'package:session_handling_http/controller/login_controller.dart';
import 'package:session_handling_http/core/services/shared_pref.dart';
import 'package:session_handling_http/view/login.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
      ),
    );
  }
}
