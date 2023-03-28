import 'dart:async';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';

import '../core/router/router.dart';

showSnackBar(String message,
    {bool upperSnackBar = false,
      bool popPage = false,
      duration = 5,
      Color color = Colors.blueAccent}) {
  ScaffoldMessenger.of(MagicRouter.currentContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
    SnackBar(
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: upperSnackBar ? EdgeInsets.only(bottom:20 ) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if (popPage) Timer(const Duration(seconds: 5), () => MagicRouter.pop());
}