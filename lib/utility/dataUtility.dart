import 'package:SwiftInvoice/pages/addData/provider/addDataProvider.dart';
import 'package:SwiftInvoice/pages/data/provider/pdfProvider.dart';
import 'package:SwiftInvoice/pages/home/provider/homeProvider.dart';
import 'package:SwiftInvoice/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

void dialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: DesignColor.primary,
        title: Text(
          'You Are Jump On Home Screen',
          style: TextStyle(color: DesignColor.white),
        ),
        content: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 14.8,
          width: MediaQuery.of(context).size.width / 14.8,
          decoration: BoxDecoration(
            color: DesignColor.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: DesignColor.blue,
                  side: BorderSide(color: DesignColor.primary, width: 1),
                ),
                onPressed: () {
                  Provider.of<HomeProvider>(context, listen: false)
                      .business_name
                      .clear();
                  Provider.of<HomeProvider>(context, listen: false)
                      .business_number
                      .clear();
                  Provider.of<HomeProvider>(context, listen: false)
                      .business_email
                      .clear();
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text("Yes"),
              ),
              wsize(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: DesignColor.blue,
                  side: BorderSide(color: DesignColor.blue, width: 1),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget pop_up_menu(context) {
  return PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Row(
          children: [
            Icon(
              Icons.file_download,
            ),
            wsize(),
            Text(
              "Invoice Download",
              style: TextStyle(color: DesignColor.white),
            )
          ],
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: Row(
          children: [
            Icon(
              Icons.share,
            ),
            wsize(),
            Text(
              "Share File",
              style: TextStyle(color: DesignColor.white),
            )
          ],
        ),
      ),
      ],
    offset: Offset(-25, 35),
    color: DesignColor.blue,
    elevation: 5,
    onSelected: (value) async {
      if (value == 1) {
        pdfCreate(
            Provider.of<AddDataProvider>(context, listen: false).total_answer,
            Provider.of<AddDataProvider>(context, listen: false).addDataStore,
            Provider.of<HomeProvider>(context, listen: false).homeStoreData);

        final snackBar = SnackBar(
          content: const Text(
              '/storage/emulated/0/Android/data/com.example.demo17/files/invoice.pdf'),
          action: SnackBarAction(
            label: 'ok',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (value == 2) {

        await Share.share(file!.path);

      }

    },
  );
}
