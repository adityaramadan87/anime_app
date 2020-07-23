import 'package:anime_app/api/base/ReturnedData.dart';
import 'package:anime_app/api/model/Episode.dart';
import 'package:anime_app/api/model/Episodes.dart';
import 'package:anime_app/api/model/Top.dart';
import 'package:anime_app/api/model/TopAnime.dart';
import 'package:anime_app/api/service/fetch/EpisodeFetch.dart';
import 'package:anime_app/api/service/fetch/TopAnimeFetch.dart';
import 'package:anime_app/constant/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/helper/SizeHelper.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ReturnedData {

  TopAnime topAnimeAiring;
  TopAnime topAnimeUpcoming;
  TopAnime mostRatedAnime;

  TopAnimeFetch topAnimeAiringFetch;
  TopAnimeFetch topAnimeUpcomingFetch;
  TopAnimeFetch mostRatedAnimeFetch;

  bool loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  void onSuccess(Object data, {String flag}) {
    if (data is TopAnime){
      setState(() {
        if (flag == Constant.AIRING){
          this.topAnimeAiring = data;
          this.loading = false;
        }else if (flag == Constant.UPCOMING){
          this.topAnimeUpcoming = data;
          this.loading = false;
        }else {
          this.mostRatedAnime = data;
          this.loading = false;
        }
      });
    }
  }

  @override
  void onError(String message) {
    print("$message");
    setState(() {
      this.loading = false;
    });
  }

  @override
  void onProgress() {
    print("progress");
    setState(() {
      this.loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: this.loading ?
      Center(
        child: CircularProgressIndicator(),
      )
      :
      SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Text("Anime", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
              ),

              //Top Airing
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Whats hot", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,)),
                    SizedBox(width: 5,),
                    Image.asset("images/fire.png", height: 16, width: 16,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(color: Colors.grey, height: 0.5, margin: EdgeInsets.only(right: 16),),
                    )
                  ],
                ),
              ),
              Container(
                width: SizeHelper.screenWidth,
                height: SizeHelper.blockSizeVertical * 25,
                child: ListView.builder(
                  itemCount: this.topAnimeAiring.top.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(16),
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    while (index != 6){
                      Top top = this.topAnimeAiring.top[index];
                      return AnimeList(top, index);
                    }
                  },
                ),
              ),

//              Top Upcoming
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Top Upcoming", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,)),
                    SizedBox(width: 5,),
                    Image.asset("images/upcoming.png", height: 16, width: 16,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(color: Colors.grey, height: 0.5, margin: EdgeInsets.only(right: 16),),
                    )
                  ],
                ),
              ),
              Container(
                width: SizeHelper.screenWidth,
                height: SizeHelper.blockSizeVertical * 25,
                child: ListView.builder(
                  itemCount: this.topAnimeUpcoming.top.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(16),
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    while (index != 6){
                      Top top = this.topAnimeUpcoming.top[index];
                      return AnimeList(top, index);
                    }
                  },
                ),
              ),

              // Most Rated
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Most Rated", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,)),
                    SizedBox(width: 5,),
                    Image.asset("images/medal.png", height: 16, width: 16,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(color: Colors.grey, height: 0.5, margin: EdgeInsets.only(right: 16),),
                    )
                  ],
                ),
              ),
              Container(
                width: SizeHelper.screenWidth,
                height: (SizeHelper.blockSizeVertical * 25) * 3,
                child: ListView.builder(
                  itemCount: this.mostRatedAnime.top.length,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(16),
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    while (index != 6){
                      Top top = this.mostRatedAnime.top[index];
                      return MostRatedAnime(top, index);
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void init() {
    this.loading = false;

    this.topAnimeAiring = new TopAnime();
    this.topAnimeUpcoming = new TopAnime();
    this.mostRatedAnime = new TopAnime();

    this.topAnimeAiringFetch = new TopAnimeFetch(this, 1, Constant.AIRING);
    this.topAnimeAiringFetch.fetch();

    this.topAnimeUpcomingFetch = new TopAnimeFetch(this, 1, Constant.UPCOMING);
    this.topAnimeUpcomingFetch.fetch();

    this.mostRatedAnimeFetch = new TopAnimeFetch(this, 1, "");
    this.mostRatedAnimeFetch.fetch();
  }

  Widget AnimeList(Top data, int index) {
    return InkWell(
      onTap: (){
        if (index != 5){

        }else {

        }
      },
      child: Container(
        alignment: Alignment.topCenter,
        width: SizeHelper.blockSizeHorizontal * 25,
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: index != 5 ? Colors.grey.withOpacity(0.5) : Colors.white,
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(1, 3)
            ),
          ]
        ),
        height: SizeHelper.blockSizeVertical * 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              index != 5 ?
              Image.network(
                data.imageUrl,
                height: SizeHelper.blockSizeVertical * 20,
                fit: BoxFit.cover,
              )
              :
              Image.asset(
                "images/next.png",
                height: SizeHelper.blockSizeVertical * 20,

              ),
              Container(
                width: SizeHelper.blockSizeHorizontal *25,
                height: 20,
                color: Colors.grey.withOpacity(0.6),
                padding: EdgeInsets.only(left: 5, top: 2),
                child: Text(
                  index != 5 ? data.title : "See More",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget MostRatedAnime(Top top, int index) {
    return InkWell(
      onTap: (){},
      child: Container(
        alignment: Alignment.topCenter,
        width: SizeHelper.screenWidth,
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: index != 5 ? Colors.grey.withOpacity(0.5) : Colors.white,
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: Offset(1, 3)
              ),
            ]
        ),
        height: SizeHelper.blockSizeVertical * 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                top.imageUrl,
                width: SizeHelper.blockSizeVertical * 12.5,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
