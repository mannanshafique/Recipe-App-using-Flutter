import 'package:flutter/material.dart';
import 'package:recipe_app/Models/FilterCategory.dart';
import 'package:recipe_app/Networking/FilterCategory.dart';
import 'Models/CategoryModel.dart';

class CategoryView extends StatefulWidget {
  final List<Categories> categories;
  final int intial;
  final String categoryname;
  final String categoryDesc;
  final String categoryThumb;

  CategoryView(
      {@required this.categories,
      this.intial,
      this.categoryname,
      this.categoryDesc,
      this.categoryThumb});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        vsync: this,
        length: widget.categories.length,
        initialIndex: widget.intial);
    getCategoryItems();
  }

//
  List<FilterCategory> filterCategoryModel = List<FilterCategory>();
  bool _isLoading = true;

  getCategoryItems() async {
    CategoryFood categoryfetchClass = CategoryFood();
    await categoryfetchClass.getFilterCategories(widget.categoryname);
    filterCategoryModel = categoryfetchClass.filtercategories;
    setState(() {
      _isLoading = false;
    });
  }

//
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = new List<Tab>();

    for (int i = 0; i < widget.categories.length; i++) {
      tabs.add(Tab(
        child: Text(
          widget.categories[i].strCategory,
          style: TextStyle(color: Colors.black),
        ),
      ));
    }

    return DefaultTabController(
      length: widget.categories.length,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xff630118),
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Category",
            style: TextStyle(color: Color(0xff630118)),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xff630118),
            labelPadding: EdgeInsets.only(right: 20),
            isScrollable: true,
            tabs: tabs,
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              Viewer(
                item: filterCategoryModel,
                categoryDesc: widget.categoryDesc,
                categoryThumb: widget.categoryThumb,
              ),
              Viewer(
                item: filterCategoryModel,
                categoryDesc: widget.categoryDesc,
                categoryThumb: widget.categoryThumb,
              ),
              Viewer(
                item: filterCategoryModel,
                categoryDesc: widget.categoryDesc,
                categoryThumb: widget.categoryThumb,
              ),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
              Viewer(),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}

class Viewer extends StatelessWidget {
  final String categoryDesc;
  final String categoryThumb;
  final List<FilterCategory> item;

  Viewer({this.item, this.categoryDesc, this.categoryThumb});
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
                      image: NetworkImage(categoryThumb), fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff630118).withOpacity(0.92),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.network(categoryThumb, fit: BoxFit.fill),
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
                                categoryDesc,
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
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                  padding: EdgeInsets.all(6),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: item.length,
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
                                              item[index].strMealThumb),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                item[index].strMeal,
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
