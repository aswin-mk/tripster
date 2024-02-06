import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final User? user = FirebaseAuth.instance.currentUser;

  final _searchFieldController = TextEditingController();

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions= [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    String apikey = 'AIzaSyCv7HfxioHkM9jUm28YUOLKKB7JfWz5N0s';
    googlePlace = GooglePlace(apikey);
  }

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
    if (Navigator.of(context).canPop()) Navigator.pop(context);
    Navigator.pushNamed(context, '/signin');
  }

  void autocompleteSearch(String value)async{
    var result =await googlePlace.autocomplete.get(value);
    if ( result!= null &&result.predictions!=null && mounted){
      
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchFieldController,
              autofocus: false,
              showCursor: false,
              decoration: InputDecoration(
                hintText: 'Find Your Destination',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
              ),
              onChanged: (value){
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce=Timer(const Duration(milliseconds: 1000), () {
                  if (value.isNotEmpty){
                  autocompleteSearch(value);
                 }
                 });
                if (value.isNotEmpty){
                  autocompleteSearch(value);
                }
              },
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: predictions.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(predictions[index].description.toString(),),
                );
            })
          ],
        ),
      ),
    );
  }
}
