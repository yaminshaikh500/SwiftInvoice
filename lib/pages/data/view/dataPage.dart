import 'package:SwiftInvoice/pages/addData/provider/addDataProvider.dart';
import 'package:SwiftInvoice/pages/home/provider/homeProvider.dart';
import 'package:SwiftInvoice/utility/dataUtility.dart';
import 'package:SwiftInvoice/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  HomeProvider? providerHTrue;
  HomeProvider? providerHFalse;
  AddDataProvider? providerATrue;
  AddDataProvider? providerAFalse;
  @override
  Widget build(BuildContext context) {
    providerHTrue = Provider.of<HomeProvider>(context, listen: true);
    providerHFalse = Provider.of<HomeProvider>(context, listen: false);
    providerATrue = Provider.of<AddDataProvider>(context, listen: true);
    providerAFalse = Provider.of<AddDataProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: (Text("List")),
          centerTitle: true,
          elevation: 0,
          backgroundColor: DesignColor.primary,
          actions: [
            pop_up_menu(context),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
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
                          providerAFalse!.iteamName.clear();
                          providerAFalse!.iteamQuantity.clear();
                          providerAFalse!.iteamPrice.clear();
                          Navigator.pushReplacementNamed(context, '/add_data');
                        },
                        child: Text("Add Data"),
                      ),
                      wsize(),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: DesignColor.white,
                          backgroundColor: DesignColor.primary,
                          elevation: 4,
                        ),
                        onPressed: () {
                          providerAFalse!.cleanData();
                          providerATrue!.total_ans();

                        },
                        child: Text("Clean Data"),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total:- ",
                          style: TextStyle(
                              color: DesignColor.primary, fontSize: 18),
                        ),
                        Text(
                          "${providerATrue!.total_answer}",
                          style: TextStyle(
                              color: DesignColor.primary, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: providerATrue!.addDataStore.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 15, left: 15),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          "${providerATrue!.addDataStore[index].iteamName}",
                                          style: TextStyle(
                                              color: DesignColor.blue,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Qty :- ",
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: DesignColor.black,
                                                fontSize: 12),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                11,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${providerATrue!.addDataStore[index].iteamQuantity}",
                                              style: TextStyle(
                                                  color: DesignColor.black,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  OutlinedButton(
                                    onPressed: () {
                                      providerATrue!.increment(index);
                                      providerATrue!
                                          .increment_total_amout(index);
                                      providerATrue!.total_ans();

                                    },
                                    child: Icon(
                                      Icons.plus_one,
                                      color: DesignColor.black,
                                    ),
                                  ),

                                  OutlinedButton(
                                    onPressed: () {
                                      if (providerATrue!.addDataStore[index]
                                              .iteamQuantity !=
                                          1) {
                                        providerATrue!.decrement(index);
                                        providerATrue!
                                            .decrement_total_amout(index);
                                        providerATrue!.total_ans();
                                      } else if (providerATrue!
                                              .addDataStore[index]
                                              .iteamQuantity ==
                                          1) {
                                        providerATrue!.deleteList(index);
                                      }
                                     },
                                    child: Icon(
                                      Icons.exposure_minus_1,
                                      color: DesignColor.black,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      " 💸 ${providerATrue!.addDataStore[index].TotalPrice}",
                                      style: TextStyle(
                                        color: DesignColor.primary,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      providerATrue!.deleteButton(index);
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                40,
                                        child: Icon(Icons.delete)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
