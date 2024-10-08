import 'package:flutter/material.dart';
import 'package:login/logins/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/models/playlist_provider.dart';
import 'package:login/themes/themeprovider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PlaylistProvider())
    ],
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const AuthPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
