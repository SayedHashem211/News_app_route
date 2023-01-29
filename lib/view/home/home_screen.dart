import 'package:flutter/material.dart';

import '../../core/components/category_grid_view.dart';
import '../category/category_widget.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> category = [
    Category(
        categoryID: "Sports",
        categoryImage: "assets/images/ball.png",
        categoryTitle: "Sports",
        categoryBackground: const Color.fromARGB(255, 201, 28, 34)),
    Category(
        categoryID: "general",
        categoryImage: "assets/images/Politics.png",
        categoryTitle: "General",
        categoryBackground: const Color.fromARGB(255, 0, 62, 144)),
    Category(
        categoryID: "health",
        categoryImage: "assets/images/health.png",
        categoryTitle: "Health",
        categoryBackground: const Color.fromARGB(255, 237, 30, 121)),
    Category(
        categoryID: "technology",
        categoryImage: "assets/images/environment.png",
        categoryTitle: "Technology",
        categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryID: "business",
        categoryImage: "assets/images/bussines.png",
        categoryTitle: "business",
        categoryBackground: const Color.fromARGB(255, 207, 126, 72)),
    Category(
        categoryID: "science",
        categoryImage: "assets/images/science.png",
        categoryTitle: "Science",
        categoryBackground: const Color.fromARGB(255, 242, 211, 82)),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              selectedCategory == null
                  ? "News App"
                  : selectedCategory!.categoryTitle,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  color: Colors.green,
                  width: double.infinity,
                  height: 120,
                  child: const Text(
                    "News App",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategory == null;
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Categories",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Settings",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: selectedCategory == null
              ? Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick your cateory \n of interest",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black54,
                            ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 6 / 7),
                          itemBuilder: (context, i) {
                            return CategoryGridView(
                              index: i,
                              category: category[i],
                              onClickItem: onClick,
                            );
                          },
                          itemCount: category.length,
                        ),
                      ),
                    ],
                  ),
                )
              : CategoryNewsList(selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
