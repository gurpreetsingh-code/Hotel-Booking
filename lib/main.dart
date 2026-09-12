import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/app/app_shell.dart';

void main() {
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hotel Booking Assignment',
      home: const AppShell(),
    );
  }
}