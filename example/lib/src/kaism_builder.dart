import 'package:flutter/material.dart';
import 'package:statemanagement/statemanagement.dart';

import 'kaism_factory.dart';

class KaismBuilder<B extends KaiSM, S> extends StatelessWidget {
  final AsyncWidgetBuilder<S> builder;
  const KaismBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final bloc = KaismFactory.of(context)?.kais;
    return StreamBuilder<S>(stream: bloc?.stream as Stream<S>, builder: builder);
  }
}
