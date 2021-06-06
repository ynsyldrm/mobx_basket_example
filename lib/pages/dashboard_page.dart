import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_basket_example/pages/food_page.dart';
import 'package:mobx_basket_example/pages/basket_page.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int? selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  final List<Widget> _bottomNavigationBarOptions = <Widget>[
    FoodPage(),
    BasketPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return buildDashboard(context, selectedIndex ?? 0);
  }

  Widget buildDashboard(BuildContext context, int selectedIndex) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: _bottomNavigationBarOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, selectedIndex),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Center(
        child: Icon(
          Icons.fastfood_outlined,
          color: Colors.red,
          size: 30,
        ),
      ),
      brightness: Brightness.dark,
      backgroundColor: Colors.white,
      title: Text(
        'Foods For You...',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
      ), 
    );
  }

  Widget buildBottomNavigationBar(BuildContext context, int selectedIndex) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: '',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red,
      onTap: (int index) {
        setState(() {
          this.selectedIndex = index;
        });
      },
    );
  }
}
