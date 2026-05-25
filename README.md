# QuoteLab
Flutter made quote list following a Net Ninja Tutorial

## Loom Link
https://www.loom.com/share/a536e5cb74804a76a9002f8f97feb986

## Reflection
I started by adding the new variables needed for the quote class in quote.dart. Next, I added the new features that were static such as tag, themes, and date in quote_card.dart. I found it tricky to add the stage changes like likes-counter and delete confirmation. I finished by changing the quotes in main.dart and UI polishing in quote_card.dart.

### Changes
-	Added cardColor depending on each quote type [quote_card]
-	Changed QuoteCard from Stateless to Stateful to [quote_card]
-	Added a delete confirmation [quote_card]
o	Made confirm Delete a Future<void>
-	Stylized Quote Card for better UI experience [quote_card]
-	Updated pubspec.yaml environment to 3.0.0 and added dependencies likes intl
-	Added Quote.dart final variables to include all new added features mentioned above with defaults
-	Changed from default quotes to my own favorites [main.dart]
-	Changed background color [main.dart]
-	Added onDelete setState [main.dart]

### Tricky Parts
-	Making changes from Dart 2 to Dart 3
o Adding null safety: The tutorial code was done before dart required null safety, so I had to update certain lines of code. For example, adding ‘required’ to class initialization.
-	Connecting onDelete setState and making it functional => I ended up moving the setstate to main.dart 
-	Figuring out where cardColor goes in the context of the widgets => moved it above the widgets
-	Getting confirmDelete to alert and actually delete on quote_card.dart => created it as a future<void> & sper.key
-	Figuring out exactly where does formattedDate go inside of a Widget
-	Formatting the quote card on quote_card.dart to be visually appealing with the icon in spaces that makes sense. For example, the like icon and the delete icon on the far right
