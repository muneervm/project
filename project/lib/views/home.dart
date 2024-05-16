import 'package:flutter/material.dart';
import 'package:project/models/recepie.dart';
import 'package:project/models/recipelistapi.dart';
import 'package:project/profile.dart';
import 'package:project/views/widgets/deatails.dart';
import 'package:project/views/widgets/recipie_card.dart';
import 'package:project/welcome.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = [];
  List<Recipe> _filteredRecipes = [];
  bool _isLoading = true;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await Recipelist.getRecipe();
    _filteredRecipes = List.from(_recipes);
    setState(() {
      _isLoading = false;
    });
  }

  void _filterRecipes() {
    setState(() {
      _filteredRecipes = _recipes
          .where((recipe) =>
              recipe.name.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 43, 176, 233),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search),
              SizedBox(width: 10),
              Container(
                width: 150, // Adjust the width as needed
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Here',
                    hintStyle: TextStyle(
                      fontSize: 14.0, // Adjust the font size as needed
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    _filterRecipes();
                  },
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _filteredRecipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    title: _filteredRecipes[index].name,
                    cookTime: _filteredRecipes[index].totalTime,
                    rating: _filteredRecipes[index].rating.toString(),
                    thumbnailUrl: _filteredRecipes[index].images,
                 onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          RecipeDetailWidget(recipeId: _filteredRecipes[index].id),
    ),
  );
},

                  );
                },
              ),
      ),
    );
  }
}
