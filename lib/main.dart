import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/models/firebase_user.dart';
import 'package:techka/models/user_theme_provider.dart';
import 'package:techka/theme/dark_theme.dart';
import 'package:techka/theme/light_theme.dart';
import 'package:techka/utils/authentication/authentication.dart';
import 'package:techka/utils/database/db_service.dart';
import 'package:techka/wrappers/wrapper.dart';
import 'features/authentication/domain/entities/local_user.dart';
import 'models/receipt.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserThemeProvider userThemeProvider = UserThemeProvider();
  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    userThemeProvider.userTheme =
        (await userThemeProvider.themePreferences.getTheme())!;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FromFirebaseUser>.value(
          value: Auth().user,
          initialData: FromFirebaseUser.initialData(),
        ),
        StreamProvider<List<Receipt>>(
          create: (_) =>
              DatabaseService(uid: Auth().retrieveCurrentUserId()).receipts,
          initialData: const [],
        ),
        StreamProvider<LocalUser>(
          create: (_) =>
              DatabaseService(uid: Auth().retrieveCurrentUserId()).userData,
          initialData: LocalUser.initialData(),
        ),
        ChangeNotifierProvider(
          create: (_) => userThemeProvider,
        ),
      ],
      child: const ReceiptApp(),
    );
  }
}

class ReceiptApp extends StatelessWidget {
  const ReceiptApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userTheme = Provider.of<UserThemeProvider>(context);
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyDarkTheme.darkTheme,
      themeMode: userTheme.userTheme == 0
          ? ThemeMode.light
          : userTheme.userTheme == 1
              ? ThemeMode.dark
              : userTheme.userTheme == 2
                  ? ThemeMode.system
                  : ThemeMode.light,
      home: const Wrapper(),
    );
  }
}
