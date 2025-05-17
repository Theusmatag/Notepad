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
            dialogTheme: const DialogTheme(
              backgroundColor: Colors.white,
            ),
            cardColor: Colors.white,
            cardTheme: const CardThemeData(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.black, // Cor do cursor
              selectionColor:
                  Colors.blue.withValues(alpha: 0.4), // Cor da seleção do texto
              selectionHandleColor:
                  Colors.black, // Cor do manipulador de seleção
            ),
            fontFamily: 'Biennale',
            textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF1A1A26),
                    fontWeight: FontWeight.bold))),
        home: const HomeScreen(),
        routes: {'Note_Screen': (context) => const NoteScreen()},
      ),
    );
  }
}
