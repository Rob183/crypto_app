import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'price_screen.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

DropdownButton<String> androidDropdown(
    String selectedCurrency, Function setSt) {
  List<DropdownMenuItem<String>> dropdownItems = [];
  for (String currency in currenciesList) {
    var newItem = DropdownMenuItem(
      child: Text(currency),
      value: currency,
    );
    dropdownItems.add(newItem);
  }

  return DropdownButton<String>(
    value: selectedCurrency,
    items: dropdownItems,
    onChanged: setSt,
  );
}

CupertinoPicker iOSPicker() {
  List<Text> pickerItems = [];
  for (String currency in currenciesList) {
    pickerItems.add(Text(currency));
  }

  return CupertinoPicker(
    backgroundColor: Colors.lightBlue,
    itemExtent: 32.0,
    onSelectedItemChanged: (selectedIndex) {
      print(selectedIndex);
    },
    children: pickerItems,
  );
}
