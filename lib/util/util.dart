import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_hospital/page/login.dart';
import 'package:smart_hospital/util/session.dart';

dialog(_context, msg, {title}) {
  showDialog(
    context: _context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? 'Perhatian!'),
        content: Text(msg),
      );
    },
  );
}

// Template button lebar utk posisi bottomNavigationBar
Widget largetButton(
    {String label = "Simpan", IconData iconData, Function onPressed}) {
  iconData = iconData ?? Icons.done_all;
  var colorScheme;
  return Container(
      height: 60,
      width: double.infinity,
      child: new ElevatedButton(
        child: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ));
}

// fungsi format tulisan rupiah
String toRupiah(int val) {
  return NumberFormat.currency(locale: 'IDR').format(val);
}

void logOut(BuildContext context) {
  clearSession().then((value) => Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return LoginPage();
      }, transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return new SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }),
      (route) => false));
}
