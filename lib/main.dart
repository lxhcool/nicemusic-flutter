import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nicemusic/pages/home.dart';
import 'mock/iconfont.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// void main() => runApp(MyApp());
void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(21, 21, 27, 1.0)),
    );
  }
}

class Home extends StatelessWidget {

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://p1.music.126.net/HgTufMRMRgWNrWiSlqd3Cw==/109951165052169449.jpg",
      fit: BoxFit.cover,
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 21, 27, 1.0),
      appBar: AppBar(
        title: Title(),
        elevation: 30.0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(top: 5, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 150.0,
            child: Swiper(
              itemBuilder: _swiperBuilder,
              itemCount: 3,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  activeColor: Colors.white,
                  size: 7.0,
                  activeSize: 7.0
                )),
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (index) => print('点击了第$index个')
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 91, 115, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Stack(
                      alignment: const FractionalOffset(0.5, 0.5),
                      children: <Widget>[
                        Icon( 
                          IconFont.nicerili,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          size: 26.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Text(
                            '10',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '每日推荐',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 13.0
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    padding: const EdgeInsets.only(top: 4, left: 3),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 91, 115, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Icon( 
                      IconFont.niceyinleliebiao,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      size: 20.0,
                    ),
                  ),
                  Text(
                    '歌单',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 13.0
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 91, 115, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Icon( 
                      IconFont.nicepaihangbang1,
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      size: 24.0,
                    ),
                  ),
                  Text(
                    '排行榜',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 13.0
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 91, 115, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Icon( 
                      IconFont.nicegeshou,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      size: 24.0,
                    ),
                  ),
                  Text(
                    '歌手',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 13.0
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 91, 115, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Icon( 
                      IconFont.niceshipin1,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      size: 24.0,
                    ),
                  ),
                  Text(
                    '视频',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      fontSize: 13.0
                    ),
                  )
                ],
              )
            ],
          )
        ],
      )
    );
  }
}

// Title
class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 15.0),
          child: Icon( 
            IconFont.nicecaidan,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            size: 23.0
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: new BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.1),
              borderRadius: new BorderRadius.circular((20.0))
            ),
            height: 40.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Icon( 
                    IconFont.nicesearch,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    size: 16.0
                  ),
                ),
                Text(
                  '房间 - 刘瑞琦',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    fontSize: 16.0
                  ),
                )
              ],
            )
          )
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: Stack(
            alignment: const FractionalOffset(0.5, 0.5),
            children: <Widget>[
              SvgPicture.string('''
                <svg
                width="40"
                height="40"
                viewBox="0 0 40 40"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
              >
                <circle
                  r="19"
                  cx="20"
                  cy="20"
                  stroke="#666"
                  stroke-width="2"                        
                  fill="none"
                />
              </svg>
              '''),
              SvgPicture.string('''
                <svg
                width="40"
                height="40"
                viewBox="0 0 40 40"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
              >
                <circle
                  r="19"
                  cx="20"
                  cy="20"
                  stroke="#fafafa"
                  stroke-width="2"                        
                  fill="none"
                  stroke-dasharray="100, 100"
                  stroke-dashoffset="90"
                />
              </svg>
              '''),
              CircleAvatar(
                radius: 16.0,
                backgroundImage: NetworkImage(
                  'http://p2.music.126.net/HdtEacHZAidKtzPCp7Dtfg==/109951163942046079.jpg?param='
                ),
              ),
            ],
          ) 
        ),
      ],
    );
  }
}