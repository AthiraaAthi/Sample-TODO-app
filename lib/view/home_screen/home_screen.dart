import 'package:flutter/material.dart';
import 'package:flutter_application_15_/model/note_model/note_model.dart';
import 'package:flutter_application_15_/view/home_screen/homescreen_widget/homescreen_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});



  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final nameController =TextEditingController();
  final desController=TextEditingController();
  final dateController=TextEditingController();
  List<NoteModel>myNoteList=[ /////seperate model class
    NoteModel(title: "About My day", date: "jan2", description: "Not So Good"),
     
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("ToDo"),
        backgroundColor: Color.fromARGB(255, 8, 227, 125),
         ),
       body: Padding(
         padding: const EdgeInsets.all(20),
         child: ListView.builder(
            itemCount:myNoteList.length ,
            itemBuilder: (context, index) => SizedBox(
              height: 200,
              width: 300,
              child: HomeScreenWidget(//created widget
              onDeletetap: () {
                myNoteList.removeAt(index);//for deleting it from the widget declaration and here
                setState(() {
                  
                });
              },
                title:myNoteList[index].title,
                description: myNoteList[index].description,
                date: myNoteList[index].date,
              )
            ),
            ),
       ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder:(context) => Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color:Color(0xffEBE3D5)
                      ) ,
                      child: TextField(
                        controller: nameController,
                        
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          
                          hintText: "Title"
                        ),
                        
                      ),
                      
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color:Color(0xffEBE3D5)
                      ) ,
                      child: TextField(
                        controller: desController,
                        
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          
                          hintText: "Description"
                        ),
                        
                      ),
            
                  ),

                  SizedBox(height: 20,),
                  Container(
                  
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color:Color(0xffEBE3D5)
                      ) ,
                      child: TextField(
                        controller: dateController,
                        
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          
                          hintText: "date"
                        ),
                        
                      ),
            
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InkWell(child: Container(height: 50,width: 50,decoration: BoxDecoration(color: const Color.fromARGB(255, 157, 221, 159),borderRadius: BorderRadius.circular(20)),)),
                      SizedBox(width: 15,),
                       InkWell(child: Container(height: 50,width: 50,decoration: BoxDecoration(color: Color.fromARGB(255, 243, 173, 62),borderRadius: BorderRadius.circular(20)),)),
                       SizedBox(width: 15,),
                        InkWell(child: Container(height: 50,width: 50,decoration: BoxDecoration(color: Color.fromARGB(255, 123, 218, 237),borderRadius: BorderRadius.circular(20)),)),
                         SizedBox(width: 15,),
                        InkWell(child: Container(height: 50,width: 50,decoration: BoxDecoration(color: Color.fromARGB(255, 236, 146, 202),borderRadius: BorderRadius.circular(20)),)),
                        
                    ],
                  ),
                  SizedBox(height: 8,),
                 ElevatedButton(onPressed: (){
                 myNoteList.add(
                  NoteModel(
                    title:nameController.text , date:dateController.text , description: desController.text
                    )
                 );
                 setState(() {
                   
                 });
                 nameController.clear();
                 desController.clear();
                 dateController.clear();   
                 Navigator.pop(context);             
                 },
                  child: Text("Save"))
                  
                 
            
                ],
              ),
            ),

           

          ),
           );
        },child: Icon(Icons.add),),
        );
  }
}

//Padding(
      //   padding: const EdgeInsets.all(30),
      //   child: Center(
      //     child: Column(
      //       //crossAxisAlignment:CrossAxisAlignment.center ,
      //       children: [
      //         Container(
      //           height: 200,
      //           width: 300,
      //           decoration: BoxDecoration(
      //             color: Color.fromARGB(255, 246, 139, 25),
      //             borderRadius: BorderRadius.circular(15),
                  
              
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Positioned(
      //               child: Text("Title",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
      //           ),
      //         ),
      //         SizedBox(height: 20,),
      //         Container(
      //           height: 200,
      //           width: 300,
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //             borderRadius: BorderRadius.circular(15),
                  
              
      //           ),
      //           child: Stack(
      //             children: [
      //               Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Positioned(
      //                 child: Text("Title",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
      //             ),
      //             Positioned(
      //               top:20 ,
      //               bottom: 20,
      //               child: Text("Description"))
      //             ],
                  
      //           ),
      //         ),

             
        
      //       ],
      //     ),
      //   ),
      // )
//     );
//   }
// }