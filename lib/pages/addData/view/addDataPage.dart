import 'package:SwiftInvoice/pages/addData/modal/addDataModal.dart';
import 'package:SwiftInvoice/pages/addData/provider/addDataProvider.dart';
import 'package:SwiftInvoice/utility/addDataUtility.dart';
import 'package:SwiftInvoice/utility/dataUtility.dart';
import 'package:SwiftInvoice/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  AddDataProvider? providerTrue;
  AddDataProvider? providerFalse;
  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<AddDataProvider>(context, listen: true);
    providerFalse = Provider.of<AddDataProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: DesignColor.primary,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                textformfield(
                  'Iteam Name',
                  'Enter Iteam Name',
                  Icon(
                    Icons.production_quantity_limits,
                  ),
                  'Iteam  Name',
                  providerTrue!.iteamName,
                ),
                hsize(),
                quntity(providerTrue!.iteamQuantity),
                hsize(),
                price(providerTrue!.iteamPrice),
                hsize(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: DesignColor.white,
                        backgroundColor: DesignColor.primary,
                        elevation: 2,
                      ),
                      onPressed: () {
                        if (providerTrue!.iteamName.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Iteam Name");
                        } else if (providerTrue!.iteamName.text.length > 15) {
                          Fluttertoast.showToast(
                              msg: "No More Than 15 Caracter In Iteam Name");
                        } else if (providerTrue!.iteamQuantity.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Iteam Quantity");
                        } else if (providerTrue!.iteamQuantity.text.length >
                            10) {
                          Fluttertoast.showToast(
                              msg: "No More Than 10 Caracter In Iteam Quantity");
                        } else if (providerTrue!.iteamPrice.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Iteam Price");
                        } else if (providerTrue!.iteamPrice.text.length > 10) {
                          Fluttertoast.showToast(
                              msg: "No More Than 10 Caracter In Iteam Price");
                        } else {
                          IteamModel iteam_data = IteamModel(
                            iteamName: providerTrue!.iteamName.text,
                            iteamQuantity: int.parse(
                                "${providerTrue!.iteamQuantity.text}"),
                            iteamPrice:
                                num.parse("${providerTrue!.iteamPrice.text}"),
                            TotalPrice: num.parse(
                                "${int.parse("${providerTrue!.iteamQuantity.text}") * num.parse("${providerFalse!.iteamPrice.text}")}"),
                          );
                          providerTrue!.addDataStore.add(iteam_data);
                          providerFalse!.total_ans();

                          Navigator.pushReplacementNamed(
                            context,
                            '/data',
                          );
                        }
                      },
                      child: Text("Add"),
                    ),
                    wsize(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: DesignColor.white,
                        backgroundColor: DesignColor.primary,
                        elevation: 4,
                      ),
                      onPressed: () {
                        providerFalse!.iteamName.clear();
                        providerFalse!.iteamQuantity.clear();
                        providerFalse!.iteamPrice.clear();
                      },
                      child: Text("Clean"),
                    ),
                    wsize(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: DesignColor.white,
                        backgroundColor: DesignColor.primary,
                        elevation: 4,
                      ),
                      onPressed: () {
                        dialog(context);
                      },
                      child: Text("Home"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
