import 'package:flutter/material.dart';

class NotesSecondPage extends StatelessWidget{
  String Tittle;
  String Description;
  NotesSecondPage({required this .Tittle,required this.Description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222433),
        title: Text('Notes',style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold)),

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff222433),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(Tittle,style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            Text(Description,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}