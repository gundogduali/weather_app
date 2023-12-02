import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/view/route/app_router.dart';
import 'package:weather_app/view/theme/app_theme.dart';
import 'package:weather_app/viewmodel/location_viewmodel.dart';
import 'package:weather_app/viewmodel/weather_viewmodel.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherViewModel>(
          create: (context) => getIt<WeatherViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<LocationViewModel>(),
        ),
      ],
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) {
          return MaterialApp.router(
            title: 'Weather App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(lightDynamic).themeData,
            routerConfig: getIt<AppRouter>().config(),
          );
        },
      ),
    );
  }
}
