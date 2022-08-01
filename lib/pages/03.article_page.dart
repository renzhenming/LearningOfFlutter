import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/02.article_item.dart';
import 'package:flutter_app/http/api.dart';
import 'package:flutter_app/pages/10.web_page.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ArticlePageState();
  }
}

class ArticlePageState extends State<ArticlePage> {
  ///滑动控制器
  final ScrollController _controller = ScrollController();

  ///请求到的文章数据
  List articles = [];

  ///banner图
  List banners = [];

  ///分页加载，当前页码
  var curPage = 0;

  ///总文章数有多少
  var totalCount = 0;

  ///控制正在加载的显示
  bool _isHide = true;

  @override
  void initState() {
    super.initState();
    print('ArticlePage initState');
    _controller.addListener(() {
      print('ArticlePage controller.addListener');

      ///获得 SrollController 监听控件可以滚动的最大范围
      var maxScroll = _controller.position.maxScrollExtent;

      ///获得当前位置的像素值
      var currentPix = _controller.position.pixels;

      print(
          '_controller listner maxScroll = $maxScroll currentPix = $currentPix');

      ///当前滑动位置到达底部，同时还有更多数据
      if (maxScroll == currentPix && curPage < totalCount) {
        _pullToRefresh();
      }
    });
    _pullToRefresh();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('ArticlePage deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('ArticlePage dispose');
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('ArticlePage build');
    return Stack(
      children: [
        Offstage(
          offstage: !_isHide,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),

        ///内容
        Offstage(
          offstage: _isHide,

          ///SwipeRefresh 下拉刷新组件
          child: RefreshIndicator(
            onRefresh: _pullToRefresh,
            child: ListView.builder(
                controller: _controller,
                itemCount: articles.length + 1,
                itemBuilder: (context, i) => _buildItem(i)),
          ),
        ),
      ],
    );
  }

  Future<void> _pullToRefresh() async {
    print('ArticlePage _pullToRefresh');
    curPage = 0;
    Iterable<Future> futures = [_getArticlelist(), _getBanner()];
    await Future.wait(futures);
    _isHide = false;
    setState(() {});
    print('ArticlePage _pullToRefresh 2');
    return null;
  }

  Widget _buildItem(int i) {
    if (i == 0) {
      //Container ：容器
      return Container(
        //MediaQuery.of(context).size.height: 全屏幕高度
        height: MediaQuery.of(context).size.height * 0.3,
        color: Colors.red,
        child: _bannerView(),
      );
    }
    var itemData = articles[i - 1];
    return ArticleItem(itemData);
  }

  _getBanner([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);
      if (update) {
        setState(() {});
      }
    }
  }

  _getArticlelist([bool update = true]) async {
    var data = await Api.getArticleList(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];

      ///文章总数
      totalCount = map["pageCount"];

      print('ArticlePage _getArticlelist totalCount = $totalCount');
      if (curPage == 0) {
        articles.clear();
      }
      curPage++;
      articles.addAll(datas);

      ///更新ui
      if (update) {
        setState(() {});
      }
    }
  }

  Widget? _bannerView() {
    //map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
    //map方法最终会返回一个  Iterable<T>
    List<Widget> list = banners.map((item) {
      return InkWell(
        child: Image.network(
          item['imagePath'],
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebViewPage(item['imagePath'], item['title']);
          }));
        },
      );
      return Image.network(item['imagePath'], fit: BoxFit.cover); //fit 图片充满容器
    }).toList();
    return list.isNotEmpty
        ? BannerView(
            list,
            //控制轮播时间
            intervalDuration: const Duration(seconds: 3),
          )
        : null;
  }
}
