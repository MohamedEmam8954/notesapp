import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realsenotesapp/cubits/notecubit/NotesCubit.dart';
import 'package:realsenotesapp/cubits/notecubit/notesstate.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/widgets/bodylistview.dart';
import 'package:realsenotesapp/widgets/nonotes.dart';

class BuildNotes extends StatelessWidget {
  const BuildNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, Notesate>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NoteCubit>(context).getnotes ?? [];
        if (notes.isEmpty) {
          return NoNotes();
        } else {
          return BodyListView(notes: notes);
        }
      },
    );
  }
}
