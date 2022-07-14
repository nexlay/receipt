import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/theme/theme.dart';
import 'package:techka/theme/theme_changer.dart';
import 'package:techka/utils/authentication/authentication.dart';
import 'package:techka/wrappers/wrapper.dart';



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
        ChangeNotifierProvider<ThemeChanger>(create:
        (_) => ThemeChanger(MyTheme.lightTheme),),
    ],
      child: const TechkaApp(),
    );
  }
}

class TechkaApp extends StatelessWidget {
  const TechkaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      themeMode: ThemeMode.system,
      home: const Wrapper(),
    );
  }
}



