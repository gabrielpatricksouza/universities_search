import 'package:flutter/material.dart';
import 'package:universities/src/my_list_tile.dart';
import 'package:universities/src/model.dart';

class UniversityInfo{
  static open(context, UniversitiesModel university){
    showDialog(
        context: context,
        builder: (_)=> AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyListTile(title: university.name, icon: Icons.school,),
                MyListTile(title: university.fullName, icon: Icons.account_balance,),
                MyListTile(title: university.city + " - " + university.uf, icon: Icons.location_city_sharp,),
                MyListTile(title: university.neighborhood, icon: Icons.explore,),
                MyListTile(title: university.street, icon: Icons.near_me,),
                MyListTile(title: university.number, icon: Icons.house,),
                MyListTile(title: university.phone, icon: Icons.phone,),
              ],
            ),
          ),
        )
    );
  }
}