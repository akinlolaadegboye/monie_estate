import 'package:flutter/material.dart';
import 'package:monie_estate/di/dependencies.dart';
import 'package:monie_estate/presentation/utils/notifiers.dart';
import 'package:monie_estate/presentation/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  runApp(const MonieEstateApp());
}


class MonieEstateApp extends StatelessWidget {
  const MonieEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: App.notifierProviders,
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppStyles.lightTheme,
            initialRoute: App.startingRoute,
            routes: App.routes
        )
    );
  }
}


