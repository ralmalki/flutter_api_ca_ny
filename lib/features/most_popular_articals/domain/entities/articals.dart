import 'package:equatable/equatable.dart';
import '../../data/models/artical_model.dart';

//this is the articals entity that extends the equatable class
//and override the props method
class Articals extends Equatable {
  final int num_results;
  final String status;
  final List<ArticalModel> results;

  Articals({
    required this.num_results,
    required this.status,
    required this.results,
  });

  @override
  List<Object?> get props => [num_results, status, results];
}
