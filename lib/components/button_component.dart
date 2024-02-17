import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/extensions.dart';

class ButtonComponent extends StatefulWidget {
  const ButtonComponent({super.key});

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.p),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.white.withOpacity(0.76),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      constraints: BoxConstraints(
        minWidth: 64.p,
      ),
      child:  Container(
        padding: EdgeInsets.all(15.p),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFBBBFC7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.plus,
            color: const Color(0xFF48319D),
            size: 28.p,
          ),
        ),
      ),
    );
  }
}
