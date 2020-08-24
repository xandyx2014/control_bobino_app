import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculoEngordePage extends StatelessWidget {
  final pageController = new PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Ganacia de peso'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        pageController.nextPage(
            duration: Duration(milliseconds: 800), curve: Curves.easeIn);
      }),
      body: Center(
        child: SizedBox(
          height: Get.height * 0.70,
          width: Get.width,
          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            reverse: false,
            children: [
              Container(
                width: 50,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Card(
                  elevation: 15,
                  child: Center(
                    child: DatosAnimalLecheria(),
                  ),
                ),
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  elevation: 15,
                  child: Text('lorem'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DatosAnimalLecheria extends StatelessWidget {
  const DatosAnimalLecheria({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Datos del animal'),
            subtitle: Text('Completa los datos'),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Peso Kg',
                  style: TextStyle(color: Colors.black38),
                ),
                Slider(
                  label: '${200.0}',
                  value: 200.0,
                  min: 200.0,
                  max: 500.0,
                  divisions: 30,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: TextFormField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: false,
              ),
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                // hintText: 'Usuario',
                labelText: 'KG LECHE/DIA',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' % Materia grasa',
                  style: TextStyle(color: Colors.black38),
                ),
                Slider(
                  label: '${3.0}',
                  value: 3.0,
                  min: 3.0,
                  max: 5.5,
                  divisions: 25,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 220,
            child: MaterialButton(
              height: Get.height * 0.088,
              textColor: Colors.white,
              elevation: 6.0,
              color: ThemeData().primaryColor,
              onPressed: () {},
              child: Text(
                'Siguiente',
              ),
            ),
          )
        ],
      ),
    );
  }
}
