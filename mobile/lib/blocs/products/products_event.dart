part of 'products_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class ProductInitialize extends ProductEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class ProductFectData extends ProductEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class ProductFindData extends ProductEvent {
  final int id;

  ProductFindData(this.id);

  @override
  List<Object?> get props => [id];
}

class ProductDelete extends ProductEvent {
  final int id;

  ProductDelete(this.id);

  @override
  List<Object?> get props => [id];
}
