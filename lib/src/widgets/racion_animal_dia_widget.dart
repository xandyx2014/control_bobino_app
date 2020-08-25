import 'package:flutter/material.dart';

class RacionAnimalWidget extends StatelessWidget {
  const RacionAnimalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          title: Text('Racion Animal'),
          subtitle: Text('resultados'),
        ),
        SizedBox(
          height: size.height * 0.38,
          child: PageView.builder(
            controller: PageController(initialPage: 0, viewportFraction: 0.8),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ThemeData().primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TitleCard(property: 'Insumo', value: 'Lorem Ipsum'),
                      TitleCard(property: 'Kg/dia', value: '1.0'),
                      TitleCard(property: 'Precio/Kg', value: '1.0'),
                      TitleCard(property: 'Precio total', value: '1.0'),
                      TitleCard(property: '% Inclusion', value: '1.0'),
                      TitleCard(property: 'Kg/Tn', value: '000.00'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        TitleCard(
          property: 'SubTotal Concentrado',
          value: '00.0',
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'SubTotal Forraje',
          value: '00.0',
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'Total KG/DIA TMR',
          value: '00.0',
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'Precio total',
          value: '00.0',
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'Precio Tn',
          value: '00.0',
          textColor: Colors.black,
        ),
      ],
    );
  }
}

class TitleCard extends StatelessWidget {
  final String property;
  final String value;
  final Color textColor;

  const TitleCard(
      {Key key,
      @required this.property,
      @required this.value,
      this.textColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            '$property :',
            style: TextStyle(color: textColor),
          ),
          Spacer(),
          Text(
            '$value',
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }
}
