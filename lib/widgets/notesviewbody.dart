import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:realsenotesapp/cubits/notecubit/NotesCubit.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/views/editnoteview.dart';
import 'package:realsenotesapp/widgets/showmessages.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(
                noteModel: widget.noteModel,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(widget.noteModel.color),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.noteModel.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      widget.noteModel.delete();
                      BlocProvider.of<NoteCubit>(context).fetchAllnotes();
                      showmessage(context, "Notes delete sucessfully");
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ],
              ),
              Text(
                widget.noteModel.subtitle,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.noteModel.date,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4), fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
