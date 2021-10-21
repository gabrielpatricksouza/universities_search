import 'dart:convert';
import 'package:http/http.dart';
import 'package:universities/src/model.dart';

class UniversitiesRepository{
  final Client client;
  UniversitiesRepository(this.client);

  Future<List<UniversitiesModel>> getUniversities() async {
    var response = await client.get(Uri.parse("https://api-universidades.vercel.app/api/universidades"));

    if(response.statusCode == 200){
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((e) => UniversitiesModel.fromMap(e)).toList();

    }else{
      throw Exception("Ocorreu um erro!");
    }
  }
}