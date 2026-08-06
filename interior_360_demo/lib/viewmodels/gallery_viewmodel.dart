import 'package:flutter/material.dart';

import '../repositories/room_repository.dart';
import '../core/models/room_model.dart';

class GalleryViewModel extends ChangeNotifier {

  final List<RoomModel> rooms =
  RoomRepository.getRooms();

}