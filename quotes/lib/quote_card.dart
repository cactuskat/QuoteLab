import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:intl/intl.dart';


Color cardColor(String c) => switch (c.toLowerCase()) {
    'humor' => Colors.amber.shade100,
    'poem' => Colors.purple.shade100,
    'book' => const Color.fromARGB(255, 180, 232, 219),
    'celebrity' => Colors.orange.shade100,
    _ => Colors.grey.shade100,
};

class QuoteCard extends StatefulWidget {

  final Quote quote;
  final VoidCallback onDelete;
    const QuoteCard({required this.quote, required this.onDelete});
 
  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  Future<void> _confirmDelete() async {
    final ok = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Delete quote?'),
            content: const Text('This cannot be undone.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;
    if (ok) widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    final quote = widget.quote;
    final formattedDate = DateFormat('MMM d, yyyy').format(quote.createdAt);

    return Card(
      color: cardColor(quote.category),
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '" ${quote.text} "',
              style: TextStyle(
                fontSize: 20.0,
                color: const Color.fromARGB(255, 5, 4, 4),
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              '- ${quote.author}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 6.0),
            Row(
              children: [
                Chip(label: Text(quote.category)),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => setState(() => quote.likes++),
                ),
                Text('${quote.likes}'),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: _confirmDelete,
                  color: Colors.redAccent
                ),
              ],
            ),
            ],
          ),
        )
    );
  }
}