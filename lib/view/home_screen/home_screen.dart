import 'package:flutter/material.dart';
import 'package:flutter_application_15_/model/note_model/note_model.dart';

import 'package:flutter_application_15_/view/home_screen/homescreen_widget/homescreen_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var box = Hive.box<NoteModel>("MyTodoBox");
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final dateController = TextEditingController();
  final updateNameController = TextEditingController();
  final updateDesController = TextEditingController();
  final updateDateController = TextEditingController();
  List<NoteModel> myNoteList = [
    //seperate model class
  ];

  List<Color> MyColorList = [
    Color.fromARGB(255, 114, 216, 117),
    Color.fromARGB(255, 243, 162, 40),
    Color.fromARGB(255, 123, 190, 245),
    Color.fromARGB(255, 252, 155, 187),
    Color.fromARGB(255, 200, 83, 220)
  ];

  String value = "";
  int? selectedIndex;
  var keyList = [];

  @override
  void initState() {
    keyList = box.keys.toList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        backgroundColor: Color.fromARGB(255, 8, 227, 125),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: keyList.length,
          itemBuilder: (context, index) => HomeScreenWidget(
            title: box.get(keyList[index])!.title,
            description: box.get(keyList[index])!.description,
            date: box.get(keyList[index])!.date,
            color: MyColorList[box.get(keyList[index])!.color],
            onDeletetap: () {
              box.delete(keyList.removeAt(index));
              // keyList.removeAt(
              //     index); //for deleting it from the widget declaration and here

              setState(() {});
            },
            onEditTap: () {
              // value = "Update";
              // bottomSheet(context);
              // nameController.text = box.get(myNoteList[index])!.title;
              // desController.text = box.get(myNoteList[index])!.description;
              // dateController.text = box.get(myNoteList[index])!.date;
              // //            // keyList = box.keys.toList();
              // setState(() {});
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, CsetState) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          controller: updateNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "New Text",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: updateDesController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "New Description",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: updateDateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "New Date",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            MyColorList.length,
                            (index) => InkWell(
                              onTap: () {
                                selectedIndex = index;
                                CsetState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: selectedIndex == index
                                        ? Border.all(
                                            color: MyColorList[index]
                                                .withOpacity(.5),
                                            width: 5)
                                        : null,
                                    color: MyColorList[index].withOpacity(.4),
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
                              box.put(
                                keyList[index],
                                NoteModel(
                                  title: updateNameController.text,
                                  date: updateDateController.text,
                                  description: updateDesController.text,
                                  color: selectedIndex!,
                                ),
                              );
                              setState(() {});
                              keyList = box.keys.toList();
                              print("updated keylist:$keyList");
                              updateNameController.clear();
                              updateDesController.clear();
                              updateDateController.clear();
                              Navigator.pop(context);
                            },
                            child: Text("Save"))
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 8, 227, 125),
        onPressed: () {
          value = "submit";
          selectedIndex = null;
          bottomSheet(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          //insetState is custom name
          return StatefulBuilder(
            builder: (context, insetState) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffEBE3D5),
                    ),
                    child: TextField(
                      controller: desController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                      ),
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
                        border: OutlineInputBorder(),
                        hintText: "date",
                      ),
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
                          selectedIndex = index;
                          print(selectedIndex);

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
                      box.add(
                        NoteModel(
                          title: nameController.text,
                          date: dateController.text,
                          description: desController.text,
                          color: selectedIndex!,
                        ),
                      );
                      keyList = box.keys.toList();
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
