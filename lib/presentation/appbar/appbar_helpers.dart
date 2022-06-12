import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _padButton(IconButton button) =>
    Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: button);

Widget button({required VoidCallback onPressed, required IconData icon}) =>
    _padButton(IconButton(onPressed: onPressed, icon: Icon(icon)));
