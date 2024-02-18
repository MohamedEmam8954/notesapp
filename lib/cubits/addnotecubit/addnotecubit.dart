import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:realsenotesapp/cubits/addnotecubit/addnotestate.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/widgets/constant.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  // bool isloading = false;
  int color = const Color(0xfff5c396).value;
  addnote(NoteModel noteModel) async {
    emit(AddNoteLoading());
    try {
      // isloading = true;
      var notes = Hive.box<NoteModel>(knotes);
      await notes.add(noteModel);
      noteModel.color = color;
      //   isloading = false;
      emit(AddNoteSucess());
    } catch (e) {
      emit(
        AddnoteFailure(errormessage: "the error is $e"),
      );
    }
  }
}
