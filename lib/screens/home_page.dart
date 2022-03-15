import 'package:estate/models/category_model.dart';
import 'package:estate/models/property_model.dart';
import 'package:estate/screens/category_page.dart';
import 'package:estate/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (_currentIndex == 0) {
          return SingleChildScrollView(
              child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/user1.jpeg'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome back!',
                              style: Theme.of(context).textTheme.caption),
                          Text('Thuy',
                              style: Theme.of(context).textTheme.headline6),
                        ],
                      ),
                      const Spacer(),
                      const Icon(LineIcons.bellAlt),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8)),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Search...',
                        prefixIcon: Icon(LineIcons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 0.4),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryButton(
                        categoryModel: categories[index],
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Text('Recommendations',
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: properties.length,
                      itemBuilder: (BuildContext context, int index) {
                        PropertyModel propertyModel = properties[index];
                        return RecommendationCard(propertyModel: propertyModel);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ));
        } else if (_currentIndex == 1) {
          return const Center(
            child: Text("Favorite page"),
          );
        } else if (_currentIndex == 2) {
          return const Center(
            child: Text("Search Page"),
          );
        } else if (_currentIndex == 3) {
          return const Center(
            child: Text("Settings page"),
          );
        }
        return const SizedBox();
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(12)),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            unselectedItemColor: Colors.white,
            onTap: (p0) {
              setState(() {
                _currentIndex = p0;
              });
            },
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                title: const Text("Likes"),
                selectedColor: Colors.pink,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
                selectedColor: Colors.orange,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: const Text("Settings"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    DetailsPage(propertyModel: propertyModel))));
      },
      child: Container(
          width: 200,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  height: 120,
                  width: double.infinity,
                  image: AssetImage(propertyModel.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xffE5CE6A),
                    borderRadius: BorderRadius.circular(16)),
                child: Text('FOR SALE',
                    style: Theme.of(context).textTheme.subtitle2),
              ),
              const SizedBox(height: 12),
              Text(propertyModel.title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 6),
              Text(
                  "${propertyModel.rooms} rooms - ${propertyModel.area} sqft - ${propertyModel.floors} floors",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryButton({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(
                      categoryModel: categoryModel,
                    )));
      },
      child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryModel.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  height: 50,
                  width: 50,
                  image: AssetImage('images/${categoryModel.assetPath}'),
                  fit: BoxFit.cover,
                ),
              ))
            ],
          )),
    );
  }
}
