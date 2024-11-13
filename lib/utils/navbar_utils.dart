import 'package:flutter/material.dart';

class NavBarUtils {
  static List<NavItem> names = [
    NavItem('ГЛАВНАЯ', "/", Icons.home),
    NavItem('ВИТРИНА', "/store", Icons.store),
    NavItem('ОБОРУДОВАНИЕ', "/equipment", Icons.warehouse_outlined),
  ];
}

class NavItem {
  final String name;
  final String route;
  final IconData? icon;

  NavItem(this.name, this.route, this.icon);
}
