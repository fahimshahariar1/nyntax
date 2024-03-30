import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/screens/additional/additional_charges.dart';
import 'package:nyntaxenvoicapp/screens/additional_charges.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Vehicle extends StatefulWidget {
  final String reservationID;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const Vehicle({
    Key? key,
    required this.reservationID,
    required this.pickupDate,
    required this.returnDate,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  String vehicleType = '';
  String vehicleModel = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Information", style: poppinsMedium),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vehicle Type", style: poppinsMedium),
            TextField(
              onChanged: (value) {
                vehicleType = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Vehicle Type',
              ),
            ),
            SizedBox(height: 20),
            Text("Vehicle Model", style: poppinsMedium),
            TextField(
              onChanged: (value) {
                vehicleModel = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Vehicle Model',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Vehicle(
                        selectedVehicle: _vehicles.firstWhere((vehicle) =>
                        vehicle.id == _selectedVehicleType)),
                  ),
                );
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
