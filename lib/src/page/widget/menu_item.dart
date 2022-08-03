import 'package:flutter/material.dart';
import '../../model/menu_item.dart';
import 'package:simple_shadow/simple_shadow.dart';

// ignore: non_constant_identifier_names
Column MenuItemWidget(BuildContext context, AppMenuItem item) {
  return Column(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.restorablePushNamed(context, item.route);
          },
          child: menuIcon(context, item),
        ),
      ),
      Text(item.name)
    ],
  );
}

Container menuIcon(BuildContext context, AppMenuItem item) {
  return Container(
    margin: const EdgeInsets.all(10),
    // padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      boxShadow: const [
        BoxShadow(
          blurRadius: 5,
          color: Color.fromRGBO(
            0,
            0,
            0,
            0.2,
          ),
          spreadRadius: 0.1,
        )
      ],
    ),
    child: Center(
      child: SimpleShadow(
        offset: const Offset(-1, 0),
        child: Image(
          height: item.size,
          fit: BoxFit.contain,
          image: AssetImage(item.icon),
        ),
      ),
    ),
  );
}
