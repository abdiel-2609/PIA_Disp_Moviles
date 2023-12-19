import 'package:flutter/material.dart';
import 'package:pia_disp_moviles/ui/ui_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BodyTracking',
      debugShowCheckedModeBanner: false,
      home: LoginUI(),
    );
  }
}