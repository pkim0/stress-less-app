import 'package:flutter/material.dart';

class AffirmationsScreen extends StatelessWidget {
  const AffirmationsScreen({super.key});

  // List of affirmations and their corresponding image URLs.
  final List<Map<String, String>> affirmations = const [
    {
      "text": "I am capable and strong.",
      "image": "https://picsum.photos/50/50?random=1",
    },
    {
      "text": "Today, I choose positivity and peace.",
      "image": "https://picsum.photos/50/50?random=2",
    },
    {
      "text": "I embrace my uniqueness.",
      "image": "https://picsum.photos/50/50?random=3",
    },
    {
      "text": "Every step I take brings me closer to my goals.",
      "image": "https://picsum.photos/50/50?random=4",
    },
    {
      "text": "I am worthy of love and respect.",
      "image": "https://picsum.photos/50/50?random=5",
    },
    {
      "text": "Challenges are opportunities for growth.",
      "image": "https://picsum.photos/50/50?random=6",
    },
    {
      "text": "I believe in myself and my abilities.",
      "image": "https://picsum.photos/50/50?random=7",
    },
    {
      "text": "I radiate kindness and compassion.",
      "image": "https://picsum.photos/50/50?random=8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Affirmations'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          final affirmation = affirmations[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(
                affirmation["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image,
                      size: 50); // Fallback if image fails.
                },
              ),
              title: Text(
                affirmation["text"]!,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
          );
        },
      ),
    );
  }
}
