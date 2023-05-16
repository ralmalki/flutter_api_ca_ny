import 'package:flutter/material.dart';

import '../../../../core/utilities/extract_auther.dart';

class ArticalAutherWidget extends StatelessWidget {
  const ArticalAutherWidget({
    super.key,
    required this.author,
  });

  final String author;

  @override
  Widget build(BuildContext context) {
    return Text(extractAuther(author),
        maxLines: 1, overflow: TextOverflow.ellipsis);
  }
}