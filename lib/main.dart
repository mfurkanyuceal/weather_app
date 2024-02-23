import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/components/button_component.dart';
import 'package:weather_app/components/forecast_component.dart';
import 'package:weather_app/components/progress_bar_component.dart';
import 'package:weather_app/enums.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/logger.dart';
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
  double _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282455),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.p),
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ForecastComponent(
                date: DateTime.now(),
                humidity: 62,
                temperature: 20,
                clouds: Clouds.SUN_CLOUD_MID_RAIN,
              ),
              Gap(10.p),
              ButtonComponent(
                onPressed: () {
                  _incrementCounter();
                  logger.i('ButtonComponent pressed, counter: $_counter');
                },
              ),
              Gap(10.p),
              ProgressBarComponent.horizontal(
                size: Size(200.p, 10.p),
                indent: 20.p,
                endIndent: 20.p,
                radius: 20.p,
                value: _counter,
              ),
              Gap(10.p),
              ProgressBarComponent.vertical(
                size: Size(10.p, 200.p),
                indent: 20.p,
                endIndent: 20.p,
                radius: 20.p,
                value: _counter,
              ),
              Gap(10.p),
              Text(
                '$_counter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
              Gap(10.p),
              ButtonComponent(
                iconData: FontAwesomeIcons.arrowsRotate,
                onPressed: () {
                  setState(() {
                    _counter = 0;
                  });
                  logger.i('ButtonComponent pressed, counter: $_counter');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
