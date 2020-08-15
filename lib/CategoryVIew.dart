import 'package:flutter/material.dart';
import 'package:recipe_app/Models/FilterCategory.dart';
import 'package:recipe_app/Networking/FilterCategory.dart';
import 'package:recipe_app/VIewer.dart';
import 'Models/CategoryModel.dart';

List<FilterCategory> filterCategoryModels = List<FilterCategory>();

class CategoryView extends StatefulWidget {
  final List<Categories> categories;
  final int intial;
  final String categoryname;
  // final String categoryDesc;
  // final String categoryThumb;

  CategoryView({
    @required this.categories,
    this.intial,
    this.categoryname,
  });
  // CategoryView(
  // {@required this.categories,
  // this.intial,
  // this.categoryname,
  // this.categoryDesc,
  // this.categoryThumb});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // List<FilterCategory> filterCategoryModel = [];
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        vsync: this,
        length: widget.categories.length,
        initialIndex: widget.intial);
    getCategoryItems(widget.categoryname);
    print(_tabController.index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
//

//

  bool _isLoading = true;

  getCategoryItems(String name) async {
    CategoryFoodwithCategory categoryfetchClass = CategoryFoodwithCategory();

    await categoryfetchClass.getFilterCategories(name);
    filterCategoryModels = categoryfetchClass.filtercategories;
    setState(() {
      _isLoading = false;
    });
  }

  // List<String> categoname = [];

//
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = new List<Tab>();

    for (int i = 0; i < widget.categories.length; i++) {
      // categoname.add(widget.categories[i].strCategory);
      tabs.add(Tab(
        child: Text(
          widget.categories[i].strCategory,
          style: TextStyle(color: Colors.black),
        ),
      ));
    }

    return DefaultTabController(
      initialIndex: widget.intial,
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
            physics: ClampingScrollPhysics(),
            children: [
              Viewer(
                categoryname: 'Beef',
              ),
              Viewer(
                categoryname: 'Chicken',
              ),
              Viewer(
                categoryname: 'Dessert',
              ),
              Viewer(
                categoryname: 'Lamb',
              ),
              Viewer(
                categoryname: 'Miscellaneous',
              ),
              Viewer(
                categoryname: 'Pasta',
              ),
              Viewer(
                categoryname: 'Pork',
              ),
              Viewer(
                categoryname: 'Seafood',
              ),
              Viewer(
                categoryname: 'Side',
              ),
              Viewer(
                categoryname: 'Starter',
              ),
              Viewer(
                categoryname: 'Vegan',
              ),
              Viewer(
                categoryname: 'Vegetarian',
              ),
              Viewer(
                categoryname: 'Breakfast',
              ),
              Viewer(
                categoryname: 'Goat',
              ),
              // Practice(
              //   categoryname: 'Beef',
              // ),
              // Practice(
              //   categoryname: 'CHicken',
              // ),
              // Practice(
              //   categoryname: 'Dessert',
              // ),
              // Practice(
              //   categoryname: 'Lamb',
              // ),
              // Practice(
              //   categoryname: 'Miscellaneous',
              // ),
              // Practice(
              //   categoryname: 'Pasta',
              // ),
              // Practice(
              //   categoryname: 'Pork',
              // ),
              // Practice(
              //   categoryname: 'Seafood',
              // ),
              // Practice(
              //   categoryname: 'Side',
              // ),
              // Practice(
              //   categoryname: 'Starter',
              // ),
              // Practice(
              //   categoryname: 'Vegan',
              // ),
              // Practice(
              //   categoryname: 'Vegetarian',
              // ),
              // Practice(
              //   categoryname: 'Breakfast',
              // ),
              // Practice(
              //   categoryname: 'Goat',
              // ),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}

// class Viewer extends StatefulWidget {
//   final String categoryname;

//   // final String categoryThumb;
//   // final List<FilterCategory> item;

//   // Viewer({this.item, this.categoryname, this.categoryThumb});
//   Viewer({this.categoryname});

//   @override
//   _ViewerState createState() => _ViewerState();
// }

// class _ViewerState extends State<Viewer> {
//   List<FilterCategory> filter = List<FilterCategory>();
//   @override
//   void initState() {
//     super.initState();

//     print(filter);
//     getCategoryItems();
//   }

//   getCategoryItems() async {
//     CategoryFood categoryfetchClass = CategoryFood();
//     await categoryfetchClass.getFilterCategories(widget.categoryname);
//     filter = categoryfetchClass.filtercategories;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               margin: EdgeInsets.all(13),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.26,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.black,
//                   image: DecorationImage(
//                       image: NetworkImage(
//                           'https://www.themealdb.com/images/media/meals/7mxnzz1593350801.jpg'),
//                       fit: BoxFit.fill)),
//               child: Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Color(0xff630118).withOpacity(0.92),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Expanded(
//                       flex: 1,
//                       child: Image.network(
//                           'https://www.themealdb.com/images/media/meals/7mxnzz1593350801.jpg',
//                           fit: BoxFit.fill),
//                     ),
//                     SizedBox(
//                       width: 35,
//                     ),
//                     Expanded(
//                         flex: 2,
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 5, right: 2),
//                           child: Wrap(
//                             children: <Widget>[
//                               Text(
//                                 widget.categoryname,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400),
//                               )
//                             ],
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.5,
//               child: GridView.builder(
//                   padding: EdgeInsets.all(6),
//                   shrinkWrap: true,
//                   physics: BouncingScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   itemCount: filter.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 8,
//                       crossAxisCount: 2),
//                   itemBuilder: (BuildContext context, int index) {
//                     return GestureDetector(
//                       onTap: () {
//                         //getItemAndNavigate(index, context);
//                       },
//                       child: Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                           color: Colors.white,
//                           child: Column(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                               filter[index].strMealThumb),
//                                           fit: BoxFit.fill)),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 filter[index].strMeal,
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               )
//                             ],
//                           )),
//                     );
//                   }))
//         ],
//       ),
//     );
//   }
// }
