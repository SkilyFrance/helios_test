import 'package:flutter/material.dart';
import 'package:helios_test/config/config_colors.dart';
import 'package:helios_test/config/config_text.dart';
import 'package:helios_test/config/config_text_style.dart';
import 'package:helios_test/model/ramdom_user_model.dart';
import 'package:helios_test/service/navigation_service.dart';
import 'package:helios_test/service/xspeedlt_algo.dart';
import 'package:helios_test/widgets/cached_circle_avatar.dart';
import 'package:helios_test/widgets/classic_list_tile.dart';
import 'package:helios_test/widgets/conditionnal_widget.dart';
import 'package:helios_test/widgets/my_divider.dart';
import 'package:helios_test/widgets/unfocus.dart';

import 'ramdom_user_controller.dart';

class RandomUserView extends StatelessWidget {
  final RandomUserController controller;
  final List<RamdomUser> randomUsers;
  final BuildContext context;
  const RandomUserView(this.context,
      {Key? key, required this.controller, required this.randomUsers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocus(
        child: Scaffold(
      floatingActionButton: floatingActionButton(),
      backgroundColor: ConfigColors.dark,
      appBar: appBar(),
      body: body(),
    ));
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        XspeedltAlgo().sortAlgorithm();
      },
      backgroundColor: Colors.white,
      child: const Icon(Icons.check),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ConfigColors.dark,
      title: searchBarInput(),
    );
  }

  StreamBuilder<List<RamdomUser>> body() {
    return StreamBuilder<List<RamdomUser>>(
      initialData: const <RamdomUser>[],
      stream: controller.searchedUserStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<RamdomUser>> inSearchSnap) {
        return WidgetBuilderConditionnal(
            child: conditionnalSearchedList(inSearchSnap.data!),
            replaceBy: userListView(),
            isDisplay: inSearchSnap.data!.isNotEmpty);
      },
    );
  }

  Scrollbar userListView() {
    return Scrollbar(
        controller: controller.scrollController,
        isAlwaysShown: false,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: randomUsers.length,
            controller: controller.scrollController,
            itemBuilder: (BuildContext context, int userIndex) {
              return myDivider(
                  child: ClassicListTile(
                onTap: () {
                  NavigationService()
                      .fromListToDetails(context, randomUsers[userIndex]);
                },
                leading: CachedCircleAvatar(
                    imageUrl: randomUsers[userIndex].picture.thumbnail),
                title: '',
                isWidgetTitle: true,
                widgetTitle: titleTile(randomUsers[userIndex]),
              ));
            }));
  }

  WidgetBuilderConditionnal conditionnalSearchedList(
      List<RamdomUser> ramdomUsers) {
    return WidgetBuilderConditionnal(
      child: emptyView(),
      replaceBy: searchedListView(ramdomUsers),
      isDisplay: ramdomUsers.isEmpty,
    );
  }

  Align emptyView() {
    return const Align(
        alignment: Alignment.center,
        child: Text(
          ConfigText.noResult,
          style: TextStyle(color: Colors.grey),
        ));
  }

  Scrollbar searchedListView(List<RamdomUser> ramdomUserSnap) {
    return Scrollbar(
        controller: controller.scrollController,
        isAlwaysShown: false,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: ramdomUserSnap.length,
            controller: controller.scrollController,
            itemBuilder: (BuildContext context, int userIndex) {
              return myDivider(
                  child: ClassicListTile(
                onTap: () {
                  NavigationService()
                      .fromListToDetails(context, ramdomUserSnap[userIndex]);
                },
                leading: CachedCircleAvatar(
                    imageUrl: ramdomUserSnap[userIndex].picture.thumbnail),
                title: '',
                isWidgetTitle: true,
                widgetTitle: titleTile(ramdomUserSnap[userIndex]),
              ));
            }));
  }

  RichText titleTile(RamdomUser ramdomUser) {
    return RichText(
      text: TextSpan(
          text: ramdomUser.name.title.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: ' ${ramdomUser.name.last.toUpperCase()}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' ${ramdomUser.name.first}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.normal),
            ),
          ]),
    );
  }

  Padding searchBarInput() {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 0.0, bottom: 0.0),
            child: TextField(
              onChanged: (String value) {
                controller.searchProfile(value);
              },
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
              controller: controller.searchbarEditingController,
              textInputAction: TextInputAction.send,
              minLines: null,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: ConfigText.hintTextSeachBar,
                hintStyle: ConfigTextStyle().hintTextSearchBar,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                focusColor: Colors.transparent,
              ),
            ),
          ),
        ));
  }
}
