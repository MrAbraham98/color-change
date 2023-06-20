import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:change_color/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:change_color/core/enum/color_tone_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePageCubit', () {
    late HomePageCubit homePageCubit;

    setUp(() {
      homePageCubit = HomePageCubit();
    });

    tearDown(() {
      homePageCubit.close();
    });

    group('generateColor', () {
      test('generateColor should return a valid Color', () {
        final generatedColor = homePageCubit.generateColor();
        expect(generatedColor, isInstanceOf<Color>());
      });

      test('generatedColor should have valid RGB values', () {
        final generatedColor = homePageCubit.generateColor();
        expect(generatedColor.red, greaterThanOrEqualTo(0));
        expect(generatedColor.red, lessThan(256));
        expect(generatedColor.green, greaterThanOrEqualTo(0));
        expect(generatedColor.green, lessThan(256));
        expect(generatedColor.blue, greaterThanOrEqualTo(0));
        expect(generatedColor.blue, lessThan(256));
      });

      test('generatedColor should have an alpha value of 1', () {
        final generatedColor = homePageCubit.generateColor();
        expect(generatedColor.alpha, equals(255));
      });
    });

    group('detectColorTone', () {
      test('should return light for a light color', () {
        final generatedColor = Colors.white;
        final colorTone = homePageCubit.detectColorTone(generatedColor);

        expect(colorTone, ColorTone.light);
      });

      test('should return dark for a dark color', () {
        final generatedColor = Colors.black;
        final colorTone = homePageCubit.detectColorTone(generatedColor);

        expect(colorTone, ColorTone.dark);
      });
    });

    group('tapPositionCalculate', () {
      test('should return the correct calculated value', () {
        final tapDownDetails = Offset(200, 0);
        final result = homePageCubit.tapPositionCalculate(tapDownDetails);

        expect(result, equals(0.4)); // Replace with the expected result
      });
    });




  });


}