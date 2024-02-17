import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:weather_app/components/button_component.dart';

class ButtonComponentStory extends Story {
  ButtonComponentStory()
      : super(
          name: 'Components/ButtonComponent',
          builder: (context) {
            return const Scaffold(
              backgroundColor: Color(0xFF48319D),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ButtonComponent(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
}
