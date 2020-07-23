import 'package:anime_app/api/base/ReturnedData.dart';
import 'package:anime_app/api/service/RestService.dart';

class TopAnimeFetch {

  TopAnimeFetch(this.returnedData, this.page, this.type);
  ReturnedData returnedData;
  int page;
  String type;

  RestService restService = new RestService();

  fetch() async {
    returnedData.onProgress();
    restService.getTopAnime(page, type).then((response){
      if (response != null){
        returnedData.onSuccess(response, flag: "$type");
      }else {
        returnedData.onError("Null Data");
      }
    }).catchError((err) {
      returnedData.onError(err.toString());
    }).timeout(Duration(seconds: 15), onTimeout: () {
      returnedData.onError("Connection Timeout");
    });
  }

}