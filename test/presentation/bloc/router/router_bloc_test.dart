import "package:aroma_mobile/domain/entity/auth_entity.dart";
import "package:aroma_mobile/presentation/bloc/router/router_bloc.dart";
import "package:aroma_mobile/presentation/bloc/router/router_event.dart";
import "package:aroma_mobile/presentation/bloc/router/router_state.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";
import "../../../test_util/testing_utils.dart";

void main() {
  group("Router Bloc", () {
    final authUsecase = MockAuthUsecase();
    late RouterBloc bloc;

    setUp(() {
      bloc = RouterBloc(authUsecase: authUsecase);
    });

    tearDown(() {
      bloc.close();
    });

    test("auth changed event is handled correctly", () async {
      when(authUsecase.call).thenAnswer((_) => Stream.value(const AuthEntitySignedIn(userId: "123")));
      expect(bloc.state, const RouterState(auth: AuthEntitySignedOut()));

      bloc.add(const RouterEventInit());

      await awaitMs(1);
      expect(bloc.state, const RouterState(auth: AuthEntitySignedIn(userId: "123")));
    });
  });
}
