import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hesablayıcı",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asan Kalkulyator (V.Z)'),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController sayi1Controller = TextEditingController();
  TextEditingController sayi2Controller = TextEditingController();
  num sonuc = 0;

  void hesapla(String islem) {
    num s1 = num.tryParse(sayi1Controller.text) ?? 0;
    num s2 = num.tryParse(sayi2Controller.text) ?? 0;

    setState(() {
      if (islem == "+") {
        sonuc = s1 + s2;
      } else if (islem == "-") {
        sonuc = s1 - s2;
      } else if (islem == "*") {
        sonuc = s1 * s2;
      } else if (islem == "/") {
        if (s2 != 0) {
          sonuc = s1 / s2;
        } else {
          sonuc = 0; 
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(55),
      child: Center(
        child: Column(
          children: <Widget>[
            Text("$sonuc"),
            TextField(
              controller: sayi1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Birinci reqem"),
            ),
            TextField(
              controller: sayi2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "İkinci reqem"),
            ),
            ElevatedButton(
              onPressed: () => hesapla("+"),
              child: Text("+ üste gel"),
            ),
            ElevatedButton(
              onPressed: () => hesapla("-"),
              child: Text("- çıx"),
            ),
            ElevatedButton(
              onPressed: () => hesapla("*"),
              child: Text("* vur"),
            ),
            ElevatedButton(
              onPressed: () => hesapla("/"),
              child: Text("/ bõl"),
            ),
          ],
        ),
      ),
    );
  }
}
