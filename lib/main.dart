import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/components/forecast_component.dart';
import 'package:weather_app/constants/asset_constants.dart';
import 'package:weather_app/enums.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DimensionProxy.proxy = (n) {
    return min(n!.h, n.w);
  };
  await ScreenUtil.ensureScreenSize();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Weather App',
          theme: ThemeData(
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 17.sp),
            ),
          ),
          builder: (ctx, child) {
            ScreenUtil.init(ctx);
            return const MyHomePage(title: 'Flutter Demo Home Page');
          },
          home: child,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ForecastComponent(
              date: DateTime.now(),
              humidity: 62,
              temperature: 20,
              clouds: Clouds.SUN_CLOUD_MID_RAIN,
            ),
          ],
        ),
      ),
    );
  }
}
