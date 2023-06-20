import 'package:change_color/core/enum/color_tone_enum.dart';
import 'package:change_color/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return Scaffold(
            body: InkWell(
              onTapDown: (value) {
                context.read<HomePageCubit>().changeColor(value.globalPosition);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [state.color, state.oldColor],
                  stops: [
                    state.tapDownDetails ?? 0,
                    1
                  ],
                )),
                child: Center(
                  child: Text(
                    'Hello there',
                    style: TextStyle(
                        color: state.colorTone == ColorTone.dark
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
