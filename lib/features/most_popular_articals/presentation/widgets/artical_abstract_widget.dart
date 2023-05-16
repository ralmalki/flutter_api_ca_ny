import 'package:flutter/material.dart';

class ArticalAbstractWidget extends StatelessWidget {
  const ArticalAbstractWidget({
    super.key,
    required this.abstract,
  });

  final String abstract;

  @override
  Widget build(BuildContext context) {
    return Text(abstract, maxLines: 2, overflow: TextOverflow.ellipsis);
  }
}