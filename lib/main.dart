import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maan_food/services/geo_location.dart';
import 'package:maan_food/services/user_provider.dart';
import 'package:maan_food/widgets/loader/loader_widget.dart';
import 'package:maan_food/widgets/loader/loading_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'Screens/SplashScreen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoadingProvider>(
              create: (_) => LoadingProvider()),
          ChangeNotifierProvider<CurrentUserProvider>(
              create: (_) => CurrentUserProvider()),
          ChangeNotifierProvider<PositionProvider>(
              create: (_) => PositionProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            // Add the line below to get horizontal sliding transitions for routes.
            pageTransitionsTheme: const PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
          ),
          builder: LoadingScreen.init(),
          title: 'Maan LMS',
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
          },
        ));
  }
}
