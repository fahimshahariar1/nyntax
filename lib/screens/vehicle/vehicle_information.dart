import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nyntaxenvoicapp/data/model/car_model.dart';
import 'package:nyntaxenvoicapp/screens/additional/additional_charges.dart';
import 'package:nyntaxenvoicapp/screens/invoice/invoice.dart';
import 'package:nyntaxenvoicapp/util/colors.dart';
import 'package:nyntaxenvoicapp/util/dimensions.dart';
import 'package:nyntaxenvoicapp/util/images.dart';
import 'package:nyntaxenvoicapp/util/styles.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({Key? key}) : super(key: key);

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  String? _selectedVehicleType;
  List<Data> _vehicles = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchVehicleData();
  }

  Future<void> _fetchVehicleData() async {
    final response =
    await http.get(
        Uri.parse('https://exam-server-7c41747804bf.herokuapp.com/carsList'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final carModel = CarModel.fromJson(jsonData);
      setState(() {
        _vehicles = carModel.data ?? [];
      });
    } else {
      throw Exception('Failed to load vehicle data');
    }
  }

  List<Data> getFilteredVehicles(String searchText) {
    if (searchText.isEmpty) {
      return _vehicles;
    } else {
      return _vehicles
          .where((vehicle) =>
      (vehicle.model?.toLowerCase().contains(searchText.toLowerCase()) ??
          false) ||
          (vehicle.make?.toLowerCase().contains(searchText.toLowerCase()) ??
              false))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: poppinsMedium),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: Dimensions.paddingSizeSmall,
            left: Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vehicle Information", style: poppinsSemiBold.copyWith(
                fontSize: Dimensions.fontSizeLarge)),
            Container(height: 2, width: 350, color: AppColors.primaryColor),
            SizedBox(height: 20),
            Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.boxColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.paddingSizeDefault,
                    top: Dimensions.paddingSizeDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Vehicle Type",
                            style: poppinsLight.copyWith(fontSize: Dimensions
                                .fontSizeDefault)),
                        Image.asset(Images.required, height: 25),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimensions.paddingSizeSmall),
                      child: SizedBox(
                        height: 40,
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          value: _selectedVehicleType,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedVehicleType = newValue;
                            });
                          },
                          items: _vehicles.map<DropdownMenuItem<String>>((
                              Data vehicle) {
                            return DropdownMenuItem<String>(
                              value: vehicle.id,
                              child: Text(vehicle.type ?? ''),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.boxColor)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Vehicle Model",
                            style: poppinsLight.copyWith(fontSize: Dimensions
                                .fontSizeDefault)),
                        Image.asset(Images.required, height: 25),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimensions.paddingSizeSmall),
                      child: SizedBox(
                        height: 40,
                        width: 300,
                        child: TextField(
                          controller: _searchController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: 'Search Model',
                            hintStyle: poppinsMedium,
                            suffixIcon: Icon(Icons.search_sharp, size: 18),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.boxColor)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.boxColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView(
                children: getFilteredVehicles(_searchController.text).map((
                    Data vehicle) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.network(vehicle.imageURL ?? '', height: 100),
                          Column(
                            children: [
                              Text("${vehicle.make ?? ''} ${vehicle.model ??
                                  ''}", style: poppinsBold),
                              Row(children: [
                                Image.asset(Images.seat, height: 15),
                                SizedBox(width: 10),
                                Text("${vehicle.seats ?? ''} Seats",
                                    style: poppinsLight),
                              ]),
                              Row(children: [
                                Image.asset(Images.bag, height: 15),
                                SizedBox(width: 10),
                                Text("${vehicle.bags ?? ''} Bags",
                                    style: poppinsLight),
                              ])
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.boxColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$${vehicle.rates?.hourly ?? ''} / Hour",
                                style: poppinsLight),
                            Text("\$${vehicle.rates?.daily ?? ''} / Day",
                                style: poppinsLight),
                            Text("\$${vehicle.rates?.weekly ?? ''} / Week",
                                style: poppinsLight),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: Dimensions.paddingSizeLarge),
                child: MaterialButton(
                  onPressed: () {
                    // Navigate to the Additional screen and pass selected vehicle data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Additional(
                            selectedVehicle: _vehicles.firstWhere((vehicle) =>
                            vehicle.id == _selectedVehicleType)),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(child: Text(
                        "Next", style: poppinsMedium.copyWith(color: Colors
                        .white))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}