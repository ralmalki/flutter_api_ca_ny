import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/articals.dart';


//this repository is an abstract class that extends the most popular articals repository
//and override the geAllSectionsArticals method
abstract class MostPopularArticalsRepository {
  Future<Either<Failure, Articals>> geAllSectionsArticals(int period);
}
