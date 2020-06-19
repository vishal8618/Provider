import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../providers/product.dart';
import 'package:http/http.dart' as http;
import '../model/http_exception.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  final String userId;
  Products(this.userId, this._items);

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    var url = 'https://rickandmortyapi.com/api/character/';
    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
    
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(
          Product(
            id: prodId,
            name: prodData['name'],
            status: prodData['status'],
            species: prodData[''],
            type: prodData['type'],
            gender: prodData['gender'],
            origin:parseOrigin(prodData),
            location: parseLocation(prodData),
            image: prodData['image'],
            episode: parseEpisode(prodData['episode']),
            url: prodData['url'],
            created: prodData['created'],
          ),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }

  }
  
   static List<Origin> parseOrigin(originJson)
   {
     var list=originJson['origin'] as List;
     List<Origin>  originList=list.map((data) => Origin.fromJson(data)).toList();
     return originList;
   }

 static List<Location> parseLocation(locationJson)
   {
     var list=locationJson['location'] as List;
     List<Location>  locationList=list.map((data) => Location.fromJson(data)).toList();
     return locationList;
   }
   static List<String> parseEpisode(episodeJson)
   {
     List<String> episodeList=new  List<String>.from(episodeJson);
     return episodeList;
   }
}
