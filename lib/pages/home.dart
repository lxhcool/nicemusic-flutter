import 'package:flutter/material.dart';
import 'package:nicemusic/api/http.dart';
import 'package:nicemusic/model/banner_model.dart';

class HomePage extends StatefulWidget {
  @override
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    getBanner();
  }

  getBanner () async {
    var response = await Http().get('/banner');
    var bannerList = BannerModel.fromJson(response);
    print(bannerList["list"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _buildBody(context),
          )
        ],
      ),
    );
  }

  Widget _buildBody (BuildContext context) {
    return Text(
      "hello, world"
    );
  }

}