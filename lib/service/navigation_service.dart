import 'package:flutter/material.dart';
import 'package:helios_test/home/ramdomDetails/ramdom_details_controller.dart';
import 'package:helios_test/model/ramdom_user_model.dart';

class NavigationService {
  //
  /// Method allows us to navigate from item in listView to page details
  void fromListToDetails(BuildContext context, RamdomUser ramdomUser) {
    Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
            builder: (BuildContext context) =>
                RamdomDetailsPage(ramdomUser: ramdomUser)));
  }
}
