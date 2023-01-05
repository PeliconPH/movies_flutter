import 'package:flutter/material.dart';
import 'package:movies_flutter/router/mobile_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: MobileRouter.routes,
      initialRoute: MobileRouter.initialRoute,
    );
  }
}
