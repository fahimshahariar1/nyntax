import 'package:flutter/material.dart';
import 'package:nyntaxenvoicapp/screens/customer/customer_information.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/images.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  late DateTime pickupDate;
  late DateTime returnDate;

  String getDuration() {
    Duration duration = returnDate.difference(pickupDate);
    int days = duration.inDays;
    int weeks = days ~/ 7;
    int remainingDays = days % 7;
    if (weeks == 0) {
      return '$days days';
    } else if (remainingDays == 0) {
      return '$weeks weeks';
    } else {
      return '$weeks weeks $remainingDays days';
    }
  }

  Future<void> _selectPickupDate(BuildContext context) async {
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
  }

  Future<void> _selectReturnDate(BuildContext context) async {
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
  }

  @override
  void initState() {
    super.initState();
    pickupDate = DateTime.now();
    returnDate = pickupDate.add(Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: Dimensions.paddingSizeLarge, left: Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reservation Details", style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
            Container(height: 2, width: 350, color: AppColors.primaryColor),
            SizedBox(height: 20,),
            Container(
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.boxColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault, top: Dimensions.paddingSizeDefault),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Reservation ID", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                          Image.asset(Images.required, height: 25,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                        child: SizedBox(
                          height: 40,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Pickup Date", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                          Image.asset(Images.required, height: 25,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                        child: SizedBox(
                          height: 40,
                          width: 300,
                          child: TextFormField(
                            onTap: () => _selectPickupDate(context),
                            readOnly: true,
                            controller: TextEditingController(text: pickupDate.toString()),
                            decoration: InputDecoration(
                              hintText: "Select Date & Time",
                              hintStyle: poppinsMedium,
                              suffixIcon: Icon(Icons.calendar_today, size: 18,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Return Date", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                          Image.asset(Images.required, height: 25,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                        child: SizedBox(
                          height: 40,
                          width: 300,
                          child: TextFormField(
                            onTap: () => _selectReturnDate(context),
                            readOnly: true,
                            controller: TextEditingController(text: returnDate.toString()),
                            decoration: InputDecoration(
                              hintText: "Select Date & Time",
                              hintStyle: poppinsMedium,
                              suffixIcon: Icon(Icons.calendar_today, size: 18,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Duration", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                        child: SizedBox(
                          height: 40,
                          width: 200,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.boxColor),
                            ),
                            child: Text(getDuration()),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Discount", style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeDefault)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                        child: SizedBox(
                          height: 40,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.boxColor)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeLarge),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Customer()));
                  },
                  child: Container(
                      height: 48,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(child: Text("Next", style: poppinsMedium.copyWith(color: Colors.white),))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
