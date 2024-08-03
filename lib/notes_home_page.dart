
import 'package:flutter/material.dart';
import 'package:flutter_app/notes_add_page.dart';
import 'package:flutter_app/notes_second_page.dart';

class NotesHomePage extends StatelessWidget{
  /*List<Map<String,dynamic>> notesData = [
    {
      'Tittle' : 'Task',
      'Description' : 'Daily Meeting & Learn Module 2',
    },
    {
      'Tittle' : 'Not Sure where this going',
      'Description' : 'You dumb dumb did you even read this though.',
    },
    {
      'Tittle' : 'Coffee',
      'Description' : 'Prepare hot coffee for friends.',
    },
    {
      'Tittle' : 'Certification',
      'Description' : 'Call instructor for complete details.',
    },
    {
      'Tittle' : 'Appointment',
      'Description' : 'Health check to with physician.',
    },
    {
      'Tittle' : 'Team Meeting',
      'Description' : 'Planning sprint log for next product design update.',
    },
  ];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Color(0xff222433),
        title: Text('Notes',style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: (){
                },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(Icons.search,size: 30,color: Colors.white,),
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff222433),
         child: Column(
           children: [
             SizedBox(
               height: 330,
             ),
             Text('Not data yet',style: TextStyle(fontSize: 18,color: Colors.white),)
           ],
         ),
         /*ListView.builder(

            itemCount: notesData.length,
            itemBuilder: (_,index){
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesSecondPage(Tittle: notesData[index]['Tittle'], Description: notesData[index]['Description'])));

                },
                child: Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                      Text(notesData[index]['Tittle'],style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                     SizedBox(
                       height: 30,
                     ),
                      Text(notesData[index]['Description'],style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)
                    ],),
                  ),
                ),
              ),
            ),
          );
        }),*/


      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return NotesAddPage();
        },));

      },child: Icon(Icons.add,size: 40,color: Color(0xff222433),),backgroundColor: Colors.white,shape: CircleBorder(),),
    );
  }
}