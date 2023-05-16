import 'apis/most_popular_articals_api.dart';
import '../../models/articals_model.dart';

import '../../../../../core/consts.dart';
import 'articals_remote_datasource.dart';

//this is the articals remote data source implementation
//that implements the articals remote data source
//and override the methods
//this returns the articals from the remote api
//and pass the period and the api key to it
//and return the result
//if there is an exception return the failure
class ArticalsRemoteDataSourceImpl extends ArticalsRemoteDataSource {
  final MostPopularArticlesApi mostPopularArticlesApi;

  ArticalsRemoteDataSourceImpl({required this.mostPopularArticlesApi});

  @override
  Future<ArticalsModel> getArticals({
    required int period,
  }) async {
    return await mostPopularArticlesApi.getMostPopularArticles(
        period: period, apiKey: API_KEY);
  }
}
