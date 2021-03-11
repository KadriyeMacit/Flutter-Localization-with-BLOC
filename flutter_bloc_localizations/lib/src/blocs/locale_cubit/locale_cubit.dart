import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  // super sınıfa varsayılan bir 'Yerel ayar' ile bir başlangıç değeri (durum) geçirme.
  LocaleCubit() : super(SelectedLocale(Locale('en')));

  // Bu yöntemi çağırdığımızda BlocBuilder <LocaleCubit>
  // 'main.dart' içindeki tüm uygulamayı yeniden oluşturacak
  // 'tr' yerel ayarını tutan yeni yayımlanan durum.
  void toTurkish() => emit(SelectedLocale(Locale('tr')));

  // Önceki yöntemle aynı, ancak 'en' yerel ayarıyla.
  void toEnglish() => emit(SelectedLocale(Locale('en')));
}
