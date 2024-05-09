import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/Screen/first_page.dart';
import 'package:real_estate/Screen/home_page.dart';
import 'package:real_estate/Screen/login_Screen.dart';
import 'package:real_estate/Screen/regester.dart';
import 'package:real_estate/bloc/Auth_bloc/auth_bloc.dart';
import 'package:real_estate/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        
      ],
      child:MaterialApp(
      routes: {
        'login' :(context) => const Login_Screen(),
        'sign' :(context) => const Regester(),
        '/home':(context)=> const HomePage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const fisrtpage();
            }
          })
    )
    );
  }
}

