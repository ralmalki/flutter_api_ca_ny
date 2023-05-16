import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/error/exceprions.dart';
import '../../models/artical_model.dart';
import '../../models/articals_model.dart';
import 'articals_local_datasource.dart';

//this is the articals local data source implementation
//that implements the articals local data source
//and override the methods
class ArticalsLocalDataSourceImpl implements ArticalsLocalDataSource {
  late Future<Isar> db;

  ArticalsLocalDataSourceImpl() {
    db = openDB();
  }

//this returns the articals from the local database
  @override
  Future<ArticalsModel> getArticals() async {
    final isar = await db;
    final articalList = await isar.articalModels.where().findAll();
    if (articalList.isNotEmpty) {
      final articals = ArticalsModel(
          num_results: articalList.length, status: 'ok', results: articalList);
      return articals;
    } else {
      throw CacheException();
    }
  }

//this cache the articals in the local database
  @override
  Future<void> cacheArticals(ArticalsModel articalToCache) async {
    final isar = await db;
    await clearDB();
    await isar
        .writeTxn(() => isar.articalModels.putAll(articalToCache.results));
  }


//this close the local database
  @override
  Future<void> closeDB() async {
    final isar = await db;
    await isar.close();
  }

//this returns the artical by id from the local database
  @override
  Future<ArticalModel> getArticalById(int id) async {
    final isar = await db;
    final artical = await isar.articalModels.get(id);
    if (artical != null) {
      return artical;
    } else {
      throw CacheException();
    }
  }

//this open the local database
  @override
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory(); 
    final isar = await Isar.open(
      [ArticalModelSchema],
      directory: dir.path,
    );
    return isar;
  }

  //this clear the local database
  @override
  Future<void> clearDB() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
