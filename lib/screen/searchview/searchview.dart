import 'package:flutter/material.dart';

class Searchview extends StatefulWidget {
  const Searchview({super.key});

  @override
  State<Searchview> createState() => _SearchviewState();
}

class _SearchviewState extends State<Searchview> {
  final List<Map<String, dynamic>> _users = [
    {"id": 1, "name": "Abir", "Branch": "AIMI", "CGPA": "A"},
    {"id": 2, "name": "Sahed", "Branch": "CSC", "CGPA": "B"},
    {"id": 3, "name": "Alam", "Branch": "BBS", "CGPA": "C"},
    {"id": 4, "name": "Tamzid", "Branch": "BBA", "CGPA": "D"},
    {"id": 5, "name": "Rudro", "Branch": "MAI", "CGPA": "E"}
  ];

  List<Map<String, dynamic>> _filtueruser = [];
  @override
  void initState() {
    _filtueruser = _users;
    super.initState();
  }

  void search(String enteredkeyword) {
    List<Map<String, dynamic>> results = _users;

    if (enteredkeyword.isEmpty) {
      setState(() {
        _filtueruser = results;
      });
    } else {
      results = _users
          .where((user) => (user["name"]
              .toLowerCase()
              .contanis(enteredkeyword.toLowerCase())))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SearchView"),
        ),
        body: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            child: TextField(
              onChanged: (value) {
                search(value);
              },
              decoration: InputDecoration(
                  hintText: "Tyepe heare",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _filtueruser.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.amber,
                child: Card(
                  child: ListTile(
                    leading: Text("${_filtueruser[index]["id"]}"),
                    title: Text("${_filtueruser[index]["name"]}"),
                    subtitle: Text("${_filtueruser[index]["Branch"]}"),
                    trailing: Text("${_filtueruser[index]["CGPA"]}"),
                  ),
                ),
              );
            },
          ))
        ]),
      ),
    );
  }
}
