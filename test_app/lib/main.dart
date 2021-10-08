import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  String mesaj = "Merhaba ilk uygulamam";
  var ogrenciler = ["Ahmet", "Hüzeyfe", "Demir"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti";
    } else if (puan >= 40) {
      mesaj = "Bütünlemeye kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: ogrenciler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(ogrenciler[index]);
                })),
        Center(
          child: ElevatedButton(
            child: Text("Sonucu gör"),
            onPressed: () {
              var mesaj = sinavHesapla(35);
              mesajGoster(context, mesaj);
            },
          ),
        ),
      ],
    );
  }
}
