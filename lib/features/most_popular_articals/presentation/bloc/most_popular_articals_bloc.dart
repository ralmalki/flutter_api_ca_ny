import '../../domain/usecases/get_most_popular_articals_usecase.dart';

import '../../../../core/consts.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/articals.dart';
import 'most_popular_articals_event.dart';
import 'most_popular_articals_state.dart';
import 'package:bloc/bloc.dart';

class ArticalsBloc extends Bloc<ArticalsEvent, ArticalsState> {
  final GetMostPopularArticalsUsecase getMostPopularArticalsUsecase;

  //Constructor it takes the usecase as a parameter and pass it to the super class
  //and set the initial state to ArticalsLoading
  //and listen to the event of GetMostPopularArticalsAllSections
  //and call the usecase and pass the period to it
  //and emit the state of ArticalsLoading
  //and wait for the result
  //if the result is a failure emit the state of ArticalsError
  //if the result is a success emit the state of ArticalsLoaded
  ArticalsBloc({required this.getMostPopularArticalsUsecase})
      : super(ArticalsLoading()) {
    on<GetMostPopularArticalsAllSections>((event, emit) async {
      emit(ArticalsLoading());
      final result =
          await getMostPopularArticalsUsecase(Params(period: event.period));

      result.fold(
          (failure) =>
              emit(ArticalsError(message: _mapFailureToMessage(failure))),
          (articals) => _loaded(articals, emit));
    });
  }
  void _loaded(Articals articals, Emitter<ArticalsState> emit) async {
    emit(ArticalsLoaded(articals: articals));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }


}
