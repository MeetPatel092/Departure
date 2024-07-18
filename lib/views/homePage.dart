import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = rootBundle.loadString("assets/data.json");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(0.8),
        title: Text(
          "श्रीमद्भगवद्गीता",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      // drawer: Drawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg",
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder(
            future: jsonData,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "..ERROR....",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else if (snapshot.hasData) {
                String? data = snapshot.data;
                List allData = (data == null) ? [] : jsonDecode(data);

                return (allData.isEmpty)
                    ? Center(
                        child: Text("No data available..."),
                      )
                    : ListView.builder(
                        itemCount: allData.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                "detailpage",
                                arguments: allData[i],
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1.5,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  "${allData[i]['chapter']}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${allData[i]['sanskrit']}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white70,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${allData[i]['verse']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
