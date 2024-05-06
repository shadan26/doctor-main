import 'package:doctorproject/7doctor/moduels/bookingmodel/entity/userdata.dart';
import 'package:doctorproject/7doctor/moduels/bookingmodel/firemanger.dart';
import 'package:doctorproject/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FillPositionPage extends StatefulWidget {
  final LatLng initialPosition;

  const FillPositionPage({super.key, required this.initialPosition});

  @override
  _FillPositionPageState createState() => _FillPositionPageState();
}

class _FillPositionPageState extends State<FillPositionPage> {
  TextEditingController gender = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fill Position')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRlt3c6i14ej4uQg2bimiq53yd0tpwOhiAx-N2LnIB15_d-aZujXepYkkv2fVWkTxH264&usqp=CAU',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(labelText: 'name'),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: gender,
                  decoration: InputDecoration(labelText: 'gender'),
                  keyboardType: TextInputType.number,
                ),
                // TextFormField(
                //     controller: latitudeController,
                //     decoration: InputDecoration(labelText: 'Latitude'),
                //     keyboardType: TextInputType.number),
                // SizedBox(height: 10),
                // TextFormField(
                //   controller: longitudeController,
                //   decoration: InputDecoration(labelText: 'Longitude'),
                //   keyboardType: TextInputType.number,
                // ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    var data = AppointmentDataNerse(
                      userId: FirebaseAuth.instance.currentUser?.uid,
                      status: "initial",
                      name: name.text,
                      gender: gender.text,
                      latitude: widget.initialPosition.latitude,
                      longitude: widget.initialPosition.longitude,
                      doctoruuid: "ygsiBi8mpQdQGLWtXu6Joa2w2mw1",
                    );
                    //Appointment.instance.sendPushNotificationTopic(usermodel!.token!);
                    Appointment.instance.bookAppointmentnurse(data);
                  },
                  child: const Text('appointment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
