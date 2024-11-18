import 'package:flutter/material.dart';
import 'package:statemanagement/statemanagement.dart';

class KaismFactory extends InheritedWidget{
  final KaiSM kaism;

  KaismFactory({
    required this.kaism, required super.child
  });

  static KaismFactory? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KaismFactory>();
  }

  @override
  bool updateShouldNotify(covariant KaismFactory oldWidget) {
    return false;
  }
}
