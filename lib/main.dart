import 'package:flutter/material.dart';
import 'package:flutter_app/notes_add_page.dart';
import 'package:flutter_app/notes_home_page.dart';
import 'package:flutter_app/notes_second_page.dart';

void main (){
  runApp(myApp());
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotesHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}