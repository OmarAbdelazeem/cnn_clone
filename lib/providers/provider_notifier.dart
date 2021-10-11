// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testbloc12/di/app_injector.dart';
//
// typedef _SingletonNotifierBuilder<T> = Widget Function(T value);
//
// class ProviderNotifier<T extends ChangeNotifier> extends StatelessWidget {
//   final _SingletonNotifierBuilder<T> child;
//
//   ProviderNotifier({@required this.child}) : assert(child != null);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<T>.value(
//       value: getItInstance<T>(),
//       builder: (BuildContext context, _) {
//         return Consumer<T>(
//           builder: (BuildContext context, T value, _) {
//             return child(value);
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testbloc12/di/app_injector.dart';

typedef _SingletonNotifierBuilder<T> = Widget Function(T value);

class ProviderNotifier<T extends ChangeNotifier> extends StatelessWidget {
  final _SingletonNotifierBuilder<T>  child;
  final T  valueNotifier;

  ProviderNotifier({  this.child, this.valueNotifier})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: valueNotifier ?? getItInstance<T>(),
      builder: (BuildContext context, _) {
        return Consumer<T>(
          builder: (BuildContext context, T value, _) {
            return child(value);
          },
        );
      },
    );
  }
}
