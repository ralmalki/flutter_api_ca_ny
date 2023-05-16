import '../../models/articals_model.dart';

abstract class ArticalsRemoteDataSource {
  /// Calls the http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ArticalsModel> getArticals({
    required int period,
  });
}
