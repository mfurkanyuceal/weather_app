import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/asset_constants.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/theme/theme.dart';
import 'package:gap/gap.dart';

class ForecastComponent extends StatelessWidget {
  final DateFormat _format = DateFormat('j');
  final int humidity;
  final int temperature;
  final DateTime date;

  ForecastComponent({
    super.key,
    required this.date,
    required this.humidity,
    required this.temperature,
  });

  bool get isNow => _format.format(date) == _format.format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
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
            _format.format(date),
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
                Image.asset(
                  AssetConstants.moonCloudMidRain,
                  height: 32.p,
                  width: 32.p,
                ),
                Positioned(
                  top: 26.p,
                  child: Text(
                    '$humidity%',
                    style: BaseTheme.textStyles.bold.caption1.copyWith(
                      color: const Color(0xFF40cad8),
                    ),
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
