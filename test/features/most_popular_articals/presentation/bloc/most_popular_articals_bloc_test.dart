import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_api_ca_ny/core/consts.dart';
import 'package:flutter_api_ca_ny/core/error/failures.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/data/models/artical_model.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/domain/entities/articals.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/domain/repositories/most_popular_articals_repository.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/domain/usecases/get_most_popular_articals_usecase.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/presentation/bloc/most_popular_articals_bloc.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/presentation/bloc/most_popular_articals_event.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/presentation/bloc/most_popular_articals_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMostPopularArticalsUsecase extends Mock
    implements GetMostPopularArticalsUsecase {}

class MockMostPopularArticalsRepository extends Mock
    implements MostPopularArticalsRepository {
  @override
  Future<Either<Failure, Articals>> geAllSectionsArticals(int period) async {
    return Right(Articals(status: 'ok', num_results: 1, results: [
      ArticalModel(
        id: 1,
        title: "title",
        abstract: "abstract",
        published_date: "published_date",
        media: [],
        url: "url",
        byline: "byline",
      )
    ]));
  }
}

void main() async {
  MockMostPopularArticalsRepository mockMostPopularArticalsRepository =
      MockMostPopularArticalsRepository();
  GetMostPopularArticalsUsecase getMostPopularArticalsUsecase =
      GetMostPopularArticalsUsecase(mockMostPopularArticalsRepository);
  // MockParams mockParams = MockParams();
  final mockParams = Params(period: 1);

  final articals = Articals(status: 'ok', num_results: 1, results: [
    ArticalModel(
      id: 1,
      title: "title",
      abstract: "abstract",
      published_date: "published_date",
      media: [],
      url: "url",
      byline: "byline",
    )
  ]);

  ArticalsBloc bloc = ArticalsBloc(
      getMostPopularArticalsUsecase: getMostPopularArticalsUsecase);

  test('Articals Block Initial State',
      () => expect(bloc.state, ArticalsLoading()));

  blocTest<ArticalsBloc, ArticalsState>(
    'emits [ArticalsLoading, ArticalsLoaded] when successful',
    build: () {
      when(getMostPopularArticalsUsecase(mockParams))
          .thenAnswer((_) async => Right(articals));
      return bloc;
    },
    act: (bloc) => bloc.add(GetMostPopularArticalsAllSections(1)),
    expect: () => [ArticalsLoading(), ArticalsLoaded(articals: articals)],
  );

  blocTest<ArticalsBloc, ArticalsState>(
    'emits [ArticalsLoading, ArticalsError] when unsuccessful',
    build: () {
      when(getMostPopularArticalsUsecase(mockParams))
          .thenAnswer((_) async => Left(ServerFailure()));
      return bloc;
    },
    act: (bloc) => bloc.add(GetMostPopularArticalsAllSections(1)),
    expect: () =>
        [ArticalsLoading(), ArticalsError(message: SERVER_FAILURE_MESSAGE)],
  );

  blocTest<ArticalsBloc, ArticalsState>(
    'emits [ArticalsLoading, ArticalsError] when unsuccessful',
    build: () {
      when(getMostPopularArticalsUsecase(mockParams))
          .thenAnswer((_) async => Left(CacheFailure()));
      return bloc;
    },
    act: (bloc) => bloc.add(GetMostPopularArticalsAllSections(1)),
    expect: () =>
        [ArticalsLoading(), ArticalsError(message: CACHE_FAILURE_MESSAGE)],
  );
}
