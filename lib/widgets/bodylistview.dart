import 'package:flutter/material.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/widgets/notesviewbody.dart';

class BodyListView extends StatelessWidget {
  const BodyListView({
    super.key,
    required this.notes,
  });
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, item) {
            return NotesViewBody(
              noteModel: notes[item],
            );
          }),
    );
  }
}
