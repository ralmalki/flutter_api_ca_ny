import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/local/articals_local_datasource.dart';

import '../../../../core/error/exceprions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/articals.dart';
import '../../domain/repositories/most_popular_articals_repository.dart';
import '../datasources/remote/articals_remote_datasource.dart';

//this repository implementation takes the network info and the remote and local data sources
//and extends the most popular articals repository
//and override the geAllSectionsArticals method
//and check if the device is connected to the internet
//if it is connected to the internet
//call the remote data source method getArticals and pass the period to it
//and cache the result in the local data source
//and return the result
//if it is not connected to the internet
//call the local data source method getArticals
//and return the result
//if there is an exception return the failure
class MostPopularArticalsRepositoryImpl
    implements MostPopularArticalsRepository {
  final NetworkInfo networkInfo;
  final ArticalsRemoteDataSource remoteDataSource;
  final ArticalsLocalDataSource localDataSource;

  MostPopularArticalsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Articals>> geAllSectionsArticals(int period) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteArticals =
            await remoteDataSource.getArticals(period: period);
        localDataSource.cacheArticals(remoteArticals);
        return Right(remoteArticals);
      } on ServerException {
        print(Left(ServerFailure()));
        return Left(ServerFailure());
      }
    } else {
      try {
        final localArticals = await localDataSource.getArticals();
        return Right(localArticals);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
