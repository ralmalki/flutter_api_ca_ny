import 'package:dartz/dartz.dart';
import 'package:flutter_api_ca_ny/core/error/failures.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/data/models/artical_model.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/domain/entities/articals.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/domain/repositories/most_popular_articals_repository.dart';
import 'package:flutter_api_ca_ny/features/most_popular_articals/domain/usecases/get_most_popular_articals_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

void main() {
  MockMostPopularArticalsRepository mockMostPopularArticalsRepository =
      MockMostPopularArticalsRepository();
  GetMostPopularArticalsUsecase usecase =
      GetMostPopularArticalsUsecase(mockMostPopularArticalsRepository);

  // final articals = Articals(status: 'ok', num_results: 1, results: [
  //   ArticalModel(
  //     id: 1,
  //     title: "title",
  //     abstract: "abstract",
  //     published_date: "published_date",
  //     media: [],
  //     url: "url",
  //     byline: "byline",
  //   )
  // ]);

//testing most popular artical usecases
  test('Testig Most popule artical usecases', () async {
    final result = await usecase(const Params(period: 1));
    expect(result.isRight(), true);
    verify(usecase(const Params(period: 1)));
    verifyNoMoreInteractions(usecase);
  });
}
