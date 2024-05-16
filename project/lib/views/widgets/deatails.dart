import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/models/deatailsapi.dart';

import 'package:project/models/recipedetails.dart';

class RecipeDetailWidget extends StatefulWidget {
  final String recipeId;

  const RecipeDetailWidget({Key? key, required this.recipeId})
      : super(key: key); // Fix the key parameter

  @override
  _RecipeDetailWidgetState createState() => _RecipeDetailWidgetState();
}

class _RecipeDetailWidgetState extends State<RecipeDetailWidget> {
  late Future<Content?> recipeDetailFuture; // Use late keyword

  @override
  void initState() {
    super.initState();
    recipeDetailFuture = getdata(); // Assign the Future directly
  }

  Future<Content?> getdata() async {
    try {
      Content recipeDetail =
          await RecipeDetailAPI.getRecipeDetail(widget.recipeId);
      return recipeDetail;
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: recipeDetailFuture, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text('Error: ${snapshot.error ?? "Unknown error"}'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            Content recipeDetail = snapshot.data!;
            var ingredients = List.generate(
                recipeDetail.ingredientLines!.length,
                (index) =>
                    Text("${recipeDetail.ingredientLines![index].ingredient}",style: const TextStyle(color: Colors.black),));
            var preparation = recipeDetail.preparationSteps
                    ?.map((step) => Text('- $step',style: const TextStyle(color: Colors.black),))
                    .toList() ??
                [];
            return Scaffold(
              appBar: AppBar(
                title: Text(recipeDetail.details?.name ?? 'Recipe Detail'),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        recipeDetail.details?.images?[0].hostedLargeUrl ?? ''),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      recipeDetail.description!.text ?? '',
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Ingredients:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ingredients,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Preparation Steps:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: preparation,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
