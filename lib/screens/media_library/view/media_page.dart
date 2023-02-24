import 'package:flutter/material.dart';
import 'package:ten_twenty_asssignment/screens/watch/components/search_field.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchField(),
          ],
        ),
      ),
    );
  }

}