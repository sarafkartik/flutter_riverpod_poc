import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_init/src/domain/random_fact_repository.dart';
import 'package:riverpod_init/src/data/random_fact.dart';
import 'package:riverpod_init/src/network/common/api_response.dart';
import 'package:riverpod_init/src/presentation/ui/random_fact/random_fact_notifier.dart';
import 'package:riverpod_init/src/presentation/state/random_fact/random_fact_state.dart';
import 'package:riverpod_init/src/presentation/state/random_fact/random_fact_base_state.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import 'random_fact_state_notifier_test.mocks.dart';

@GenerateMocks([RandomFactRepository])
void main() {
  final mockRepository = MockRandomFactRepository();
  final randomFact = RandomFact(id: '', text: '');
  const errorMessage = "Error";

  stateNotifierTest<RandomFactNotifier, RandomFactBaseState>(
      "Returns [] when no method is called",
      build: () => RandomFactNotifier(mockRepository),
      actions: (RandomFactNotifier stateNotifier) {},
      expect: () => []);

  stateNotifierTest<RandomFactNotifier, RandomFactBaseState>(
      "Returns [RandomFactLoadingState, RandomFactLoadedState] when api call is made successfully",
      build: () => RandomFactNotifier(mockRepository),
      setUp: () async {
        when(mockRepository.getRandomFact()).thenAnswer((_) async {
          return ApiResponse(success: true, data: randomFact);
        });
      },
      actions: (RandomFactNotifier stateNotifier) {
        stateNotifier.loadFact();
      },
      expect: () =>
          [RandomFactLoadingState(), RandomFactLoadedState(randomFact)]);

  stateNotifierTest<RandomFactNotifier, RandomFactBaseState>(
      "Returns [RandomFactLoadingState, RandomFactErrorState] when api call is made unsuccessfully",
      build: () => RandomFactNotifier(mockRepository),
      setUp: () async {
        when(mockRepository.getRandomFact()).thenAnswer((_) async {
          return ApiResponse(success: false, error: errorMessage);
        });
      },
      actions: (RandomFactNotifier stateNotifier) {
        stateNotifier.loadFact();
      },
      expect: () =>
          [RandomFactLoadingState(), const RandomFactErrorState(errorMessage)]);
}
