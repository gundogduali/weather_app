import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/di/di.dart';
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
      ],
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    await context.read<WeatherViewModel>().getWeather();
                  },
                  child: Text(
                    context.watch<WeatherViewModel>().state.status.toString(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
