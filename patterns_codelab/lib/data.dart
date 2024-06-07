import 'dart:convert';
//import 'package:intl/intl.dart'; // Added import for date formatting.

class Document {
  final Map<String, dynamic> _json; // Changed the type to Map<String, dynamic>

  Document() : _json = jsonDecode(documentJson);

  Map<String, dynamic> get metadata {
    // Fetching the metadata map from the JSON data.
    final metadata = _json['metadata'] as Map<String, dynamic>?;

    // Fetching the title and modified date from the metadata map.
    final title = metadata?['title'] as String? ?? 'My Document';
    final modifiedStr = metadata?['modified'] as String?;
    final modified =
        modifiedStr != null ? DateTime.parse(modifiedStr) : DateTime.now();

    return {
      'title': title,
      'modified': modified,
    };
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';
