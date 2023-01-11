import 'package:flutter/material.dart';
import 'package:localization_test/core/l10n/i10n_provider.dart';
import 'package:localization_test/core/l10n/l10n.dart';
import 'package:localization_test/core/shared_preferences/shared_preferences.dart';
import 'package:localization_test/src/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => L10nProvider())],
      child: Builder(builder: (context) {
        return MaterialApp(
          supportedLocales: L10n.all,
          locale: Locale(Provider.of<L10nProvider>(context).local ??
              SharedPref.lang ??
              'en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          title: 'Localization',
          home: const Home(),
        );
      }),
    );
  }
}
