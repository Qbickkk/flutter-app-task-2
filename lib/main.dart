import 'package:flutter/material.dart';

void main() {
  List loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquai Ut enim ad minim veniam, quis nostrud exercitation ullamco".split(" ");
  List people = ["Oleh", "Ihor", "Maxim", "Roman", "Dmytro", "Olga", "Daniil", "Alexandra", "Georg", "Sophia", "Vadym", "Kristina"];
  int n = 0;
  
  runApp(
    MyApp(
      items: List<ListItem>.generate(
        12, (i) => i % 6 == 0
            ? HeadingItem('Group $i')
            : MessageItem(people[i], loremIpsum[n++] + " " + loremIpsum[n++]),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;
  const MyApp({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Telegram chat';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);  
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String person;
  final String message;

  MessageItem(this.person, this.message);

  @override
  Widget buildTitle(BuildContext context) => Text(person);

  @override
  Widget buildSubtitle(BuildContext context) => Text(message);
}