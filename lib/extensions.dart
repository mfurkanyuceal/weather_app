import 'package:weather_app/utils.dart';

extension DimensionProxyExtension on num {
  double get p {
    return DimensionProxy.proxy?.call(this) ?? toDouble();
  }
}