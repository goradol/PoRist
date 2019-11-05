import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Explicit
 String resultCode ='';
// method
  Widget authenButton() {
    return RaisedButton(
      color: Colors.orange[700],
      child: Text(
        'Authentication',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You click Authen');
        readQRcode();
      },
    );
  }

Future<void> readQRcode()async{

  try {
    resultCode = await BarcodeScanner.scan();
    print('resultCode = $resultCode');
    getUserWhereResultCode();
  } catch (e) {}
}

Future<void> getUserWhereResultCode()async{
  String urlAPI = 'http://10.28.50.26/getUserWhereResultPo.php?isAdd=true&ResultCode=$resultCode';
  Response response = await get(urlAPI);
  //print('respond = $response');
  var result = json.decode(response.body);
  print('result ======================================================== $result');
}


  Widget showAppName() {
    return Text(
      'Po Rist',
      style: TextStyle(
          color: Colors.red.shade100,
          fontSize: 60,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
            colors: [Colors.white, Colors.green],radius: 1.0
          )),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                authenButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
