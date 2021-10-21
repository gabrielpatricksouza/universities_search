library universities;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:universities/src/model.dart';
import 'package:universities/src/repository.dart';
import 'package:universities/src/university_info.dart';

class SelectUniversity extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String errorText;
  final Color textFormFieldColor;
  final Color iconCollegeColor;
  final Color iconInfoColor;
  final Color iconBackColor;
  final bool backButton;
  final bool infoButton;
  final double borderRadius;
  final ValueSetter<Map> onSelect;

  const SelectUniversity({
    Key? key,
    this.labelText = "Universities",
    this.errorText = "No University found!",
    this.hintText = "Enter your college name",
    this.textFormFieldColor = Colors.deepPurpleAccent,
    this.iconCollegeColor = Colors.deepPurpleAccent,
    this.iconBackColor = Colors.deepPurpleAccent,
    this.iconInfoColor = Colors.deepPurpleAccent,
    this.borderRadius = 28.0,
    required this.backButton,
    required this.infoButton,
    required this.onSelect,
  }) : super(key: key);

  @override
  _SelectUniversityState createState() => _SelectUniversityState();
}

class _SelectUniversityState extends State<SelectUniversity> {
  @override
  void initState() {
    searchUniversities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: _loadList
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      if (widget.backButton)
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: widget.iconBackColor,
                                size: 25,
                              )),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: _inputController,
                          cursorColor: Colors.grey[700],
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(widget.borderRadius)),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: widget.textFormFieldColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(widget.borderRadius)),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: widget.textFormFieldColor,
                                ),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[700]),
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], fontSize: 18),
                              labelText: widget.labelText,
                              hintText: widget.hintText,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Icon(
                                  Icons.school,
                                  color: widget.iconCollegeColor,
                                  size: 25,
                                ),
                              )),
                          onChanged: (value) {
                            filterSearch(value);
                          },
                        ),
                      ),
                      _showItemList.isEmpty
                          ? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  widget.errorText,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Expanded(
                              child: NotificationListener<
                                  OverscrollIndicatorNotification>(
                                onNotification: (OverscrollIndicatorNotification
                                    overscroll) {
                                  overscroll.disallowGlow();
                                  return true;
                                },
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _showItemList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        widget.onSelect(UniversitiesModel()
                                            .toMap(_showItemList[index]));
                                      },
                                      child: ListTile(
                                        minVerticalPadding: 5.0,
                                        title: Text(
                                          '${_showItemList[index].name}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        subtitle: Text(
                                          '${_showItemList[index].fullName}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () =>
                                                UniversityInfo.open(context,
                                                    _showItemList[index]),
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: widget.iconInfoColor,
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                    ],
                  ),
          )),
    );
  }

  final _inputController = TextEditingController();
  final List<UniversitiesModel> _initList = [];
  final List _showItemList = [];
  bool _loadList = false;

  void filterSearch(String query) {
    List<UniversitiesModel> searchList = [];
    searchList.addAll(_initList);

    if (query.isNotEmpty) {
      List<UniversitiesModel> resultListData = [];
      for (var item in searchList) {
        if (item.name.contains(query.toUpperCase())) {
          setState(() => resultListData.add(item));
        }
      }
      _showItemList.clear();
      setState(() => _showItemList.addAll(resultListData));
      return;
    } else {
      _showItemList.clear();
      setState(() => _showItemList.addAll(_initList));
    }
  }

  void searchUniversities() async {
    setState(() => _loadList = true);

    Client client = Client();
    _initList.addAll(await UniversitiesRepository(client).getUniversities());
    _showItemList.addAll(_initList);

    setState(() => _loadList = false);
  }
}
