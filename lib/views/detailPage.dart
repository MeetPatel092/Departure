import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verse ${data['chapter']}-${data['verse']}',
        ),
        backgroundColor: Colors.purple.withOpacity(0.9),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.purple.shade300,
                  Colors.purple.shade800,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            '${data['image_url']}'), // This should be a valid asset path
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${data['chapter']}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${data['sanskrit']}',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontSize: 26,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Translation :',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${data['translation']}',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Translation Gujarati :',
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${data['gujarati']}',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
