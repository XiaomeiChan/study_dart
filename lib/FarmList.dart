
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FarmList extends StatefulWidget {
  String? pesan;

  FarmList(this.pesan, {Key? key}) : super(key : key);
  @override
  State<StatefulWidget> createState() => _FarmList(pesan);

}

class _FarmList extends State<FarmList>{
  String? pesan;

  _FarmList(this.pesan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Farm List nya adalah $pesan"),
    );
  }

}