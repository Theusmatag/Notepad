import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notepad/screens/home_Screen.dart';
import 'package:notepad/screens/note_Screen.dart';
import 'package:provider/provider.dart';
import 'models/note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider(
      create: (context) => Note(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notepad',
        theme: ThemeData(
            fontFamily: 'Biennale',
            textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF1A1A26),
                    fontWeight: FontWeight.bold))),
        home: const SafeArea(child:  HomeScreen()),
        routes: {'Note_Screen': (context) => const NoteScreen()},
      ),
    );
  }
}
