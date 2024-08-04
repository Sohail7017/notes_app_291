
import 'package:flutter/material.dart';
import 'package:flutter_app/data/local/db_helper.dart';
import 'package:flutter_app/notes_add_page.dart';
import 'package:flutter_app/notes_second_page.dart';

class NotesHomePage extends StatefulWidget{
  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {

  DbHelper? mainDB;
 List<Map<String,dynamic>> allNotes = [];

  @override
  void initState() {
    super.initState();
    mainDB = DbHelper.getInstance();
   getInitialNotes();
  }

  void getInitialNotes()async{
    allNotes= await mainDB!.getAllData();
    setState(() {

    });
  }
   TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
       child: allNotes.isNotEmpty? ListView.builder(

            itemCount: allNotes.length,
            itemBuilder: (_,index){
          return ListTile(
            leading: Text("${allNotes[index][DbHelper.tableColumnSNo]}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
            title: Text(allNotes[index][DbHelper.tableColumnTittle],style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
            subtitle: Text(allNotes[index][DbHelper.tableColumnDesc],style: TextStyle(color: Colors.white,fontSize: 15,)),
            trailing: SizedBox(
              width: 58,
              child: Row(children: [
                InkWell(
                    onTap: (){

                      showModalBottomSheet(context: context, builder: (_)
                      {
                          /*titleController.text = allNotes[index][DbHelper.tableColumnTittle];
                          descController.text = allNotes[index][DbHelper.tableColumnDesc];*/
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff222433).withOpacity(0.9),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Center(child: Text('UpdateNote',style: TextStyle(fontSize: 29,color: Colors.white,fontWeight: FontWeight.bold))),

                                SizedBox(
                                  height: 20,
                                ),
                                Text('Tittle',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white,width: 2),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: TextField(
                                    style: TextStyle(fontSize: 20,color: Colors.white),
                                    controller: titleController,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(

                                        hintText: 'Enter your tittle.......',
                                        hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                                        border: OutlineInputBorder(borderSide: BorderSide.none)
                                    ),

                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Description',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white,width: 2)
                                  ),
                                  child: TextField(
                                    maxLines: 4,
                                    style: TextStyle(fontSize: 20,color: Colors.white),
                                    controller: descController,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderSide: BorderSide.none),
                                      hintText: 'Enter your description.......',
                                      hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(onPressed: (){
                                      updateInDb(sno: allNotes[index][DbHelper.tableColumnSNo]);
                                      Navigator.pop(context);
                                    }, child: Container(
                                        width: 70,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4)
                                        ),
                                        child: Center(child: Text('Update',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))),style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.1)),),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    ElevatedButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Container(
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
                        );
                      }
                      );
                    },
                    child: Icon(Icons.edit,size: 26,color: Colors.white.withOpacity(0.5),)),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: (){
                      mainDB!.deleteNote(sno: allNotes[index][DbHelper.tableColumnSNo]);
                      getInitialNotes();
                    },
                    child: Icon(Icons.delete,size: 26,color: Colors.white.withOpacity(0.5),))
              ],),
            ),
          );
        }): Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_note_sharp,size: 50,color: Colors.white.withOpacity(0.2),),
                    Text('Here no Notes yet!',style: TextStyle(fontSize: 18,color: Colors.white.withOpacity(0.2),fontWeight: FontWeight.bold),),
                  ],
                ),

        )


      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       showModalBottomSheet(context: context, builder: (_)
       {
         return Container(
           width: double.infinity,
           decoration: BoxDecoration(
               color: Color(0xff222433).withOpacity(0.9),
           ),

           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: 10,
                 ),
                 Center(child: Text('AddNote',style: TextStyle(fontSize: 29,color: Colors.white,fontWeight: FontWeight.bold))),
                 SizedBox(
                   height: 10,
                 ),
                 Text('Tittle',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                 Container(
                   height: 70,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.white,width: 2),
                     borderRadius: BorderRadius.circular(12)
                   ),
                   child: TextField(
                     style: TextStyle(fontSize: 20,color: Colors.white),
                     controller: titleController,
                     cursorColor: Colors.white,
                     decoration: InputDecoration(

                         hintText: 'Enter your tittle.......',
                         hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                         border: OutlineInputBorder(borderSide: BorderSide.none)
                     ),

                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text('Description',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                   SizedBox(
                     height: 10,
                   ),
                 Container(
                   height: 150,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     border: Border.all(color: Colors.white,width: 2)
                   ),
                   child: TextField(
                     maxLines: 4,
                     style: TextStyle(fontSize: 20,color: Colors.white),
                     controller: descController,
                     cursorColor: Colors.white,
                     decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                         hintText: 'Enter your description.......',
                         hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 30,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(onPressed: (){
                       notesAdd();
                       titleController.clear();
                       descController.clear();
                       Navigator.pop(context);
                     }, child: Container(
                         width: 70,
                         height: 40,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(4)
                         ),
                         child: Center(child: Text('Add',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))),style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.1)),),
                     SizedBox(
                       width: 15,
                     ),
                     ElevatedButton(onPressed: (){
                       Navigator.pop(context);
                     }, child: Container(
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
         );
       });
      },child: Icon(Icons.add,size: 40,color: Color(0xff222433),),backgroundColor: Colors.white,shape: CircleBorder(),),
    );
  }
  /// Notes add
  void notesAdd() async{
    var tittle = titleController.text.toString();
    var desc = descController.text.toString();

    bool isTrue = await mainDB!.addNotes(tittle: tittle, desc: desc);
    String msg = "Note added Failed!!";

    if(isTrue){
      msg = "Note added Successfully!!";
      getInitialNotes();
    }
    
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg,style: TextStyle(fontSize: 20,color: Colors.white),)));
  }

  /// Update note
  void updateInDb({required int sno}) async{
    var mTittle = titleController.text.toString();
    var mDesc = descController.text.toString();

    bool isTrue = await mainDB!.updateNote(tittle: mTittle, desc: mDesc, sno: sno);
    String msg = "Note Update failed";

    if(isTrue){
      msg ="Note Update successfully";
      getInitialNotes();
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg,style: TextStyle(fontSize: 20,color: Colors.white),)));

  }
}