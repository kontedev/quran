import 'dart:convert';
import 'package:coran/models/sourates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijri/hijri_calendar.dart';

class SourateProvider with ChangeNotifier {
  Future<Sourate> getDetailSourate(int numeroSourate) async {
    final String response =
        await rootBundle.loadString('assets/api/coran.json');
    final Map<String, dynamic> data = jsonDecode(response);

    final sourates = (data['data'] as List)
        .map((sourateJson) => Sourate.fromJson(sourateJson))
        .toList();

    return sourates.firstWhere(
      (sourate) => sourate.number == numeroSourate,
      orElse: () => throw Exception('Sourate not found'),
    );
  }

  Future<List<Map<String, dynamic>>> getVersetsForPage(int page) async {
    try {
      final String response = await rootBundle.loadString('assets/api/coran.json');
      final Map<String, dynamic> data = jsonDecode(response);

      if (data['data'] is List) {
        final sourates = (data['data'] as List).map((sourateJson) => Sourate.fromJson(sourateJson)).toList();

        final List<Map<String, dynamic>> souratesWithVerses = [];

        for (var sourate in sourates) {
          final versetsForPage = sourate.ayahs.where((verset) => verset.page == page).toList();
          if (versetsForPage.isNotEmpty) {
            souratesWithVerses.add({
              'sourate': sourate,
              'versets': versetsForPage,
            });
          }
        }

        return souratesWithVerses;
      } else {
        throw Exception('Invalid JSON format');
      }
    } catch (e) {
      throw Exception('Failed to load verses');
    }
  }

  Future<List<Map<String, dynamic>>> getVersetsForJuz(int juz) async {
    try {
      final String response = await rootBundle.loadString('assets/api/coran.json');
      final Map<String, dynamic> data = jsonDecode(response);

      if (data['data'] is List) {
        final sourates = (data['data'] as List).map((sourateJson) => Sourate.fromJson(sourateJson)).toList();

        final List<Map<String, dynamic>> souratesWithVerses = [];

        for (var sourate in sourates) {
          final versetsForJuz = sourate.ayahs.where((verset) => verset.juz == juz).toList();
          if (versetsForJuz.isNotEmpty) {
            souratesWithVerses.add({
              'sourate': sourate,
              'versets': versetsForJuz,
            });
          }
        }

        return souratesWithVerses;
      } else {
        throw Exception('Invalid JSON format');
      }
    } catch (e) {
      throw Exception('Failed to load verses');
    }
  }

  Future<List<Sourate>> getAllSourates() async {
    final String response =
        await rootBundle.loadString('assets/api/coran.json');
    final Map<String, dynamic> data = jsonDecode(response);

    final sourates = (data['data'] as List)
        .map((sourateJson) => Sourate.fromJson(sourateJson))
        .toList();

    return sourates;
  }

  
}

extension HijriCalendarExtension on HijriCalendar {
  String get dayNameInFrench {
    switch (this.dayWeName) {
      case 'Saturday':
        return 'Samedi';
      case 'Sunday':
        return 'Dimanche';
      case 'Monday':
        return 'Lundi';
      case 'Tuesday':
        return 'Mardi';
      case 'Wednesday':
        return 'Mercredi';
      case 'Thursday':
        return 'Jeudi';
      case 'Friday':
        return 'Vendredi';
      default:
        return this.dayWeName; // Retour par défaut si non trouvé
    }
  }

  String get monthNameInFrench {
    switch (this.longMonthName) {
      case 'Muharram':
        return 'Mouharram';
      case 'Safar':
        return 'Safar';
      case 'Rabi al-Awwal':
        return 'Rabi al-Awwal';
      case 'Rabi al-Thani':
        return 'Rabi al-Thani';
      case 'Jumada al-Awwal':
        return 'Joumada al-Awwal';
      case 'Jumada al-Thani':
        return 'Joumada al-Thani';
      case 'Rajab':
        return 'Rajab';
      case 'Shaban':
        return 'Chaabane';
      case 'Ramadan':
        return 'Ramadan';
      case 'Shawwal':
        return 'Chawwal';
      case 'Dhu al-Qidah':
        return 'Dhou al-Qi`da';
      case 'Dhu al-Hijjah':
        return 'Dhou al-Hijja';
      default:
        return this.longMonthName; // Retour par défaut si non trouvé
    }
  }
}