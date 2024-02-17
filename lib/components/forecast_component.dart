import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/cloud_asset.dart';
import 'package:weather_app/enums.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/theme/theme.dart';
import 'package:gap/gap.dart';

enum ForecastType {
  HOURLY,
  DAILY;
}

class ForecastComponent extends StatelessWidget {
  final int humidity;
  final int temperature;
  final DateTime date;
  final Clouds clouds;
  final ForecastType forecastType;

  final DateTime now = DateTime.now();

  ForecastComponent({
    super.key,
    required this.date,
    required this.humidity,
    required this.temperature,
    required this.clouds,
    this.forecastType = ForecastType.HOURLY,
  });

  bool get isNow {
    if (now.year != date.year || now.month != date.month || now.day != date.day) {
      return false;
    }
    if (forecastType == ForecastType.HOURLY) {
      return now.hour == date.hour;
    }
    return true;
  }

  String get formattedDate {
    if (forecastType == ForecastType.HOURLY) {
      return DateFormat('j').format(date);
    }
    return DateFormat('EEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 60.p,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.p, vertical: 16.p),
      decoration: BoxDecoration(
        color: isNow ? const Color(0xFF48319d) : const Color(0xFF35316b),
        borderRadius: BorderRadius.circular(30.p),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.p,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isNow && forecastType == ForecastType.HOURLY ? "NOW" : formattedDate,
            style: BaseTheme.textStyles.bold.subheadline.copyWith(
              color: Colors.white,
            ),
          ),
          Gap(
            16.p,
          ),
          SizedBox(
            height: 38.p,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (cloudAsset.containsKey(clouds))
                  Image.asset(
                    cloudAsset[clouds]!,
                    height: 32.p,
                    width: 32.p,
                  ),
                Positioned(
                  width: 32.p,
                  top: 30.p,
                  child: Text(
                    '$humidity%',
                    style: BaseTheme.textStyles.bold.caption1.copyWith(
                      color: const Color(0xFF40cad8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Gap(
            16.p,
          ),
          Text(
            '$temperature°',
            style: BaseTheme.textStyles.bold.subheadline.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
