import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Invoice extends StatelessWidget {
  final String reservationID;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String vehicleType;
  final String vehicleModel;
  final double netTotal;

  const Invoice({
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
    required this.netTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice", style: poppinsMedium),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reservation Details", style: poppinsMedium),
            SizedBox(height: 20),
            Text("Reservation ID: $reservationID", style: poppinsMedium),
            Text("Pickup Date: ${pickupDate.toString()}", style: poppinsMedium),
            Text("Return Date: ${returnDate.toString()}", style: poppinsMedium),
            SizedBox(height: 20),
            Text("Customer Information", style: poppinsMedium),
            SizedBox(height: 20),
            Text("First Name: $firstName", style: poppinsMedium),
            Text("Last Name: $lastName", style: poppinsMedium),
            Text("Email: $email", style: poppinsMedium),
            Text("Phone: $phone", style: poppinsMedium),
            SizedBox(height: 20),
            Text("Vehicle Information", style: poppinsMedium),
            SizedBox(height: 20),
            Text("Vehicle Type: $vehicleType", style: poppinsMedium),
            Text("Vehicle Model: $vehicleModel", style: poppinsMedium),
            SizedBox(height: 20),
            Text("Charges Summary", style: poppinsMedium),
            SizedBox(height: 20),
            Text("Net Total: \$${netTotal.toStringAsFixed(2)}",
                style: poppinsMedium),
          ],
        ),
      ),
    );
  }
}
