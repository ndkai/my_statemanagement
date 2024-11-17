import 'package:flutter/material.dart';
import 'package:statemanagement/statemanagement.dart';


typedef KaismWidgetBuilder<T> =
Widget Function(BuildContext context, T state);

class KaismBuilder<B extends KaiSM, S> extends StatelessWidget {
  final KaismWidgetBuilder<S> builder;
  const KaismBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final bloc = KaismFactory.of(context)?.kais;
    return StreamBuilder<S>(stream: bloc?.stream as Stream<S>, builder: (context, snapshot){
      return builder(context, snapshot.data as S);
    });
  }


}
