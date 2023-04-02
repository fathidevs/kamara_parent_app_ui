import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/display_photo1.dart';
import 'package:kamara_parent_app_ui/custom_widgets/list_item1.dart';

import 'package:kamara_parent_app_ui/notifier/picked_child_id_notifier.dart';
import 'package:provider/provider.dart';

import '../dummy_backend/models/student_model.dart';

class ListOfStudents extends StatefulWidget {
  final Map<int, StudentModel> students;
  const ListOfStudents({
    Key? key,
    required this.students,
  }) : super(key: key);

  @override
  State<ListOfStudents> createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.students.length,
        itemBuilder: (cx, position) {
          return _listItem(position);
        });
  }

  Widget _listItem(int position) {
    int id = Provider.of<PickedChildIdNotifier>(context).id;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListItem1(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        thumbnail: DisplayPhoto(
          padding: EdgeInsets.zero,
          strokeSize: 0.0,
          isHomeScreen: false,
          hideShadow: true,
          img: Image.asset(widget.students[position]!.img),
        ),
        title: Text(
          widget.students[position]!.name,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        button: Radio(
          activeColor: MyColors.colorPrimary,
          value: id == position,
          groupValue: true,
          onChanged: (value) {
            Provider.of<PickedChildIdNotifier>(
              context,
              listen: false,
            ).changeId(position);
            Navigator.pop(context);
          },
        ),
        onPressed: () {
          Provider.of<PickedChildIdNotifier>(
            context,
            listen: false,
          ).changeId(position);
          Navigator.pop(context);
        },
      ),
    );
  }
}
