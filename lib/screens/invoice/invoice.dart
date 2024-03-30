import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Invoice extends StatefulWidget {
  final String reservationID;
  final String pickupDate;
  final String returnDate;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String vehicleType;
  final String vehicleModel;
  final String weeklyCharge;
  final String dailyCharge;
  final String damageWaiverCharge;
  final String netTotal;

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
    required this.weeklyCharge,
    required this.dailyCharge,
    required this.damageWaiverCharge,
    required this.netTotal,
  }) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: poppinsMedium,),
      ),

      body: SingleChildScrollView(
        child: Container(padding: EdgeInsets.only(left: Dimensions.paddingSizeDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reservation Details", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
              Container(height: 2, width: 350, color: AppColors.primaryColor),
              SizedBox(height: 30,),
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.boxColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reservation ID", style: poppinsMedium,),
                          Text(widget.reservationID, style: poppinsMedium,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pickup Date", style: poppinsMedium,),
                          Text(widget.pickupDate, style: poppinsMedium,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Dropoff Date", style: poppinsMedium,),
                          Text(widget.returnDate, style: poppinsMedium,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Text("Customer Information", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
              Container(height: 2, width: 350, color: AppColors.primaryColor),
              SizedBox(height: 30,),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.boxColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("First Name", style: poppinsMedium,),
                          Text(widget.firstName, style: poppinsMedium,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Second Name", style: poppinsMedium,),
                          Text(widget.lastName, style: poppinsMedium,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email", style: poppinsMedium,),
                          Text(widget.email, style: poppinsMedium,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phone", style: poppinsMedium,),
                          Text(widget.phone, style: poppinsMedium,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Text("Vehicle Information", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
              Container(height: 2, width: 350, color: AppColors.primaryColor),
              SizedBox(height: 30,),
              Container(
                height: 130,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.boxColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Vehicle Type", style: poppinsMedium,),
                          Text(widget.vehicleType, style: poppinsMedium,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Vehicle Model", style: poppinsMedium,),
                          Text(widget.vehicleModel, style: poppinsMedium,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Text("Charges Summary", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
              Container(height: 2, width: 350, color: AppColors.primaryColor),
              SizedBox(height: 30,),

              Container( height: 220, width: 350,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.boxColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Charge", style: poppinsMedium,),
                          Text("Total", style: poppinsMedium,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(height: 2, width: 350, color: AppColors.primaryColor),

                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Weekly (1 week)", style: poppinsMedium,),
                          Text(widget.weeklyCharge, style: poppinsMedium,),
                        ],
                      ),

                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Daily (2 Days)", style: poppinsMedium,),
                          Text(widget.dailyCharge, style: poppinsMedium,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Collision Damage Waiver", style: poppinsMedium,),
                          Text(widget.damageWaiverCharge, style: poppinsMedium,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Net Total", style: poppinsBold,),
                          Text(widget.netTotal, style: poppinsBold,),
                        ],
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
