import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticalDetailsPage extends StatelessWidget {
  final String title;
  final String abstract;
  final String imageUrl;
  final String author;
  final String date;
  final String articalLnk;
  const ArticalDetailsPage({
    super.key,
    required this.title,
    required this.abstract,
    required this.imageUrl,
    required this.author,
    required this.date,
    required this.articalLnk,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(date),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(title, style: Theme.of(context).textTheme.titleLarge),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child:
                  Text(abstract, style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ));
  }
}
