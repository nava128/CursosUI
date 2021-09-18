import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  static const Map<int, Color> color = {
    50: Color.fromRGBO(255, 92, 87, .1),
    100: Color.fromRGBO(255, 92, 87, .2),
    200: Color.fromRGBO(252, 215, 52, .5),
    300: Color.fromRGBO(252, 215, 52, .8),
    400: Color.fromRGBO(255, 92, 87, .5),
    500: Color.fromRGBO(255, 92, 87, .6),
    600: Color.fromRGBO(255, 92, 87, .7),
    700: Color.fromRGBO(230, 81, 0, .8),
    800: Color.fromRGBO(255, 92, 87, .9),
    900: Color.fromRGBO(255, 92, 87, 1),
  };

  static const MaterialColor colorCustom = MaterialColor(0xFFFF5C57, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Cronograma',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.black87),
        primaryColor: const Color(0xFF808080),
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Colors.black12),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: colorCustom)
            .copyWith(secondary: colorCustom),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: colorCustom)
            .copyWith(secondary: Colors.white),
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Colors.black),
      ),
    ).modular();
  }
}
