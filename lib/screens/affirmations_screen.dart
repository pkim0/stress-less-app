import 'package:flutter/material.dart';

class AffirmationsScreen extends StatelessWidget {
  const AffirmationsScreen({super.key});

  // List of affirmations and their corresponding image URLs.
  final List<Map<String, String>> affirmations = const [
    {
      "text": "I am capable and strong.",
      "image": "https://picsum.photos/250/250?random=1",
    },
    {
      "text": "Today, I choose positivity and peace.",
      "image": "https://picsum.photos/250/250?random=2",
    },
    {
      "text": "I embrace my uniqueness.",
      "image": "https://picsum.photos/250/250?random=3",
    },
    {
      "text": "Every step I take brings me closer to my goals.",
      "image": "https://picsum.photos/250/250?random=4",
    },
    {
      "text": "I am worthy of love and respect.",
      "image": "https://picsum.photos/250/250?random=5",
    },
    {
      "text": "Challenges are opportunities for growth.",
      "image": "https://picsum.photos/250/250?random=6",
    },
    {
      "text": "I believe in myself and my abilities.",
      "image": "https://picsum.photos/250/250?random=7",
    },
    {
      "text": "I radiate kindness and compassion.",
      "image": "https://picsum.photos/250/250?random=8",
    },
    {
      "text": "I am grateful for all that I have.",
      "image": "https://picsum.photos/250/250?random=9",
    },
    {
      "text": "My potential is limitless.",
      "image": "https://picsum.photos/250/250?random=10",
    },
    {
      "text": "I trust in my journey and embrace the unknown.",
      "image": "https://picsum.photos/250/250?random=11",
    },
    {
      "text": "I am deserving of happiness and success.",
      "image": "https://picsum.photos/250/250?random=12",
    },
    {
      "text": "I am resilient and can overcome any obstacle.",
      "image": "https://picsum.photos/250/250?random=13",
    },
    {
      "text": "My mind is clear, focused, and at peace.",
      "image": "https://picsum.photos/250/250?random=14",
    },
    {
      "text": "I am constantly growing and evolving.",
      "image": "https://picsum.photos/250/250?random=15",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  affirmation["image"]!,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image,
                        size: 250); // Fallback if image fails.
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    affirmation["text"]!,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
