import 'package:braip_clone/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ParamUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class NoParamUsecase<Type> {
  Future<Either<Failure, Type>> call();
}
