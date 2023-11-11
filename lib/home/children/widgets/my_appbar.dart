import 'package:flutter/material.dart';

AppBar myAppBar(String title, {EdgeInsetsGeometry? padding}) {
  return AppBar(
    toolbarHeight: 64,
    titleSpacing: 0,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.fromLTRB(24, 20, 24, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
            ],
          ),
        ),
      ],
    ),
  );
}
