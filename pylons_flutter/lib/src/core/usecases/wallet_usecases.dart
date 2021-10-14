import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class WalletUseCase<Type, Params> {
  Future<Either<Exception, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
