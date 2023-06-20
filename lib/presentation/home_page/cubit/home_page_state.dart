part of 'home_page_cubit.dart';

 class HomePageState extends Equatable {
  const HomePageState({this.color = Colors.white,this.oldColor = Colors.white,this.colorTone = ColorTone.light,this.tapDownDetails});

  final Color color;
  final Color oldColor;
  final ColorTone colorTone;
  final double? tapDownDetails;

  @override
  List<Object?> get props =>[color,oldColor,colorTone,tapDownDetails];

  HomePageState copyWith({
    Color? color,
    Color? oldColor,
    ColorTone? colorTone,
    double? tapDownDetails,
  }) {
    return HomePageState(
      color: color ?? this.color,
      oldColor: oldColor ?? this.oldColor,
      colorTone: colorTone ?? this.colorTone,
      tapDownDetails: tapDownDetails ?? this.tapDownDetails,
    );
  }
}


