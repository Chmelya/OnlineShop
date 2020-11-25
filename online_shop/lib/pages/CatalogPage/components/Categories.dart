import 'package:flutter/material.dart';
import 'package:online_shop/models/Counters.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget{
  const Categories({Key key, this.pageController}) : super(key: key);
  
  final PageController pageController;

  @override
  _CategoriesState createState() => _CategoriesState(pageController);
}

class _CategoriesState extends State<Categories>{
  List<String> categories = ["Sneakers", "Sliders & Flip Flops", "Shoes", "Boots"];
  
  final  PageController pageController;

  _CategoriesState(this.pageController);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index)
      ),
    );
  }

  Widget buildCategory(int index){
    final _currentIndex = Provider.of<CounterForCategories>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex.setValue = index;
          pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.linear);
        });
      },
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _currentIndex.value == index ? Colors.black87 : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              height: 2,
              width: 30,
              color: _currentIndex.value == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  } 
}