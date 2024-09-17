import 'package:flutter/material.dart';
import '../utills/utills.dart';

class LikedShlokasPage extends StatefulWidget {
  const LikedShlokasPage({super.key});

  @override
  _LikedShlokasPageState createState() => _LikedShlokasPageState();
}

class _LikedShlokasPageState extends State<LikedShlokasPage> {
  @override
  Widget build(BuildContext context) {
    final likedShlokas = LikeUtils.likedShlokas;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Shlokas"),
        backgroundColor: Colors.purple.withOpacity(0.8),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          // Content (List of liked Shlokas)
          likedShlokas.isEmpty
              ? const Center(
                  child: Text(
                    "No liked shlok yet.",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: likedShlokas.length,
                  itemBuilder: (context, index) {
                    var sloka = likedShlokas[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the detail page and pass the sloka data
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.8,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: ListTile(
                          title: Text(
                            "${sloka['sanskrit']}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 5),
                              // Display the chapter number
                              Text(
                                "Chapter ${sloka['chapter']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              LikeUtils.removeShlok(sloka);
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      const Text("Shlok removed from liked."),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
