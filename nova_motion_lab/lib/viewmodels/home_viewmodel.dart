import 'package:flutter/material.dart';

import '../models/experience_model.dart';
import '../repositories/experience_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final List<ExperienceModel> experiences =
  ExperienceRepository.getExperiences();

  ExperienceModel? selectedExperience;

  void selectExperience(
      ExperienceModel experience,
      ) {
    selectedExperience = experience;
    notifyListeners();
  }
}