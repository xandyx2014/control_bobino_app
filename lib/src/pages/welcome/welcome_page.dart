import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: [
        Slide(
          title: "Bienvenido",
          description:
              "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: "assets/menu.jpeg",
          backgroundColor: Theme.of(context).primaryColor,
        ),
        Slide(
          title: "Bienvenido",
          description:
              "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: "assets/menu.jpeg",
          backgroundColor: Theme.of(context).primaryColor,
        ),
        Slide(
          title: "Bienvenido",
          description:
              "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: "assets/menu.jpeg",
          backgroundColor: Theme.of(context).primaryColor,
        ),
        Slide(
          title: "Bienvenido",
          description:
              "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: "assets/menu.jpeg",
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
      onDonePress: () {
        Navigator.of(context).pushNamedAndRemoveUntil('auth', (route) => false);
      },
      nameDoneBtn: 'Salir',
      nameNextBtn: 'Sgte',
      namePrevBtn: 'Ant',
      nameSkipBtn: 'Saltar',
    );
  }
}
