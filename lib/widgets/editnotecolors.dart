import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realsenotesapp/cubits/addnotecubit/addnotecubit.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/widgets/coloritem.dart';
import 'package:realsenotesapp/widgets/constant.dart';

class EditNoteColors extends StatefulWidget {
  const EditNoteColors({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteColors> createState() => _EditNoteColorsState();
}

class _EditNoteColorsState extends State<EditNoteColors> {
  late int currentindex;
  @override
  void initState() {
    currentindex = kitemColor.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37 * 2,
      child: ListView.builder(
        itemCount: kitemColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = index;
                  widget.noteModel.color = kitemColor[index].value;
                });
              },
              child: ColorItem(
                isactive: currentindex == index ? true : false,
                color: kitemColor[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
