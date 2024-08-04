

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:joistic_test/app/routes/app_pages.dart';
import 'package:joistic_test/app/routes/app_routes.dart';
import 'package:joistic_test/l10n/localization.dart';
import 'package:joistic_test/utils/app_style.dart';
import 'package:joistic_test/utils/firebase_options.dart';





Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
    );





   User? user = await FirebaseAuth.instance.currentUser;
  var initialRoute = AppRoutes.loginScreen;


  if (user != null ) {
    initialRoute = AppRoutes.homeScreen;
  } else {
    initialRoute = AppRoutes.loginScreen;
  }
  runApp(MyApp(
    initialRoute: initialRoute,
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'homecarecustomer',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: AppStyles.themeData,
    );
  }
}