import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/articals.dart';
import '../repositories/most_popular_articals_repository.dart';


//this usecase takes the repository as a parameter and extends the usecase class
//and override the call method
//and call the repository method geAllSectionsArticals and pass the period to it
//and return the result
//if the result is a failure return the failure
//if the result is a success return the articals
class GetMostPopularArticalsUsecase extends UseCase<Articals, Params> {
  final MostPopularArticalsRepository repository;

  GetMostPopularArticalsUsecase(this.repository);

  @override
  Future<Either<Failure, Articals>> call(Params params) async {

    return await repository.geAllSectionsArticals(params.period);
  }
}

class Params extends Equatable {
  final int period;

  const Params({required this.period});

  @override
  List<Object> get props => [period];
}
