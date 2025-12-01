import 'package:flutter/material.dart';

List<DropdownMenuEntry<String>> toMenu(List<String> list) {
  return list
      .map(
        (e) => DropdownMenuEntry(
          value: e,
          label: e,
        ),
      )
      .toList();
}