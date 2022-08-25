import 'package:flutter/material.dart';

import '../model/menuitem.dart';

class MenuItems {
  static const List<MenuItemm> itemFirst = [ itemlogout ,itemprofile];
  static const itemlogout = MenuItemm(
    text: "Sign out",
    icon: Icons.logout,
  );
  static const itemprofile = MenuItemm(
    text: "Profile",
    icon: Icons.person,
  );
}
//Future logout() async {
//}
