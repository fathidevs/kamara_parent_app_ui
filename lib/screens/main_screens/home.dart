import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/bottom_sheet_dialog.dart';
import 'package:kamara_parent_app_ui/custom_widgets/home_photo_display.dart';
import 'package:kamara_parent_app_ui/notifier/picked_child_id_notifier.dart';
import 'package:kamara_parent_app_ui/screens/main_screens/home_data.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/list_of_students.dart';
import '../../dummy_backend/models/student_model.dart';
import '../../dummy_backend/students.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _ctrl = ScrollController();

  @override
  Widget build(BuildContext context) {
    int id = Provider.of<PickedChildIdNotifier>(context).id;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: CustomScrollView(
        // physics: const BouncingScrollPhysics(),

        controller: _ctrl,
        slivers: [
          SliverAppBar(
            backgroundColor: MyColors.colorOnPrimary,
            elevation: 0.0,
            expandedHeight: 400.0,
            collapsedHeight: kToolbarHeight * 2,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: _studentNameAndThumbnail(context, id),
              titlePadding: EdgeInsetsDirectional.zero,
            ),
          ),
          HomeData(
            studentId: id,
          ),
        ],
      ),
    );
  }
}

/*
    This widget is to display child's name and photo
    in (SliverAppbar) title's widget.
*/

Widget _studentNameAndThumbnail(BuildContext cx, int id) {
  StudentModel student = Students(id: id).get();

  return HomePhotoDisplay(
    onPressed: () {
      BottomSheetDialog(
        cx: cx,
        floatingMargin: const EdgeInsets.only(
            top: 5.0, left: 30.0, right: 30.0, bottom: 35.0),
        header: DialogHeader(
          width: MediaQuery.of(cx).size.width * .25,
        ).pull(),
      ).floating(ListOfStudents(students: Students.all()));
    },
    img: Image.asset(
      student.img,
      fit: BoxFit.cover,
    ),
    name: student.name,
  );
}
