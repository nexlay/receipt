import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/theme/dark_theme.dart';
import 'package:techka/theme/light_theme.dart';
import 'package:techka/utils/authentication/authentication.dart';
import 'package:techka/utils/database/db_service.dart';
import 'package:techka/wrappers/wrapper.dart';
import 'models/local_user.dart';
import 'models/receipt.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    MultiProvider(
      providers: [
        StreamProvider.value(
        value: Auth().user,
        initialData: null,
      ),
        StreamProvider<List<Receipt>>.value(
    value: DatabaseService(uid: Auth().firebaseAuth.currentUser?.uid).receipts,
    initialData: const [],
        ),
    StreamProvider<LocalUser>.value(
    value:
    DatabaseService(uid: Auth().firebaseAuth.currentUser?.uid).userData,
    initialData: LocalUser(name: '', surname: '', imageUrl: '', themeValue: 0),),
    ],
      child: const TechkaApp(),
    );
  }
}

class TechkaApp extends StatelessWidget {
  const TechkaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<LocalUser>(context);
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyDarkTheme.darkTheme,
      themeMode: theme.themeValue == 0 ? ThemeMode.light : theme.themeValue == 1 ? ThemeMode.dark : theme.themeValue == 2 ? ThemeMode.system : ThemeMode.light,
      home: const Wrapper(),
    );
  }
}



