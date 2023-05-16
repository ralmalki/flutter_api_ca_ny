import 'package:equatable/equatable.dart';

import '../../domain/entities/articals.dart';

abstract class ArticalsState extends Equatable {
  const ArticalsState();

  @override
  List<Object> get props => [];
}

class ArticalsEmpty extends ArticalsState {}

class ArticalsLoading extends ArticalsState {}

class ArticalsLoaded extends ArticalsState {
  final Articals articals;

  const ArticalsLoaded({required this.articals});

  @override
  List<Object> get props => [articals];
}

class ArticalsError extends ArticalsState {
  final String message;

  const ArticalsError({required this.message});

  @override
  List<Object> get props => [message];
}
