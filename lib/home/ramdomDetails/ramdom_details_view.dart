import 'package:flutter/material.dart';
import 'package:helios_test/config/config_colors.dart';
import 'package:helios_test/config/config_text.dart';
import 'package:helios_test/widgets/cached_circle_avatar.dart';

import 'ramdom_details_controller.dart';

class RamdomDetailsView extends StatelessWidget {
  final RamdomDetailsController controller;
  final BuildContext context;
  const RamdomDetailsView(this.context, {Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Construct and pass in a widget builder per screen type
    return Scaffold(
      backgroundColor: ConfigColors.dark,
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
        backgroundColor: ConfigColors.dark,
        elevation: 0.0,
        title: appbarTitle());
  }

  RichText appbarTitle() {
    return RichText(
      text: TextSpan(
          text: controller.widget.ramdomUser.name.last.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: ' ${controller.widget.ramdomUser.name.first}',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ]),
    );
  }

  Column body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        circleAvatar(),
        addressWidget(),
        emailWidget(),
      ],
    );
  }

  Padding circleAvatar() {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.30,
              width: MediaQuery.of(context).size.width * 0.30,
              child: CachedCircleAvatar(
                  imageUrl: controller.widget.ramdomUser.picture.large),
            )));
  }

  Padding addressWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            ConfigText.address.toUpperCase(),
            style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: RichText(
              text: TextSpan(
                  text: '${controller.widget.ramdomUser.location.city}, ',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                      text: controller.widget.ramdomUser.location.country
                          .toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Padding emailWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            ConfigText.email.toUpperCase(),
            style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              controller.widget.ramdomUser.email,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
