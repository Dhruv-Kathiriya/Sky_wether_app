import 'package:flutter/material.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'Conttroles/wetherconttrols.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherConttrols(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: Routes.myRoutes,
        );
      },
    );
  }
}
