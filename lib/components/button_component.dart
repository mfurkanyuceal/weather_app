import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/extensions.dart';

class ButtonComponent extends StatefulWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;

  const ButtonComponent({
    super.key,
    this.onPressed,
    this.iconData,
  });

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.p,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.4,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white.withOpacity(0.76),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                width: 65.p,
                height: 65.p,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: IconButton(
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(17.p),
                  backgroundColor: Colors.white,
                  minimumSize: Size(45.p, 45.p),
                  disabledBackgroundColor: Colors.white,
                ),
                onPressed: widget.onPressed,
                icon: FaIcon(
                  widget.iconData ?? FontAwesomeIcons.plus,
                  color: const Color(0xFF48319D),
                  size: 28.p,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
