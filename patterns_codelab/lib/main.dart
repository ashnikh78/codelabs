import 'package:flutter/material.dart';
import 'data.dart'; // Ensure this import is correct and the file exists.

void main() {
  runApp(const DocumentApp());
}

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}

class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final metadataRecord = document.metadata; // Fetch the metadata.

    return Scaffold(
      appBar: AppBar(
        title: Text(metadataRecord['title']
            as String), // Accessing the title from the map.
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Last modified ${metadataRecord['modified']}', // Accessing the modified date from the map.
            ),
          ),
        ],
      ),
    );
  }
}
