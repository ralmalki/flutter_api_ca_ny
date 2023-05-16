import 'package:equatable/equatable.dart';

abstract class ArticalsEvent extends Equatable {
  const ArticalsEvent();

  @override
  List<Object> get props => [];
}

class GetMostPopularArticalsAllSections extends ArticalsEvent {
  late final int period;

  GetMostPopularArticalsAllSections(int period) {
    this.period = period;
  }

  @override
  List<Object> get props => [period];
}
