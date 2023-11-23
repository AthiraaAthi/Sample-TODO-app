import 'package:flutter/material.dart';
import 'package:flutter_application_15_/model/note_model/note_model.dart';

import 'package:flutter_application_15_/view/home_screen/homescreen_widget/homescreen_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final dateController = TextEditingController();
  List<NoteModel> myNoteList = [
    /////seperate model class
    NoteModel(
      title: "About My day",
      date: "jan2",
      description: "Not So Good",
      color: 3,
    ),
  ];
  List<Color> MyColorList = [
    Color.fromARGB(255, 107, 230, 111),
    Color.fromARGB(255, 243, 173, 62),
    Color.fromARGB(255, 123, 218, 237),
    Color.fromARGB(255, 236, 146, 202),
    Color.fromARGB(255, 240, 96, 96),
    Color.fromARGB(255, 172, 76, 227),
  ];
  String value = ""; ///////////////////
  int? selectedIndex; ///////
  List<int> selectedList = []; //////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        backgroundColor: Color.fromARGB(255, 8, 227, 125),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: myNoteList.length,
          itemBuilder: (context, index) => SizedBox(
            height: 200,
            width: 300,
            child: HomeScreenWidget(
              //created widget
              color: MyColorList[myNoteList[index].color],

              title: myNoteList[index].title,
              description: myNoteList[index].description,
              date: myNoteList[index].date,
              onDeletetap: () {
                myNoteList.removeAt(
                    index); //for deleting it from the widget declaration and here
                setState(() {});
              },
              onEditTap: () {
                value = "Update";
                bottomSheet(context);
                nameController.text = myNoteList[index].title;
                desController.text = myNoteList[index].description;
                dateController.text = myNoteList[index].date;
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          value = "submit";
          selectedIndex = null;
          bottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          //insetState is custom name
          return StatefulBuilder(
            builder: (context, insetState) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffEBE3D5),
                      ),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Title",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffEBE3D5),
                    ),
                    child: TextField(
                      controller: desController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Description"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffEBE3D5),
                    ),
                    child: TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "date"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        //list.generate use chyth
                        List.generate(
                      MyColorList.length,
                      (index) => InkWell(
                        onTap: () {
                          selectedIndex = index; /////////////
                          print(selectedIndex); ////////////
                          insetState(() {});
                          //print("helloo");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border: selectedIndex == index /////
                                    ? Border.all(
                                        color:
                                            MyColorList[index].withOpacity(.5),
                                        width: 5,
                                      )
                                    : null,
                                color:
                                    MyColorList[index].withOpacity(.4) /////////

                                // color: ColorConstant.PrimaryColor[index],
                                // borderRadius: BorderRadius.circular(20),

                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myNoteList.add(
                        NoteModel(
                          title: nameController.text,
                          date: dateController.text,
                          description: desController.text,
                          color: selectedIndex!,
                        ),
                      );
                      setState(() {});
                      nameController.clear();
                      desController.clear();
                      dateController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Save"),
                  )
                ],
              ),
            ),
          );
        });
  }
}
