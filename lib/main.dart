import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;

  konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = 4 / 5 * inputUser;
      kelvin = inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  decoration:
                      InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
                  controller: etInput,
                  keyboardType: TextInputType.number,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Suhu dalam Kelvin",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '$kelvin',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Suhu dalam Reamur",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '$reamur',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                      onPressed: konversi,
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      child: Text("Konversi Suhu")),
                ),
              ],
            ),
          ),
        ));
  }
}
