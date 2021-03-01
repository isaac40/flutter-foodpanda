import 'package:flutter/material.dart';

class BPage extends StatefulWidget {
  @override
  _BPageState createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("團購"),
          centerTitle: true,
        ),
        body: _RestaurantListView(context));
  }

  /// 餐廳 ListView
  Widget _RestaurantListView(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 30),  //距離上方距離
      itemCount: RestaurantList.length,   //資料長度
      itemBuilder: (context, int index) =>  //index會自動抓取 itemCount(所以會根據資料長度分為3區)
          buildCustomItem(context, index, RestaurantList),  //抓取RestaurantList的值
    );
  }

  /// 餐廳 listView 的 Item 畫面
  Widget buildCustomItem(BuildContext context, int index, List<Trip> data) {
    //整個畫面的大小
    return Container(
        padding:
            EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
        // height: 500,
        width: size.width,
        //文字內容
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // return _RestaurantDialog();
                // // return _openAddUserDialog();
              },
              child: Container(
                  height: size.height * 0.3,
                  child: Image.network(data[index].storeLink)
                  // child: _ImgaeNetWorkStyle(RestaurantList[index].storeLink)
                  ),
            ),
            //地址(頭)
            Padding(
              padding: EdgeInsets.only(top: 16, right: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data[index].storeAddress,
                    style: TextStyle(
                        fontSize: 20, //字體大小
                        fontWeight: FontWeight.bold, //粗體字
                        color: Colors.cyan[700]),
                  ),
                ],
              ),
            ),
            //營業時間
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(data[index].storeInfo,
                  style: TextStyle(fontSize: 15, color: Colors.cyan[700])),
            ),
            //地址(底)
            Padding(
              padding: EdgeInsets.only(bottom: 16, right: 8.0, left: 8.0),
              child: Text(data[index].storeAddress,
                  style: TextStyle(fontSize: 15, color: Colors.cyan[700])),
            ),
          ],
        ));
  }

  final List<Trip> RestaurantList = [
    Trip("https://i.imgur.com/ubWh7YM.jpg", "八方雲集沙鹿靜宜店", "營業時間：","台中市沙鹿區英才路17號", 300),
    Trip("https://i.imgur.com/4FW9PSR.png", "偉哥鹹酥雞台中靜宜店", "營業時間", "臺中市沙鹿區北", 0),
    Trip("https://i.imgur.com/MaKS5uX.jpg", "PIZZA", "最棒的 Pizza", "台中市北屯區", 200.00),
  ];
}

/// Trip 的物件讓我存資料用的 暫定，因為沒有 API
class Trip {
  final String storeLink;
  final String storeName;
  final String storeInfo;
  final String storeAddress;
  final double StoreLessMoney;

  Trip(this.storeLink, this.storeName, this.storeInfo, this.storeAddress,
      this.StoreLessMoney);
}
