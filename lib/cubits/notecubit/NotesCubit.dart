import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:realsenotesapp/cubits/notecubit/notesstate.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/widgets/constant.dart';

class NoteCubit extends Cubit<Notesate> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel>? getnotes;

  List<NoteModel>? fetchAllnotes() {
    var notes = Hive.box<NoteModel>(knotes);
    getnotes = notes.values.toList();

    emit(NoteSucess());
    return getnotes;
  }
}
