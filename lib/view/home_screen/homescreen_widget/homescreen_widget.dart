import 'package:flutter/material.dart';
import 'package:flutter_application_15_/model/note_model/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

//import '../../../model/note_model/note_model.dart';

class HomeScreenWidget extends StatefulWidget {
  var box = Hive.box<NoteModel>("MyTodoBox");
  HomeScreenWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      this.onDeletetap,
      this.onEditTap,
      required this.color});
  final String title;
  final String description;
  final String? date;
  final VoidCallback? onDeletetap; //or ontap nte type copy chyth ida
  final VoidCallback? onEditTap;
  Color color;

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: widget.onDeletetap,
                      child: Icon(Icons.delete),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: widget.onEditTap,
                      child: Icon(Icons.edit),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.date ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      color: widget.color,
    );
  }
}
