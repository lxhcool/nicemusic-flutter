import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'mock/post.dart';
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
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(21, 21, 27, 1.0)),
    );
  }
}

class Home extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    final item = posts[index];
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image.network(
              item.imageUrl,
              width: 100,
            ),
            SizedBox(height: 100.0),
            Column(
              children: <Widget>[
                Text(
                  item.title + '(' + item.author + ')',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  item.description,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            )
          ],
        ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://via.placeholder.com/350x150",
      fit: BoxFit.fill,
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 3,
          pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个')
        ),
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