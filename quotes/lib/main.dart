import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList()
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Nikita Gill', text: 'We are all just stars that have human names', category: 'Poem',likes: 2,createdAt: DateTime(1986, 3, 30)),
    Quote(author: 'Sylvia Plath', text: 'I am, I am, I am.',category: 'Book',likes:1,createdAt: DateTime(1993, 4, 10)),
    Quote(author: 'Eartha Kitt', text: 'I am learning all the time. The tombstone will be my diploma.',category: 'Celebrity',likes:5,createdAt: DateTime(1934, 12, 2))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 156, 205, 142),
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(quote: quote, onDelete: () => setState(() => quotes.remove(quote)))).toList(),
      ),
    );
  }
}
