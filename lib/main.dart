// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database_test/charts.dart';
import 'package:database_test/classes/class.dart';
import 'package:database_test/home.dart';
import 'package:database_test/results_page.dart';
import 'package:database_test/routes/result_routes.dart';
import 'package:database_test/scrollable.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routerDelegate = IdRouterDelegate();
  final _routeInformationParser = IdRouteInformationParser();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
      title: "Assesment Report",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
    );
  }
}

class IdRouterDelegate extends RouterDelegate<IdRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<IdRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;
  IdRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  String? _typedId;
  bool show404 = false;

  void _handleButtonTapped(String typedId) {
    _typedId = typedId;
    notifyListeners();
  }

  // show the correct path in the url, need to return a book
  // book route path based on current state of the app
  IdRoutePath get currentConfiguration {
    if (show404) return IdRoutePath.unknown();

    if (_typedId == null) return IdRoutePath.home();

    return IdRoutePath.details(int.parse(_typedId!));
  }

  // @override
  // GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(
            onTapped: _handleButtonTapped,
          ),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_typedId != null)
          MaterialPage(child: ResultsPage(resultId: _typedId.toString())),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _typedId = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  // when update of route, updates the app state
  @override
  Future<void> setNewRoutePath(IdRoutePath path) async {
    if (path.isUnknown) {
      _typedId = null;
      show404 = true;
      // have an empty return to end the function
      return;
    }

    if (path.isDetailsPage) {
      if (path.id! < 0) {
        show404 = true;
        return;
      }
      _typedId = path.id.toString();
    } else {
      _typedId = null;
    }

    show404 = false;
  }
}

class IdDetailsPage extends Page {
  final String resultId;

  IdDetailsPage({
    required this.resultId,
  }) : super(key: ValueKey(resultId));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ResultsPage(resultId: resultId);
      },
    );
  }
}

class IdRouteInformationParser extends RouteInformationParser<IdRoutePath> {
  // Converts the given route information into parsed data to pass to a
  // RouterDelegate
  @override
  Future<IdRoutePath> parseRouteInformation(RouteInformation routeInfo) async {
    final uri = Uri.parse(routeInfo.location.toString());

    // Handle '/'
    if (uri.pathSegments.isEmpty) return IdRoutePath.home();

    // Handle 'result/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments.first != 'result') return IdRoutePath.unknown();
      final remaining = uri.pathSegments.elementAt(1);
      final id = int.tryParse(remaining);

      if (id == null) return IdRoutePath.unknown();
      print("id $id");
      return IdRoutePath.details(id);
    }

    // Handle unknown routes
    return IdRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(IdRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      print("id ${path.id}");
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/result/${path.id}');
    }

    return null;
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}
