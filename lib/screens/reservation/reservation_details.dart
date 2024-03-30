import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/screens/customer/customer_information.dart';
import 'package:nyntaxenvoicapp/screens/vehicle/vehicle_information.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  late DateTime pickupDate;
  late DateTime returnDate;
  String reservationID = '';

  @override
  void initState() {
    super.initState();
    pickupDate = DateTime.now();
    returnDate = pickupDate.add(Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation Details", style: poppinsMedium),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reservation ID", style: poppinsMedium),
            TextField(
              onChanged: (value) {
                reservationID = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Reservation ID',
              ),
            ),
            SizedBox(height: 20),
            Text("Pickup Date", style: poppinsMedium),
            TextButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != pickupDate) {
                  setState(() {
                    pickupDate = picked;
                  });
                }
              },
              child: Text(
                pickupDate.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Text("Return Date", style: poppinsMedium),
            TextButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: pickupDate.add(Duration(days: 1)),
                  firstDate: pickupDate.add(Duration(days: 1)),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != returnDate) {
                  setState(() {
                    returnDate = picked;
                  });
                }
              },
              child: Text(
                returnDate.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Customer(
                      reservationID: reservationID,
                      pickupDate: pickupDate,
                      returnDate: returnDate,
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
