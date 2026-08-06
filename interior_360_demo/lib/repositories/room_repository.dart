import '../core/constants/app_assets.dart';
import '../core/models/room_model.dart';

class RoomRepository {

  static List<RoomModel> getRooms() {

    return const [

      RoomModel(

        name: "Living Room",

        image: AppAssets.livingRoom,

        description: "Modern Luxury Living Room",

      ),

      RoomModel(

        name: "Bedroom",

        image: AppAssets.livingRoom,

        description: "Minimal Bedroom",

      ),

      RoomModel(

        name: "Kitchen",

        image: AppAssets.livingRoom,

        description: "Premium Kitchen",

      ),

      RoomModel(

        name: "Office",

        image: AppAssets.livingRoom,

        description: "Modern Workspace",

      ),

      RoomModel(

        name: "Dining Room",

        image: AppAssets.livingRoom,

        description: "Elegant Dining",

      ),

    ];

  }

}