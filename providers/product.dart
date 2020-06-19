import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product with ChangeNotifier
{
final String id;
final String name;
final String status;
final String species;
final String type;
final String gender;
final List<Origin> origin;
final List<Location> location;
final String image;
final List <String> episode;
final String url;
final String created;

Product({
  @required this.id,
  @required this.name,
  @required this.status,
  @required this.species,
  @required this.type,
  @required this.gender,
  @required this.origin,
  @required this.location,
  @required this.image,
  @required this.episode,
  @required this.url,
  @required this.created
});

}
class Origin with ChangeNotifier
{
String name;
String url;
Origin({this.name,this.url});
factory Origin.fromJson(Map<String,dynamic> parsedJson)
{
return Origin(name: parsedJson['name'],url: parsedJson['url']);
}


}

class Location with ChangeNotifier
{
String name;
String url;
Location({this.name,this.url});
factory Location.fromJson(Map<String,dynamic> parsedJson)
{
return Location(name: parsedJson['name'],url: parsedJson['url']);
}


}