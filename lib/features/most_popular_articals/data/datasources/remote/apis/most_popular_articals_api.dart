import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/consts.dart';
import '../../../models/articals_model.dart';

part 'most_popular_articals_api.g.dart';

//this is the most popular articals api
//that extends the rest api
//and override the getMostPopularArticles method
//and pass the period and the api key to it
//and return the result
//if there is an exception return the failure
@RestApi(baseUrl: BASE_URL)
abstract class MostPopularArticlesApi {
  factory MostPopularArticlesApi(Dio dio) = _MostPopularArticlesApi;

  @GET("/{period}.json")
  Future<ArticalsModel> getMostPopularArticles(
      {@Query("api-key") required String apiKey,
      @Path("period") required int period});
}
