import 'package:anime_app/api/base/ReturnedData.dart';
import 'package:anime_app/api/service/RestService.dart';

class EpisodeFetch {

  EpisodeFetch(this.returnedData);
  ReturnedData returnedData;

  RestService restService = new RestService();
  
  fetch() async {
    returnedData.onProgress();
    
    restService.getEpisodes(16498).then((response) {
      if (response != null) {
        returnedData.onSuccess(response);
      } else {
        returnedData.onError("Null Data");
      }
    }).catchError((error) {
      returnedData.onError(error.toString());
    }).timeout(Duration(seconds: 15), onTimeout: () {
      returnedData.onError("TimeOut");
    });
  }

}