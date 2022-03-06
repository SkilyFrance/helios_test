import 'package:flutter/material.dart';
import 'package:helios_test/model/ramdom_user_model.dart';

import 'ramdom_details_view.dart';

class RamdomDetailsPage extends StatefulWidget {
  final RamdomUser ramdomUser;
  const RamdomDetailsPage({Key? key, required this.ramdomUser})
      : super(key: key);

  @override
  RamdomDetailsController createState() => RamdomDetailsController();
}

class RamdomDetailsController extends State<RamdomDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return RamdomDetailsView(context, controller: this);
  }
}
