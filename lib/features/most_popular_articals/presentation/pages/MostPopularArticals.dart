import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts.dart';
import '../../../../dep_injection.dart';
import '../bloc/most_popular_articals_bloc.dart';
import '../bloc/most_popular_articals_event.dart';
import '../bloc/most_popular_articals_state.dart';
import '../widgets/artical_abstract_widget.dart';
import '../widgets/artical_aurther_widget.dart';
import '../widgets/artical_cashed_image_widget.dart';
import '../widgets/artical_date_widget.dart';
import '../widgets/artical_title_widget.dart';
import '../widgets/vertical_spacer.dart';

class MostPopularArticals extends StatefulWidget {
  const MostPopularArticals({super.key});

  @override
  State<MostPopularArticals> createState() => _MostPopularArticalsState();
}

class _MostPopularArticalsState extends State<MostPopularArticals> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator<ArticalsBloc>()
        .add(GetMostPopularArticalsAllSections(DEFAULT_PERIOD));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Most Popular Articals'),
            ArticalsPeriodDropDownMenueWidget()
          ],
        ),
      )),
      body: buildBody(context),
    );
  }

  BlocProvider<ArticalsBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ArticalsBloc>(),
      child: BlocBuilder<ArticalsBloc, ArticalsState>(
        bloc: locator<ArticalsBloc>(),
        builder: (context, state) {
          if (state is ArticalsEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          } else if (state is ArticalsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ArticalsLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.articals.num_results,
              itemBuilder: (context, index) {
                final artical = state.articals.results[index];
                var image = DEFUALT_IMAGE;
                if (artical.media.isNotEmpty) {
                  if (artical.media.first.mediametadata!.isNotEmpty) {
                    image = artical.media.first.mediametadata!.last.url!;
                  }
                }
                return ArticalCard(
                  title: artical.title,
                  abstract: artical.abstract,
                  imageUrl: image,
                  author: artical.byline,
                  date: artical.published_date,
                  articalLink: artical.url,
                );
              },
            );
          } else if (state is ArticalsError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Center(
                  child: Card(
                      child: Text(
                          'Something went wrong, please try again or check your internet connection if the problem still presisted'))),
            );
          }
        },
      ),
    );
  }
}

class ArticalsPeriodDropDownMenueWidget extends StatefulWidget {
  const ArticalsPeriodDropDownMenueWidget({
    super.key,
  });

  @override
  State<ArticalsPeriodDropDownMenueWidget> createState() =>
      _ArticalsPeriodDropDownMenueWidgetState();
}

class _ArticalsPeriodDropDownMenueWidgetState
    extends State<ArticalsPeriodDropDownMenueWidget> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _value,
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text(
            'Today',
          ),
        ),
        DropdownMenuItem(
          value: 7,
          child: Text('Last 7 day'),
        ),
        DropdownMenuItem(
          value: 30,
          child: Text('Last 30 days'),
        ),
      ],
      onChanged: (int? value) {
        locator<ArticalsBloc>()
            .add(GetMostPopularArticalsAllSections(value as int));
        _value = value;
        setState(() {});
      },
    );
  }
}

class ArticalCard extends StatelessWidget {
  final String title;
  final String abstract;
  final String imageUrl;
  final String author;
  final String date;
  final String articalLink;

  const ArticalCard({
    super.key,
    required this.title,
    required this.abstract,
    required this.imageUrl,
    required this.author,
    required this.date,
    required this.articalLink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed('articalDetails', pathParameters: {
          'title': title,
          'abstract': abstract,
          'imageUrl': imageUrl,
          'author': author,
          'date': date,
          'articalLink': articalLink,
        });
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            ArticalCashedImageWidget(imageUrl: imageUrl),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ArticalTitleWidget(title: title),
                    const VerticalSpacer(),
                    ArticalAbstractWidget(abstract: abstract),
                    const VerticalSpacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ArticalAutherWidget(author: author),
                        ),
                        ArtiicalDateWidget(date: date),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
