import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:helios_test/model/ramdom_user_model.dart';
import 'package:helios_test/service/ramdom_user_api.dart';
// import 'package:helios_test/service/xspeedlt_algo.dart';

import 'ramdom_user_view.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({Key? key}) : super(key: key);

  @override
  RandomUserController createState() => RandomUserController();
}

class RandomUserController extends State<RandomUserPage> {
  //
  ///Controller for search bar
  TextEditingController searchbarEditingController = TextEditingController();
  //
  /// State management for remote data
  StreamController<List<RamdomUser>> randomUserStreamcontroller =
      StreamController<List<RamdomUser>>.broadcast();
  //
  /// in data for [randomUserStreamcontroller]
  Stream<List<RamdomUser>> get ramdomUserStream =>
      randomUserStreamcontroller.stream;
  //
  /// Out data for [randomUserStreamcontroller]
  Sink<List<RamdomUser>> get randomUserSink => randomUserStreamcontroller.sink;
  //
  //
  List<RamdomUser> listOfUsers = <RamdomUser>[];

  /// Allows us to query API data
  Future<void> getApiData() async {
    List<RamdomUser> otherUsers = <RamdomUser>[];
    try {
      //
      // Query
      otherUsers = await RamdomUserApi().getListOfRamdomUsers();
      //
      // add new users in list
      listOfUsers.addAll(otherUsers);
      //
      //
      randomUserSink.add(listOfUsers);
    } on dio.DioError catch (error) {
      Future<dynamic>.error(error);
    }
  }

  //
  // Scroll controller settings
  ScrollController scrollController = ScrollController();
  //
  // Method allows us to listen scroll extent
  void listenScrollControntroller() {
    scrollController.addListener(() async {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        await getApiData();
      }
    });
  }

  //
  /// State management for searched data
  StreamController<List<RamdomUser>> searchedUserStreamcontroller =
      StreamController<List<RamdomUser>>.broadcast();
  //
  /// in data for [searchedUserStreamcontroller]
  Stream<List<RamdomUser>> get searchedUserStream =>
      searchedUserStreamcontroller.stream;
  //
  /// Out data for [searchedUserStreamcontroller]
  Sink<List<RamdomUser>> get searchedUserSink =>
      searchedUserStreamcontroller.sink;
  //
  /// Method allows us to show results from search bar
  final List<RamdomUser> searchedList = <RamdomUser>[];
  //
  void searchProfile(String query) {
    searchedList.addAll(listOfUsers);
    if (query.isNotEmpty) {
      final List<RamdomUser> searchedUserData = <RamdomUser>[];
      for (final RamdomUser user in searchedList) {
        if (user.name.first.contains(query) || user.name.last.contains(query)) {
          searchedUserData.add(user);
        }
      }
      searchedList.clear();
      searchedUserSink.add(searchedUserData);
    } else {
      searchedList.clear();
      searchedUserSink.add(searchedList);
    }
  }

  @override
  void initState() {
    getApiData();
    listenScrollControntroller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RamdomUser>>(
        initialData: const <RamdomUser>[],
        stream: ramdomUserStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<RamdomUser>> randomUserSnap) {
          return RandomUserView(context,
              controller: this, randomUsers: randomUserSnap.data!);
        });
  }
}
