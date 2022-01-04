import 'package:beercoin/cards/account.dart';
import 'package:beercoin/cards/buy.dart';
import 'package:beercoin/cards/home.dart';
import 'package:beercoin/cards/sell.dart';
import 'package:beercoin/cards/settings.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Beercoin",
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(context: context).generate(),
      Account(context: context).generate(),
      Buy(context: context).generate(),
      Sell(context: context).generate(),
      Settings(context: context).generate(),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Beercoin app'),
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          AppNavigationButton.home,
          AppNavigationButton.account,
          AppNavigationButton.buy,
          AppNavigationButton.sell,
          AppNavigationButton.settings,
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.headline,
        onTap: _onItemTapped,
      ),
    );
  }
}
