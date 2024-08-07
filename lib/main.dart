import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/my_provider.dart';
import 'home_screen.dart';
import 'my_theme_data.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MyProvider(),
      ),

    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
