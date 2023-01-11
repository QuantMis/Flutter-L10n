import 'package:flutter/material.dart';
import 'package:localization_test/core/l10n/app_local.dart';
import 'package:localization_test/src/settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String status = "inactive";
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.loc.status(status)),
        actions: [settingIcon()],
      ),
      body: _ui(),
    );
  }

  InkWell settingIcon() {
    return InkWell(
      onTap: () => goToSettingsPage(),
      child: Container(
          padding: const EdgeInsets.only(right: 40),
          child: const Icon(Icons.settings)),
    );
  }

  _ui() {
    return Column(
      children: [
        welcomeText(),
        Row(
          children: [activateButton(), deactiveButton()],
        )
      ],
    );
  }

  ElevatedButton deactiveButton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            status = "inactive";
          });
        },
        child: Text("Deactivate"));
  }

  ElevatedButton activateButton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            status = "active";
          });
        },
        child: Text("Activate"));
  }

  Text welcomeText() {
    return Text(AppLocal.loc.settings);
  }

  goToSettingsPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }
}
