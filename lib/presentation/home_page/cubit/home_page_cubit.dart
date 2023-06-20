import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:change_color/core/enum/color_tone_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState());

  void changeColor(Offset tapDownDetails) {
    final generatedColor =generateColor();
    final colorTone = detectColorTone(generatedColor);
    final tapPosition = tapPositionCalculate(tapDownDetails);
    emit(state.copyWith(color: generatedColor, oldColor: state.color,colorTone: colorTone,tapDownDetails:tapPosition));
  }

  double tapPositionCalculate(Offset tapDownDetails){
   return  (tapDownDetails.dx * 2) / 1000;
  }

  Color generateColor(){
    final random = Random();
    final generatedColor = Color.fromRGBO(
      // with fourth arg as _random.nextDouble(),
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
     1,
    );
    return generatedColor;
  }

  ColorTone detectColorTone(Color generatedColor){
    final grayscale = (0.299 * generatedColor.red) + (0.587 * generatedColor.green) + (0.114 * generatedColor.blue);

    if(grayscale > 128){
     return ColorTone.light;
    }else{
      return ColorTone.dark;
    }
  }
}
