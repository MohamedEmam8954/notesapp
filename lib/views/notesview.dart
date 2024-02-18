import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realsenotesapp/cubits/notecubit/NotesCubit.dart';
import 'package:realsenotesapp/widgets/bodylistview.dart';
import 'package:realsenotesapp/widgets/bulidnotes.dart';
import 'package:realsenotesapp/widgets/constant.dart';
import 'package:realsenotesapp/widgets/custombottomsheet.dart';
import 'package:realsenotesapp/widgets/cutsomaappbar.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kprimarycolor,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              context: context,
              builder: (context) {
                return const CutomBottomModalSheet();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              CustomAppBar(
                ontap: () {},
                title: "Notes",
                icon: Icons.search,
              ),
              const SizedBox(
                height: 20,
              ),
              const BuildNotes(),
            ],
          ),
        ),
      ),
    );
  }
}
