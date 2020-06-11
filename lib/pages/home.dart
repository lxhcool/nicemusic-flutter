import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nicemusic/api/http.dart';
import 'package:nicemusic/model/banner_model.dart';
import 'package:nicemusic/mock/iconfont.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  BannerModel bannerList;

  @override
  void initState() {
    super.initState();

    getBanner();
  }

  getBanner () async {
    var response = await Http().get('/banner');
    BannerModel _bannerList = BannerModel.fromJson(response);

    setState(() {
      bannerList = _bannerList;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
        backgroundColor: Color.fromRGBO(21, 21, 27, 1.0),
        body: _buildBody(context)
    );
  }

  /// 页面主体框架
  Widget _buildBody (BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildTitle(context),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: <Widget>[
                  _buildBanner(context),
                  _buildTab(context)
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  /// 标题区域
  Widget _buildTitle (BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 30.w),
          child: Icon(
              IconFont.nicecaidan,
              color: Color.fromRGBO(255, 255, 255, 0.6),
              size: 46.sp
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
                decoration: new BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    borderRadius: BorderRadius.circular((40.w))
                ),
                height: 80.w,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 20.w),
                      child: Icon(
                          IconFont.nicesearch,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          size: 32.sp
                      ),
                    ),
                    Text(
                      '房间 - 刘瑞琦',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          fontSize: 32.sp
                      ),
                    )
                  ],
                )
            )
        ),
        Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Stack(
              alignment: FractionalOffset(1.w, 1.w),
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
                  radius: 32.w,
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

  /// banner区域
  Widget _buildBanner (BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        margin: EdgeInsets.only(top: 10.w, bottom: 30.w),
        width: MediaQuery.of(context).size.width,
        height: 300.w,
        child: bannerList != null ? Swiper(
            itemBuilder: (BuildContext context, int index) {
              BannerItemModel bannerItem = bannerList.list[index];
              return (Image.network(
                bannerItem.imageUrl,
                fit: BoxFit.cover,
              ));
            },
            itemCount: bannerList.list.length,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    activeColor: Colors.white,
                    size: 14.w,
                    activeSize: 14.w
                )),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) => print('点击了第$index个')
        ) : Container()
    );
  }

  /// tab区域
  Widget _buildTab (BuildContext context) {
    List tabs = [
      {
        "title": "每日推荐",
        "icon": IconFont.nicerili,
        "text": "10"
      },
      {
        "title": "歌单",
        "icon": IconFont.niceyinleliebiao
      },
      {
        "title": "排行榜",
        "icon": IconFont.niceyinleliebiao1
      },
      {
        "title": "歌手",
        "icon": IconFont.nicegeshou
      },
      {
        "title": "视频",
        "icon": IconFont.niceshipin1
      }
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: tabs.map((item) {
        return Column(
          children: <Widget>[
            Container(
              width: 110.w,
              height: 110.w,
              margin: EdgeInsets.only(bottom: 10.w),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 91, 115, 1),
                  borderRadius: BorderRadius.all(Radius.circular(110.w))
              ),
              child: Stack(
                alignment: FractionalOffset(1.w, 1.w),
                children: <Widget>[
                  Icon(
                    item["icon"],
                    color: Color.fromRGBO(255, 255, 255, 1),
                    size: 52.sp,
                  ),
                  Visibility(
                    visible: item["text"] != null,
                    child: Container(
                      margin: EdgeInsets.only(top: 24.w),
                      child: Text(
                        '10',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              item["title"],
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontSize: 26.sp
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}