import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:weather_app/components/forecast_component.dart';
import 'package:weather_app/extensions.dart';

int humidity = 80;
int temperature = 20;

class ForecastComponentStory extends Story {
  ForecastComponentStory()
      : super(
          name: 'Components/ForecastComponent',
          builder: (context) {
            humidity = context.knobs.sliderInt(label: 'Humidity', initial: 80, max: 100, min: 0);
            temperature = context.knobs.sliderInt(label: 'Temperature', initial: 20);
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ForecastComponent(
                        date: DateTime.now(),
                        humidity: humidity,
                        temperature: temperature,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
}
