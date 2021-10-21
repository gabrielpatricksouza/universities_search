import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:universities/src/repository.dart';

class ClientMock extends Mock implements http.Client{}

void main(){
  final client = ClientMock();
  final respository = UniversitiesRepository(client);

  test("deve buscar uma lista de universidades", () async {
    when(client).calls(#get).thenAnswer((_) async => http.Response(jsonReturn, 200));
    
    final list = await respository.getUniversities();

    expect(list.isNotEmpty, equals(true));
    expect(list.first.id, equals(1));
  });
  
  test("deve retornar uma exceptio se status code não for 200", () async {
    when(client).calls(#get).thenAnswer((_) async => http.Response(jsonReturn, 400));
    expect(()async => await respository.getUniversities(), throwsException);
  });
}

const jsonReturn = """
[{
  "id": 1,
  "full_name": "UNIVERSIDADE FEDERAL DE MATO GROSSO",
  "name": "UFMT",
  "ibge": "5103403",
  "city": "CUIABA",
  "uf": "MT",
  "zipcode": "78060900",
  "street": "AVENIDA FERNANDO CORREA DA COSTA",
  "number": "2367",
  "neighborhood": "BOA ESPERANÇA",
  "phone": "(65) 3615 8302",
  "created_at": "2020-08-30T02:50:17.000Z",
  "updated_at": "2020-11-27T18:40:06.000Z"
}]""";