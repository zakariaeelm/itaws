import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:maan_food/widgets/loader/loading_provider.dart';

class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, CustomLoader(child: child!));
      } else {
        return CustomLoader(child: child!);
      }
    };
  }
}


class CustomLoader extends StatelessWidget {
  final Widget child;

  const CustomLoader({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider(),
            builder: (context, _) {
              return Stack(
                  children: [
                    child,
                    Consumer<LoadingProvider>(
                        builder: (context, provider, child) {
                          return provider.loading
                              ?  Container(
                              child: SpinKitDoubleBounce(color: Colors.orange),
                              color: Colors.black.withOpacity(0.5),)
                              : Container();
                        }
                    ),
                  ]
              );
            }
        )
    );
  }
}


