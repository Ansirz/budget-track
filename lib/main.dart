import 'package:expense_tracker/hive_boxes/expenses.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/pages/new_transaction.dart';
import 'package:expense_tracker/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(expenses);
  await Hive.openBox(userName);
  await Hive.openBox(balance);
  runApp(
    ProviderScope(
      child: MaterialApp(
        routes: {
          "/homePage": (context)=> HomePage(),
          "/newTransaction": (context) => NewTransaction(),
          "/welcomePage": (context) => WelcomePage()
        },
        home: WelcomePage(),
      ),
    )
  );
}