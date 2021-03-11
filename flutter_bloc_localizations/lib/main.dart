import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/Blocs/blocs.dart';
import 'src/Routes/app_routes.dart';
import 'src/Themes/app_themes.dart';
import 'src/Blocs/providers.dart';
import 'src/localizations/app_localizations_setup.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          // 'localeState' yalnızca bir STATE (SelectedLocale) içerdiğinden,
          // burada yayılabilecek başka bir durum olup olmadığını kontrol etmek için
          // herhangi bir if koşuluna ihtiyacımız yoktur.
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cubit Demo',
            onGenerateRoute: AppRoutes.onGenerateRoute,
            onUnknownRoute: AppRoutes.onUnkownRoute,
            theme: AppThemes.lightTheme,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            // Her yeni durum yayınlandığında,
            // uygulama yeni yerel ayarla yeniden oluşturulacaktır.
            locale: localeState.locale,
          );
        },
      ),
    );
  }
}
