import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/extensions.dart';

enum ProgressBarType {
  horizontal,
  vertical;

  bool get isHorizontal => this == ProgressBarType.horizontal;

  bool get isVertical => this == ProgressBarType.vertical;
}

class ProgressBarComponent extends StatefulWidget {
  final double indent;
  final double endIndent;
  final double radius;
  final ProgressBarType type;

  final double? value;

  final List<Color> colors;
  final Color dotBorderColor;

  final Size size;

  static const List<Color> _defaultColors = [
    Color(0xFF3659B1),
    Color(0xFFe64395),
  ];

  static const Color _defaultDorBorderColor = Color(0xFF282455);

  ProgressBarComponent({
    super.key,
    double? radius,
    List<Color>? colors,
    Color? dotBorderColor,
    this.indent = 0,
    this.endIndent = 0,
    this.type = ProgressBarType.horizontal,
    this.value,
    required this.size,
  })  : radius = radius ?? 16.p,
        colors = colors ?? _defaultColors,
        dotBorderColor = dotBorderColor ?? _defaultDorBorderColor;

  ProgressBarComponent.vertical({
    super.key,
    double? radius,
    List<Color>? colors,
    Color? dotBorderColor,
    this.indent = 0,
    this.endIndent = 0,
    this.value,
    required this.size,
  })  : type = ProgressBarType.vertical,
        radius = radius ?? 16.p,
        colors = colors ?? _defaultColors,
        dotBorderColor = dotBorderColor ?? _defaultDorBorderColor;

  ProgressBarComponent.horizontal({
    super.key,
    double? radius,
    List<Color>? colors,
    Color? dotBorderColor,
    this.indent = 0,
    this.endIndent = 0,
    this.value,
    required this.size,
  })  : type = ProgressBarType.horizontal,
        radius = radius ?? 16.p,
        colors = colors ?? _defaultColors,
        dotBorderColor = dotBorderColor ?? _defaultDorBorderColor;

  @override
  State<ProgressBarComponent> createState() => _ProgressBarComponentState();
}

class _ProgressBarComponentState extends State<ProgressBarComponent> {
  double get thickness => widget.type.isVertical ? widget.size.width : widget.size.height;

  double get value => widget.value ?? 0;

  ProgressBarType get type => widget.type;

  double get verticalSize => widget.size.height - widget.size.width;

  double get horizontalSize => widget.size.width - widget.size.height;

  double get horizontalPosition => min(horizontalSize, value * horizontalSize);

  double get verticalPosition => min(verticalSize, value * verticalSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      margin: EdgeInsets.only(
        left: widget.type.isVertical ? 0 : widget.indent,
        top: widget.type.isVertical ? widget.indent : 0,
        right: widget.type.isVertical ? 0 : widget.endIndent,
        bottom: widget.type.isVertical ? widget.endIndent : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        gradient: LinearGradient(
          begin: widget.type.isVertical ? Alignment.bottomCenter : Alignment.centerLeft,
          end: widget.type.isVertical ? Alignment.topCenter : Alignment.centerRight,
          colors: widget.colors,
        ),
      ),
      child: widget.value == null
          ? const SizedBox()
          : Stack(
              children: [
                Positioned(
                  left: widget.type.isHorizontal ? horizontalPosition : 0,
                  bottom: widget.type.isVertical ? verticalPosition : 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: widget.dotBorderColor,
                        width: thickness / 8,
                      ),
                    ),
                    width: thickness,
                    height: thickness,
                  ),
                ),
              ],
            ),
    );
  }
}
