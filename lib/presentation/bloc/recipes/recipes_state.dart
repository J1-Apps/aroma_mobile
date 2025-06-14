import "package:dart_mappable/dart_mappable.dart";

part "recipes_state.mapper.dart";

@MappableClass(discriminatorKey: "status")
sealed class RecipesState with RecipesStateMappable {
  const RecipesState();
}

@MappableClass(discriminatorValue: "loading")
class RecipesStateLoading extends RecipesState with RecipesStateLoadingMappable {
  const RecipesStateLoading();
}

@MappableClass(discriminatorValue: "error")
class RecipesStateError extends RecipesState with RecipesStateErrorMappable {
  const RecipesStateError();
}

@MappableClass(discriminatorValue: "success")
class RecipesStateSuccess extends RecipesState with RecipesStateSuccessMappable {
  const RecipesStateSuccess();
}
