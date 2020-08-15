import 'package:flutter/material.dart';
import 'package:recipe_app/Models/FilterCategory.dart';
import 'package:recipe_app/Networking/FilterCategory.dart';

class Viewer extends StatefulWidget {
  final String categoryname;
  final String categoryDesc;
  final String categoryThumb;
  Viewer({this.categoryname, this.categoryDesc, this.categoryThumb});

  @override
  _ViewerState createState() => _ViewerState();
}

List<FilterCategory> filter = List<FilterCategory>();

class _ViewerState extends State<Viewer> {
  @override
  void initState() {
    super.initState();
    getCategoryItems();
  }

  getCategoryItems() async {
    CategoryFoodwithCategory categoryfetchClass = CategoryFoodwithCategory();
    await categoryfetchClass.getFilterCategories(widget.categoryname);
    setState(() {
      filter = categoryfetchClass.filtercategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              margin: EdgeInsets.all(13),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(widget.categoryThumb),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff630118).withOpacity(0.92),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.network(widget.categoryThumb,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, right: 2),
                            child: Wrap(
                              children: <Widget>[
                                Text(
                                  widget.categoryDesc,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                  padding: EdgeInsets.all(6),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: filter.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        //getItemAndNavigate(index, context);
                      },
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              filter[index].strMealThumb),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                filter[index].strMeal,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}
