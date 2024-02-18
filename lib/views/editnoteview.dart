import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realsenotesapp/cubits/notecubit/NotesCubit.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/widgets/customtextformfield.dart';
import 'package:realsenotesapp/widgets/cutsomaappbar.dart';
import 'package:realsenotesapp/widgets/editnotecolors.dart';
import 'package:realsenotesapp/widgets/showmessages.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              CustomAppBar(
                title: "Edit Note",
                icon: Icons.check,
                ontap: () async {
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.subtitle =
                      subtitle ?? widget.noteModel.subtitle;
                  await widget.noteModel.save();
                  BlocProvider.of<NoteCubit>(context).fetchAllnotes();
                  Navigator.of(context).pop();
                  showmessage(context, "Notes Edit sucessfully");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                  onchanged: (value) {
                    title = value;
                  },
                  hintext: widget.noteModel.title),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                onchanged: (value) {
                  subtitle = value;
                },
                hintext: widget.noteModel.subtitle,
                maxline: 5,
              ),
              const SizedBox(
                height: 35,
              ),
              EditNoteColors(
                noteModel: widget.noteModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
