import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/utils/authentication/authentication.dart';
import 'package:techka/utils/database/db_service.dart';
import '../../../../models/local_user.dart';
import '../../../../models/theme_chip.dart';

class ThemeAction extends StatefulWidget {
  const ThemeAction({Key? key}) : super(key: key);

  @override
  State<ThemeAction> createState() => _ThemeActionState();
}

class _ThemeActionState extends State<ThemeAction> {

  List<ThemeChip> chip = [
    ThemeChip('Light', const Icon(Icons.light_mode, color: Colors.yellow,)),
    ThemeChip('Dark', const Icon(Icons.dark_mode, color: Colors.blueGrey,)),
    ThemeChip('Auto', const Icon(Icons.auto_awesome, color: Colors.blue,)),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<LocalUser>(context);
    int? value = theme.themeValue;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AnimatedContainer(
                width: MediaQuery.of(context).size.width,
                height: value == 0 ? MediaQuery.of(context).size.height*0.35 : value == 1 ? 200 : value == 2 ? MediaQuery.of(context).size.height*0.35 : MediaQuery.of(context).size.height*0.35,
                duration: const Duration(seconds: 2),
                curve: Curves.elasticInOut,
                alignment: value == 0 ? Alignment.center : value == 1 ? Alignment.topRight : value == 2 ? Alignment.topLeft : Alignment.center,
                child: AnimatedCrossFade(
                  firstChild:  const Icon(Icons.light_mode, size: 150.0, color: Colors.yellow,),
                  secondChild: value == 2 ? const Icon(Icons.auto_awesome, size: 150.0,) : const Icon(Icons.dark_mode, size: 150.0, color: Colors.white38,),
                  crossFadeState: value == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: const Duration(seconds: 1),
                ),
              ),
            ),

            Column(
              children:
              List<Widget>.generate(
                3,
                (int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ChoiceChip(
                      avatar: chip[index].icon,
                      label: Text(chip[index].label),
                      selected: value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          value = index;
                          DatabaseService(uid: Auth().firebaseAuth.currentUser?.uid).updateThemeValue(value!);
                        });
                      },
                    ),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 45.0,),
            const Text('Dark theme uses a black background to help keep your battery alive longer and cut the glare from your screen significantly for comfortable viewing. ',),
          ],
        ),
      ),
    );
  }
}
