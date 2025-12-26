import 'dart:async';

import 'package:get/get.dart';

class PortfolioController extends GetxController {
  final RxInt selectedProject = 0.obs;

  final experiences = [
    {
      "title": "Flutter Developer",
      "period": "Jun 2023 – Oct 2023",
      "note": "Initial professional journey"
    },
    {
      "title": "Career Gap",
      "period": "Nov 2023 – Dec 2023",
      "note": "Skill upgrade & learning"
    },
    {
      "title": "Flutter Developer",
      "period": "Jan 2024 – Present",
      "note": "Working on scalable enterprise apps"
    },
  ];

  void selectProject(int index) {
    selectedProject.value = index;
  }


  final DateTime firstJoin = DateTime(2023, 6, 21);
  final DateTime gapStart = DateTime(2023, 11, 1);
  final DateTime gapEnd = DateTime(2023, 12, 31);
  final DateTime reJoin = DateTime(2024, 1, 6);

  /// Observable experience text
  final experienceText = ''.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _calculateExperience();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _calculateExperience();
    });
  }

  void _calculateExperience() {
    final now = DateTime.now();

    Duration total = Duration.zero;

    // First phase
    total += gapStart.difference(firstJoin);

    // Second phase
    if (now.isAfter(reJoin)) {
      total += now.difference(reJoin);
    }

    final years = total.inDays ~/ 365;
    final months = (total.inDays % 365) ~/ 30;
    final days = (total.inDays % 365) % 30;
    final hours = total.inHours % 24;
    final minutes = total.inMinutes % 60;
    final seconds = total.inSeconds % 60;

    experienceText.value =
    "$years yrs $months mos $days days "
        "$hours hrs $minutes min $seconds sec";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }







}
