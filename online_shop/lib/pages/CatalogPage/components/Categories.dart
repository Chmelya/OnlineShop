import 'package:flutter/material.dart';

class Categories extends StatefulWidget{
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>{
  List<String> categories = ["Hand bag", "Footwear", "Jewellery", "Dresses"];
  
  int _currentIndex = 0;
  
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
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
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
                color: _currentIndex == index ? Colors.black87 : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              height: 2,
              width: 30,
              color: _currentIndex == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  } 
}