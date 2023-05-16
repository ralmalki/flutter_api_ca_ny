import 'package:flutter/material.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/presentation/pages/ArticalDetailsPage.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/presentation/pages/MostPopularArticals.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MostPopularArticals();
      },
      routes: [
        GoRoute(
          path:
              'artical_details/:title/:abstract/:imageUrl/:author/:date/:articalLink',
          name: 'articalDetails',
          builder: (BuildContext context, GoRouterState state) {
            return ArticalDetailsPage(
              title: state.pathParameters['title']!,
              abstract: state.pathParameters['abstract']!,
              imageUrl: state.pathParameters['imageUrl']!,
              author: state.pathParameters['author']!,
              date: state.pathParameters['date']!,
              articalLnk: state.pathParameters['articalLink']!,
            );
          },
        ),
      ],
    ),
  ],
);
