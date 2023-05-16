import 'package:isar/isar.dart';

import '../../../../../core/error/exceprions.dart';
import '../../models/artical_model.dart';
import '../../models/articals_model.dart';

abstract class ArticalsLocalDataSource {
  /// Gets the cached [List<ArticalModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<ArticalsModel> getArticals();

  ///Cache the [List<ArticalModel>] to be used later in offline mode
  Future<void> cacheArticals(ArticalsModel articalToCache);

  ///Open the database
  Future<Isar> openDB();

  ///Close the database
  Future<void> closeDB();

  ///Get the artical by id
  ///throws [CacheException] if no cached data is present.
  Future<ArticalModel> getArticalById(int id);

  ///Clear the database
  Future<void> clearDB();
}
