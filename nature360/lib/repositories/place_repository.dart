import '../core/constants/app_assets.dart';
import '../core/models/place_model.dart';

class PlaceRepository {

  static List<PlaceModel> getPlaces() {

    return [

      const PlaceModel(

        title: "Sea Beach",

        subtitle: "Feel the Ocean Breeze",

        image: AppAssets.seaBeach,

        description:
        "Relax beside the beautiful blue sea.",

      ),

      const PlaceModel(

        title: "Green Forest",

        subtitle: "Nature & Fresh Air",

        image: AppAssets.greenForest,

        description:
        "Enjoy peaceful greenery and birds.",

      ),

      const PlaceModel(

        title: "Waterfall",

        subtitle: "Refreshing Water",

        image: AppAssets.waterfall,

        description:
        "Listen to the relaxing waterfall.",

      ),

      const PlaceModel(

        title: "Snow Mountain",

        subtitle: "Cold & Peaceful",

        image: AppAssets.snowMountain,

        description:
        "Experience beautiful snowy mountains.",

      ),

      const PlaceModel(

        title: "Sunset Lake",

        subtitle: "Golden Evening",

        image: AppAssets.sunsetLake,

        description:
        "Enjoy an amazing sunset beside the lake.",

      ),

    ];

  }

}