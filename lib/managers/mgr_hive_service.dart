import 'package:dukkantek_test/helpers/hlp_caching_model.dart';
import 'package:hive/hive.dart';
import 'network/mgr_net_connectivity_service.dart';


 class HiveService {
static isExists({required String boxName, required String key}) async {
    final openBox = await Hive.openBox(boxName);
    bool isExists = await openBox.keys.contains(key);
        if(isExists)
        {
          if(await ConnectivityService.isConnected()){

           //print(await ConnectivityService.isConnected());
            CachingModel boxData = openBox.get(key);
            if(boxData.expireDate.isAfter(DateTime.now())){
              return false;
            }
            else
            {
              return isExists;
            }
          }
          else
            {
              return isExists;
            }
        }
        return isExists;
  }

static addBoxes<CachingModel>(CachingModel item, String boxName, String key) async {
    final openBox = await Hive.openBox(boxName);
      openBox.put(key, item);
  }

static getBoxes<CachingModel>(String boxName, String key) async {
    CachingModel boxData;

    final openBox = await Hive.openBox(boxName);
    boxData = openBox.get(key);
    

    return boxData;
  }


static clear()  {
    Hive.box('APIResponses').clear();
  }
}