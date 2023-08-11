import 'package:flutter/material.dart';
import 'package:myproject/main.dart';
import 'package:myproject/model/my_model.dart';
import 'package:myproject/widget/blog_screen.dart';
import 'package:myproject/widget/card_user.dart';

List listBlog1 = [];

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "search",
              ),
              onChanged: (text) => searchblog(text),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Carduser(
            blog: listBlog1[index],
          );
        },
        itemCount: listBlog1.length,
      ),
    );
  }

  searchblog(String searchText) {
    searchText = searchText.toLowerCase();
    if (searchText.isEmpty) {
      setState(() {
        listBlog1 = listBlog;
      });
    } else {
      List<Blog> filteredProducts = [];
      for (final product in listBlog) {
        if (product.title.toLowerCase().contains(searchText)) {
          filteredProducts.add(product);
        }
      }
      setState(() {
        listBlog1 = filteredProducts;
      });
    }
  }
}
