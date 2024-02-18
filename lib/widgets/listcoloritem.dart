import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realsenotesapp/cubits/addnotecubit/addnotecubit.dart';
import 'package:realsenotesapp/widgets/coloritem.dart';
import 'package:realsenotesapp/widgets/constant.dart';

class Listcoloritem extends StatefulWidget {
  const Listcoloritem({super.key});

  @override
  State<Listcoloritem> createState() => _ListcoloritemState();
}

class _ListcoloritemState extends State<Listcoloritem> {
  int currntindex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37 * 2,
      child: ListView.builder(
        itemCount: kitemColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currntindex = index;
                  BlocProvider.of<AddNoteCubit>(context).color =
                      kitemColor[index].value;
                });
              },
              child: ColorItem(
                isactive: currntindex == index ? true : false,
                color: kitemColor[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
