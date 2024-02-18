class AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSucess extends AddNoteState {}

class AddnoteFailure extends AddNoteState {
  final String errormessage;

  AddnoteFailure({required this.errormessage});
}

class AddNoteInitial extends AddNoteState {}
