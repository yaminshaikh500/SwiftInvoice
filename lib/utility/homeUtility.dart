// ignore_for_file: file_names, non_constant_identifier_names

import 'package:SwiftInvoice/utility/utility.dart';
import 'package:flutter/material.dart';

Widget custom_textformsield(
    String name, String htext, var ic, var valid, TextEditingController con) {
  return TextFormField(
    controller: con,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter $valid";
      } else {
        return null;
      }
    },
    cursorColor: DesignColor.primary,
    style: TextStyle(
      color: DesignColor.black,
    ),
    decoration: InputDecoration(
      labelText: name,
      labelStyle: TextStyle(
        color: DesignColor.primary,
      ),
      hintText: htext,
      hintStyle: TextStyle(
        color: DesignColor.primary,
      ),
      prefixIcon: ic,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DesignColor.blue,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          color: DesignColor.primary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          width: 1,
          color: DesignColor.primary,
        ),
      ),
    ),
  );
}

Widget email_valid(TextEditingController businessEmail) {
  return TextFormField(
    controller: businessEmail,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Business Email";
      }
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return "Please enter a valid email address";
      } else {
        return null;
      }
    },
    cursorColor: DesignColor.primary,
    style: TextStyle(color: DesignColor.black),
    decoration: InputDecoration(
      labelText: 'Email',
      labelStyle: TextStyle(color: DesignColor.primary),
      hintText: 'Enter Business Email',
      hintStyle: TextStyle(color: DesignColor.primary),
      prefixIcon: Icon(
        Icons.email,
        color: DesignColor.primary,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DesignColor.blue),
        borderRadius: BorderRadius.circular(15.0),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(color: DesignColor.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          width: 1,
          color: DesignColor.primary,
        ),
      ),
    ),
  );
}

Widget phone_number(TextEditingController businessNumber) {
  return TextFormField(
    keyboardType: TextInputType.number,
    controller: businessNumber,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Business Number";
      } else {
        return null;
      }
    },
    cursorColor: DesignColor.primary,
    style: TextStyle(
      color: DesignColor.black,
    ),
    decoration: InputDecoration(
      labelText: 'Business Number',
      labelStyle: TextStyle(
        color: DesignColor.primary,
      ),
      hintText: 'Business Number',
      hintStyle: TextStyle(
        color: DesignColor.primary,
      ),
      prefixIcon: Icon(
        Icons.phone,
        color: DesignColor.primary,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DesignColor.blue,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          color: DesignColor.primary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          width: 1,
          color: DesignColor.primary,
        ),
      ),
    ),
  );
}
