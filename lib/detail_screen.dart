import 'package:flutter/material.dart';
import 'package:tempat_wisata/FarmList.dart';

import 'model/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

// Screen
class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;

  const DetailWebPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Wisata Bandung",
                    style: TextStyle(fontFamily: "Staatliches", fontSize: 32)),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Column(children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(widget.place.imageAsset),
                      ),
                      const SizedBox(height: 16.0),
                      Scrollbar(
                        controller: _scrollController,
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.place.imageUrls.map((url) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(url),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ])),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.place.name,
                                style: const TextStyle(
                                    fontFamily: "Staatliches", fontSize: 30.0),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.place.openDays,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const FavoriteButton()
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.access_time),
                                  const SizedBox(width: 8),
                                  Text(
                                    widget.place.openTime,
                                    style: informationTextStyle,
                                  )
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  const Icon(Icons.monetization_on),
                                  const SizedBox(width: 8),
                                  Text(
                                    widget.place.ticketPrice,
                                    style: informationTextStyle,
                                  )
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.place.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontFamily: 'Oxygen', fontSize: 16.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

// class DetailWebPage extends StatelessWidget {
//   final TourismPlace place;
//
//   const DetailWebPage({Key? key, required this.place}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const Text(
//             "Wisata Bandung",
//             style: TextStyle(fontFamily: 'Staatliches', fontSize: 32),
//           ),
//           const SizedBox(height: 32),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   Expanded(
//                       child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset(place.imageAsset),
//                       ),
//                       const SizedBox(height: 16),
//                       Container(
//                         height: 150,
//                         padding: const EdgeInsets.only(bottom: 16),
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: place.imageUrls.map((url) {
//                             return Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Image.network(url),
//                                 ));
//                           }).toList(),
//                         ),
//                       )
//                     ],
//                   )),
//                   const SizedBox(width: 32),
//                   Expanded(
//                     child: Card(
//                       child: Container(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: <Widget>[
//                             Text(
//                               place.name,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 fontSize: 30.0,
//                                 fontFamily: 'Staatliches',
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Row(
//                                   children: <Widget>[
//                                     const Icon(Icons.calendar_today),
//                                     const SizedBox(width: 8.0),
//                                     Text(place.openDays),
//                                   ],
//                                 ),
//                                 const FavoriteButton(),
//                               ],
//                             ),
//                             Row(
//                               children: <Widget>[
//                                 const Icon(Icons.access_time),
//                                 Text(place.openTime),
//                               ],
//                             ),
//                             const SizedBox(height: 8.0),
//                             Row(
//                               children: <Widget>[
//                                 const Icon(Icons.monetization_on),
//                                 Text(place.ticketPrice)
//                               ],
//                             ),
//                             Container(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 16.0),
//                               child: Text(
//                                 place.description,
//                                 textAlign: TextAlign.justify,
//                                 style: const TextStyle(
//                                     fontSize: 16.0, fontFamily: 'Oxygen'
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;
  VehicleType? selectedVehicle;
  final TextEditingController _controller = TextEditingController();
  Map<VehicleType, IconData> vehicleIcons = {
    VehicleType.Bus: Icons.directions_bus,
    VehicleType.Motor: Icons.motorcycle,
    VehicleType.Mobil: Icons.directions_car,
  };

  DetailMobilePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Gambar dan arrow
              Stack(
                children: <Widget>[
                  Image.asset(place.imageAsset),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  )
                ],
              ),
              // Judul
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
              ),
              // Icon
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Icon(Icons.calendar_today),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          place.openDays,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Icon(Icons.access_time),
                        const SizedBox(height: 8.0),
                        Text(
                          place.openTime,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Icon(Icons.monetization_on),
                        const SizedBox(height: 8.0),
                        Text(
                          place.ticketPrice,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Description
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  place.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
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
                            child: Text(vehicle.toString().split('.').last),
                          );
                        }).toList(),
                        hint: const Text("Select Vehicles"),
                        value: selectedVehicle,
                        onChanged: (VehicleType? value) {},
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              // Text Field
              Container(
                margin: const EdgeInsets.all(16.0),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FarmList(_controller.text)));
                    },
                    child: const Text("Pesan"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// Favorite
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

enum VehicleType { Bus, Motor, Mobil }
