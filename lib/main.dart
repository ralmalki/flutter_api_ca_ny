import 'package:flutter/material.dart';
import 'config/router.dart';
import 'dep_injection.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    );
  }
}
