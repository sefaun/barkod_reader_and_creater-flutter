import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barkod Okuyucu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Barkod Okuyucu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController qradres = TextEditingController();
  String qrCodeResult = "";

  String qrcodedata = "http://www.sefaun.com/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  color: Colors.purpleAccent,
                  onPressed: () async {
                    String codeScanner = await BarcodeScanner.scan();
                    setState(() {
                      qrCodeResult = codeScanner;
                      print(qrCodeResult);
                    });
                  },
                  child: Icon(Icons.settings_overscan)),
              Text(qrCodeResult),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: QrImage(data: qrcodedata),
              ),
              TextField(
                controller: qradres,
              ),
              FlatButton(
                  color: Colors.purpleAccent,
                  onPressed: () async {
                    if (qradres.text.isEmpty) {
                      setState(() {
                        qrcodedata = "http://www.sefaun.com/";
                      });
                    } else {
                      setState(() {
                        qrcodedata = qradres.text;
                      });
                    }
                  },
                  child: Icon(Icons.settings_overscan)),
              Text(qradres.text)
            ],
          ),
        ),
      ),
    );
  }
}
