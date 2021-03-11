import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_nav/src/localizations/app_localizations.dart';
import '../Blocs/blocs.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).translate('app_bar_title')),
      actions: <Widget>[
        IconButton(
          tooltip: AppLocalizations.of(context).translate('info_text'),
          icon: Icon(Icons.translate),
          onPressed: () {
            if (AppLocalizations.of(context).isEnLocale) {
              BlocProvider.of<LocaleCubit>(context).toTurkish();
            } else {
              BlocProvider.of<LocaleCubit>(context).toEnglish();
            }
          },
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context).translate('head_title'),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context).translate('first_text'),
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context).translate('second_text'),
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context).translate('third_text'),
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
