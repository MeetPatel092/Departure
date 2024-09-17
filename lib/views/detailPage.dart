import 'package:flutter/material.dart';

import '../utills/utills.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map data = ModalRoute.of(context)!.settings.arguments as Map;
      setState(() {
        isLiked = LikeUtils.isShlokLiked(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
                if (isLiked) {
                  LikeUtils.addShlok(data);
                } else {
                  LikeUtils.removeShlok(data);
                }
              });
            },
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline_sharp,
              color: isLiked ? Colors.red : Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.purple.withOpacity(0.8),
        title: Text(
          "श्रीमद्भगवद्गीता",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('${data['image_url']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Chapter Info
                Row(
                  children: [
                    const Text(
                      'Chapter: ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${data['chapter']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Sanskrit Verse
                Text(
                  '${data['sanskrit']}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Translation Section
                _buildSectionTitle('Translation:', Colors.white),
                const SizedBox(height: 10),
                Text(
                  '${data['translation']}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),

                // Gujarati Translation Section
                _buildSectionTitle('Translation Gujarati:', Colors.white),
                const SizedBox(height: 10),
                Text(
                  '${data['gujarati']}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: color,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
