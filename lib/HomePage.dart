import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final List<Image> _listViewData = [
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
    Image.network(
        "https://www.themealdb.com/images/media/meals/c9a3l31593261890.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    color: Color(0xff85001F),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Food App",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 6, left: 6, right: 6, bottom: 90),
                            child: TextField(
                              showCursor: true,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 19.0),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(19),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  hintText: "Search your Recipes",
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.3)),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff630118)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff630118)),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  fillColor: Color(0xff630118),
                                  filled: true),
                            ),
                          )
                        ],
                      ),
                    )),
                HorizontalView(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Meal Categories",
                style: TextStyle(
                    color: Color(0xff85001F),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              // color: Colors.black.withOpacity(0.5),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 3,
                padding: EdgeInsets.all(8.0),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 5.0,
                children: _listViewData
                    .map((data) => Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image.network(
                                  "https://www.themealdb.com/images/ingredients/Chicken.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "name",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 9,
                            )
                          ],
                        )))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 145),
      child: Container(
        // color: Colors.pink,
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.themealdb.com/images/media/meals/vssrtx1511557680.jpg"),
                          fit: BoxFit.cover),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              );
            }),
      ),
    );
  }
}

// class HorizontalView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         physics: BouncingScrollPhysics(),
//         child: Row(
//           children: <Widget>[
//             Container(
//               height: 200,
//               width: 200,
//               color: Colors.pink,
//             ),
//             Container(
//               height: 200,
//               width: 200,
//               color: Colors.orange,
//             ),
//             Container(
//               height: 200,
//               width: 200,
//               color: Colors.red,
//             ),
//           ],
//         ));
//   }
// }

// ListView.builder(
//           itemCount: 2,
//           itemBuilder: (BuildContext context, int index) {
//             return Text('item $index');
//           }),
