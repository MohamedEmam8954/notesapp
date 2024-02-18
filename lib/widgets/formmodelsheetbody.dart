import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:realsenotesapp/cubits/addnotecubit/addnotecubit.dart';
import 'package:realsenotesapp/cubits/addnotecubit/addnotestate.dart';
import 'package:realsenotesapp/models/notemodel.dart';
import 'package:realsenotesapp/widgets/constant.dart';
import 'package:realsenotesapp/widgets/custombuttom.dart';
import 'package:realsenotesapp/widgets/customtextformfield.dart';
import 'package:realsenotesapp/widgets/listcoloritem.dart';

class FormModalBottomSheetBody extends StatefulWidget {
  const FormModalBottomSheetBody({super.key});

  @override
  State<FormModalBottomSheetBody> createState() =>
      _FormModalBottomSheetBodyState();
}

class _FormModalBottomSheetBodyState extends State<FormModalBottomSheetBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  String? title;
  String? subtitle;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintext: "title",
            onchanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintext: "content",
            maxline: 5,
            onchanged: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 35,
          ),
          const Listcoloritem(),
          const SizedBox(
            height: 35,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBottom(
                isloading: state is AddNoteLoading ? true : false,
                ontap: () {
                  if (globalKey.currentState!.validate()) {
                    String time = dateTime();
                    BlocProvider.of<AddNoteCubit>(context).addnote(
                      NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        color: BlocProvider.of<AddNoteCubit>(context).color,
                        date: time,
                      ),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  String dateTime() {
    var format = DateFormat.yMd();
    var dateString = format.format(DateTime.now());
    log(dateString);
    return dateString;
  }
}
