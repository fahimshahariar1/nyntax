import 'package:flutter/material.dart';

import 'package:nyntaxenvoicapp/screens/invoice/invoice.dart';

import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class AdditionalCharges extends StatefulWidget {
  final String reservationID;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String vehicleType;
  final String vehicleModel;

  const AdditionalCharges({
    Key? key,
    required this.reservationID,
    required this.pickupDate,
    required this.returnDate,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.vehicleType,
    required this.vehicleModel,
  }) : super(key: key);

  @override
  State<AdditionalCharges> createState() => _AdditionalChargesState();
}

class _AdditionalChargesState extends State<AdditionalCharges> {
  double weeklyCharge = 250.00;
  double dailyCharge = 140.00;
  double collisionDamageWaiver = 9.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Additional Charges", style: poppinsMedium),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Additional Charges", style: poppinsMedium),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Weekly (1 week)", style: poppinsMedium),
                Text("\$${weeklyCharge.toStringAsFixed(2)}",
                    style: poppinsMedium),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Daily (2 Days)", style: poppinsMedium),
                Text("\$${dailyCharge.toStringAsFixed(2)}",
                    style: poppinsMedium),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Collision Damage Waiver", style: poppinsMedium),
                Text("\$${collisionDamageWaiver.toStringAsFixed(2)}",
                    style: poppinsMedium),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double netTotal =
                    weeklyCharge + dailyCharge + collisionDamageWaiver;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Invoice(
                      reservationID: widget.reservationID,
                      pickupDate: widget.pickupDate,
                      returnDate: widget.returnDate,
                      firstName: widget.firstName,
                      lastName: widget.lastName,
                      email: widget.email,
                      phone: widget.phone,
                      vehicleType: widget.vehicleType,
                      vehicleModel: widget.vehicleModel,
                      netTotal: netTotal,
                    ),
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
