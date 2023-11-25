part of 'database_bloc.dart';

sealed class DatabaseState extends Equatable {
  const DatabaseState();
  
  @override
  List<Object> get props => [];
}

final class DatabaseInitial extends DatabaseState {}
