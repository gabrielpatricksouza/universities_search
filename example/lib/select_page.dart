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
