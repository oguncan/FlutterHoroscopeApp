import 'package:flutter/material.dart';
import './screens/ListHoroscope.dart';
void main() {
  runApp(
    MaterialApp(
      home: ListHoroscope(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    ),
  );
}
