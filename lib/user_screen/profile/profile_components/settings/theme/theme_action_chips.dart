import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techka/models/theme_chip_list.dart';
import 'package:techka/models/user_theme_provider.dart';

import '../../../../../components/custom_sliver_header.dart';

class ThemeAction extends StatefulWidget {
  const ThemeAction({Key? key}) : super(key: key);

  @override
  State<ThemeAction> createState() => _ThemeActionState();
}

class _ThemeActionState extends State<ThemeAction> {
 final ThemeChipsList _themeChipsList = ThemeChipsList();

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<UserThemeProvider>(context);
    int? value = theme.userTheme;
    return Wrap(
      runSpacing: 40.0,
      children: [
      ListTile(
          subtitle: const Text(
            'Dark theme uses a black background to help keep your battery alive longer and cut the glare from your screen significantly for comfortable viewing. ',
            textAlign: TextAlign.justify,
          ),
        ),
        Center(
          child: AnimatedContainer(
            width: MediaQuery.of(context).size.width,
            height: value == 0
                ? MediaQuery.of(context).size.height * 0.30
                : value == 1
                    ? MediaQuery.of(context).size.height * 0.20
                    : value == 2
                        ? MediaQuery.of(context).size.height * 0.20
                        : MediaQuery.of(context).size.height * 0.20,
            duration: const Duration(seconds: 2),
            curve: Curves.elasticInOut,
            alignment: value == 0
                ? Alignment.center
                : value == 1
                    ? Alignment.topRight
                    : value == 2
                        ? Alignment.topLeft
                        : Alignment.center,
            child: AnimatedCrossFade(
              firstChild: const Icon(
                Icons.auto_awesome,
                size: 150.0,
              ),
              secondChild: AnimatedCrossFade(
                firstChild: const Icon(
                  Icons.light_mode,
                  size: 150.0,
                  color: Colors.yellow,
                ),
                secondChild: const Icon(
                  Icons.dark_mode,
                  size: 150.0,
                  color: Colors.white38,
                ),
                crossFadeState: value == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
              ),
              crossFadeState: value == 2
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            children: List<Widget>.generate(
              _themeChipsList.length,
              (int index) {
                return ListTile(
                  title: Text('${_themeChipsList.getThemeChip(index).label}'),
                  subtitle: Text(_themeChipsList.getThemeChip(index).desc),
                  trailing: ChoiceChip(
                    avatar: _themeChipsList.getThemeChip(index).icon,
                    label: Text(_themeChipsList.getThemeChip(index).label),
                    selected: value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        value = index;
                        theme.userTheme = value!;
                      });
                    },
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
