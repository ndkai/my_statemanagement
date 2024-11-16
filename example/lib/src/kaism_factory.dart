import 'package:flutter/material.dart';
import 'package:statemanagement/statemanagement.dart';

class KaismFactory extends InheritedWidget{
  final KaiSM kais;

  KaismFactory({
    required this.kais, required super.child
  });

  static KaismFactory? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KaismFactory>();
  }

  @override
  bool updateShouldNotify(covariant KaismFactory oldWidget) {
    return false;
  }
}
