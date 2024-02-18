import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realsenotesapp/cubits/addnotecubit/addnotecubit.dart';
import 'package:realsenotesapp/cubits/addnotecubit/addnotestate.dart';
import 'package:realsenotesapp/cubits/notecubit/NotesCubit.dart';
import 'package:realsenotesapp/widgets/constant.dart';
import 'package:realsenotesapp/widgets/formmodelsheetbody.dart';
import 'package:realsenotesapp/widgets/showmessages.dart';

class CutomBottomModalSheet extends StatelessWidget {
  const CutomBottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: Padding(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              BlocConsumer<AddNoteCubit, AddNoteState>(
                listener: (context, state) {
                  if (state is AddnoteFailure) {
                    log(state.errormessage);
                  } else if (state is AddNoteSucess) {
                    BlocProvider.of<NoteCubit>(context).fetchAllnotes();
                    Navigator.pop(context);
                    showmessage(context, "Notes Add Sucessfully");
                  }
                },
                builder: (context, state) {
                  return AbsorbPointer(
                    absorbing: state is AddNoteLoading ? true : false,
                    child: const SingleChildScrollView(
                      child: FormModalBottomSheetBody(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
