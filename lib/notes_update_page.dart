import 'package:flutter/material.dart';

class NotesUpdatePage extends StatelessWidget{
  TextEditingController tittleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Color(0xff222433),
        title: Text('Update Note',style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold)),

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff222433),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Tittle',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 380,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2,color: Colors.white)
                ),

                child: TextField(
                  style: TextStyle(fontSize: 20,color: Colors.white),
                  controller: tittleController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(

                      hintText: 'Enter your tittle.......',
                      hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Description',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2,color: Colors.white)
                ),

                child: TextField(
                  maxLines: 4,
                  style: TextStyle(fontSize: 20,color: Colors.white),
                  controller: desController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(

                      hintText: 'Enter your description.......',
                      hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Center(child: Text('Update',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))),style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.1)),),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(onPressed: (){}, child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Center(child: Text('Cancel',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))),style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.1)),),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}