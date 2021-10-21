# Universities

This package allows you to search all universities in Brazil.

## Usage
To use this plugin, add `universities` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

### Example

``` dart
import 'package:flutter/material.dart';
import 'package:universities/universities.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectUniversity(
                    backButton: true,
                    infoButton: true,

                    labelText: "Universidades",
                    hintText: "Insira o nome de sua universidade",
                    errorText: "Universidade não encontrada!",

                    textFormFieldColor: Colors.blue,
                    iconBackColor: Colors.deepPurpleAccent,
                    iconCollegeColor: Colors.indigoAccent,
                    iconInfoColor: Colors.deepPurpleAccent,

                    borderRadius: 10.0,

                    onSelect: (Map response){
                      debugPrint(response.toString());
                    },
                  ),
                ),
              );
            },
          child: const Text("Search Universities")),
      ),
    );
  }
}

```
## onSelect

The return of the onSelect function is a Map, containing all the data of the selected university..

```dart
{
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
}
```

## API

API and documentation used in the code. 

Home:
```dart
https://api-universidades.vercel.app/
```

Documentation:
```dart
https://documentacao-api-universidades.vercel.app/
```

## License

Copyright (c) 2021 Gabriel Patrick Souza

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

