import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:weather_app/components/forecast_component.dart';
import 'package:weather_app/enums.dart';

int humidity = 80;
int temperature = 20;
int hours = 0;
int days = 0;
Clouds clouds = Clouds.MOON_CLOUD_FAST_WIND;
ForecastType forecastType = ForecastType.HOURLY;

class ForecastComponentStory extends Story {
  ForecastComponentStory()
      : super(
          name: 'Components/ForecastComponent',
          builder: (context) {
            humidity = context.knobs.sliderInt(label: 'Humidity', initial: 80, max: 100, min: 0);
            temperature = context.knobs.sliderInt(label: 'Temperature', initial: 20);
            humidity = context.knobs.sliderInt(label: 'Humidity', initial: 80, max: 100, min: 0);
            hours = context.knobs.sliderInt(label: 'Hours', initial: 0, min: -24, max: 24);
            days = context.knobs.sliderInt(label: 'Days', initial: 0, min: -30, max: 30);
            clouds = context.knobs.options(
              label: 'Clouds',
              initial: Clouds.MOON_CLOUD_FAST_WIND,
              options: [
                const Option(value: Clouds.MOON_CLOUD_FAST_WIND, label: 'Moon Cloud Fast Wind'),
                const Option(value: Clouds.MOON_CLOUD_MID_RAIN, label: 'Moon Cloud Mid Rain'),
                const Option(value: Clouds.SUN_CLOUD_ANGLED_RAIN, label: 'Sun Cloud Angled Rain'),
                const Option(value: Clouds.SUN_CLOUD_MID_RAIN, label: 'Sun Cloud Mid Rain'),
                const Option(value: Clouds.TORNADO, label: 'Tornado'),
              ],
            );
            forecastType = context.knobs.options(
              label: 'Forecast Type',
              initial: ForecastType.HOURLY,
              options: [
                const Option(value: ForecastType.HOURLY, label: 'Hourly'),
                const Option(value: ForecastType.DAILY, label: 'Daily'),
              ],
            );
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ForecastComponent(
                        date: DateTime.now().add(
                          forecastType == ForecastType.DAILY
                              ? Duration(
                                  days: days,
                                )
                              : Duration(
                                  hours: hours,
                                ),
                        ),
                        humidity: humidity,
                        temperature: temperature,
                        clouds: clouds,
                        forecastType: forecastType,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
}
