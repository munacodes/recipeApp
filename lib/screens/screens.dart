import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Text('Detail page');
                  },
                ));
              },
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }
}

Widget buildRecipeCard(Recipe recipe) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        Image(
          image: AssetImage(recipe.imageUrl),
        ),
        const SizedBox(
          height: 14.0,
        ),
        Text(
          recipe.label,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Palatino',
          ),
        ),
      ]),
    ),
  );
}

class Recipe {
  Recipe(this.label, this.imageUrl);
  String label;
  String imageUrl;

  static List<Recipe> samples = [
    Recipe('Spaghetti and Meatballs', 'assets/images/food1.jpg'),
    Recipe('Tomato Soup', 'assets/images/food2.jpg'),
    Recipe('Grilled Cheese', 'assets/images/food3.jpg'),
    Recipe('Chocolate Chip Cookies', 'assets/images/food4.jpg'),
    Recipe('Taco Salad', 'assets/images/food5.jpg'),
    Recipe('Hawaiian Pizza', 'assets/images/food6.jpg'),
  ];
}
