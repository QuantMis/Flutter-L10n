import 'package:flutter/material.dart';
import 'package:localization_test/core/l10n/app_local.dart';
import 'package:localization_test/core/l10n/i10n_provider.dart';
import 'package:localization_test/core/l10n/l10n.dart';
import 'package:localization_test/core/shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    L10nProvider prov = context.watch<L10nProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.loc.applicationTitle),
        actions: [settingIcon()],
      ),
      body: _ui(prov),
    );
  }

  Container settingIcon() {
    return Container(
        padding: const EdgeInsets.only(right: 40),
        child: const Icon(Icons.settings));
  }

  _ui(L10nProvider prov) {
    return Column(
      children: [
        settingsText(),
        Wrap(
          children: List.generate(L10n.all.length, (index) {
            return RadioListTile(
              title: Text(
                L10n.all[index].languageCode == 'en'
                    ? AppLocal.loc.langEn
                    : AppLocal.loc.langMS,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              value: L10n.all[index].languageCode,
              groupValue: prov.local,
              onChanged: (String? value) {
                SharedPref.addLang(value!);
                prov.updateLocal(value);
              },
            );
          }),
        )
      ],
    );
  }

  Text settingsText() {
    return const Text("This is setting page");
  }
}
