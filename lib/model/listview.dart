
import 'package:flutter/material.dart';
class ListViewm{
  String? pharmacyName;
  String? pharmacyWebsite;
  Image ?image;

  ListViewm ({
    required  this.pharmacyName,
    required this.pharmacyWebsite,
    required this.image
  });

  ListViewm.fromJson(Map<String,dynamic>json){
    pharmacyName=json['pharmacyName'];
    pharmacyWebsite=json['pharmacyWebsite'];
    image=json['image'];
  }
  Map<String,dynamic> toJSON() {
    return {"pharmacyName":pharmacyName,"pharmacyWebsite":pharmacyWebsite,"image":image};
  }

}
