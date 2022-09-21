import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final String route;

  const MenuItemModel({
    required this.icon,
    required this.title,
    required this.route,
  });

  @override
  String toString() => 'MenuItemModel(title: $title, route: $route)';
}
