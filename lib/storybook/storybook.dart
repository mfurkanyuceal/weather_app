import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:weather_app/storybook/stories/button_component_story.dart';
import 'package:weather_app/storybook/stories/forecast_component_story.dart';
import 'package:weather_app/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DimensionProxy.proxy = (n) {
    return min(n!.h, n.w);
  };
  await ScreenUtil.ensureScreenSize();
  runApp(const WeatherAppStorybook());
}

class WeatherAppStorybook extends StatelessWidget {
  const WeatherAppStorybook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Weather App Story Book',
          builder: (ctx, child) {
            ScreenUtil.init(ctx);
            return Theme(
              data: ThemeData(
                textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
              ),
              child: Storybook(
                initialStory: "Components/ButtonComponent",
                showPanel: true,
                plugins: [
                  DeviceFramePlugin(
                    deviceInfos: [
                      Devices.ios.iPhone13,
                    ],
                    initialData: (
                      isFrameVisible: true,
                      device: Devices.ios.iPhone13,
                      orientation: Orientation.portrait,
                    ),
                  ),
                ],
                stories: [
                  ForecastComponentStory(),
                  ButtonComponentStory(),
                ],
              ),
            );
          },
          home: child,
        );
      },
    );
  }
}
