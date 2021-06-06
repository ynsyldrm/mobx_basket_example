import 'package:flutter/material.dart';
import 'package:mobx_basket_example/pages/dashboard_page.dart';
import 'package:mobx_basket_example/stores/basket_page_view_store.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(providers: [
      Provider<BasketPageViewStore>(
        create: (_) => BasketPageViewStore(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: DashboardView(),
    );
  }
}
