import 'package:flutter/material.dart';
import 'package:tempat_wisata/FarmList.dart';

import 'model/tourism_place.dart';

class DetailScreen extends StatefulWidget {
  String? vehicle;
  final  TourismPlace place;
  DetailScreen({Key? key, required this.place}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  VehicleType? selectedVehicle;
  TextEditingController _controller = TextEditingController();
  Map<VehicleType, IconData> vehicleIcons = {
    VehicleType.Bus: Icons.directions_bus,
    VehicleType.Motor: Icons.motorcycle,
    VehicleType.Mobil: Icons.directions_car,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Gambar
              Container(
                child: Center(
                  child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                ),
              ),
              // Judul
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const Text(
                  'Farm House Lembang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
              ),
              // Icon
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        Text('Open Everyday'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        Text('09:00 - 20:00'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        Text('Rp 30.000'),
                      ],
                    ),
                  ],
                ),
              ),
              // Description
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              // ComboBox
              Container(
                  margin: const EdgeInsets.all(16.0),
                  // Contoh margin untuk mengelilingi Row
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: Icon(
                          selectedVehicle != null
                              ? vehicleIcons[selectedVehicle!]
                              : Icons.car_rental,
                        ),
                      ),
                      DropdownButton<VehicleType>(
                        items: VehicleType.values.map((vehicle) {
                          return DropdownMenuItem<VehicleType>(
                            value: vehicle,
                            child: Text(vehicle
                                .toString()
                                .split('.')
                                .last),
                          );
                        }).toList(),
                        hint: const Text("Select Vehicles"),
                        value: selectedVehicle,
                        onChanged: (VehicleType? value) {
                          setState(() {
                            selectedVehicle = value;
                          });
                        },
                      ),
                    ],
                  )),
              // Daftar Gambar
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                              'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                        ) ,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child : Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child : Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              // Text Field
              Container(
                margin: EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Write your name here...',
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                    // Menambahkan border
                    filled: true,
                    // Mengisi latar belakang dengan warna
                    fillColor: Colors.white, // Warna latar belakang
                  ),
                ),
              ),
              // Button
              Container(
                  margin: const EdgeInsets.all(16.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FarmList(_controller.text)));
                    },
                    child: const Text("Pesan"),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


enum VehicleType { Bus, Motor, Mobil }
