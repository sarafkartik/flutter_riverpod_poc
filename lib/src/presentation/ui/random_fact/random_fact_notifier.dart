import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/random_fact_repository.dart';
import '../../state/random_fact/random_fact_base_state.dart';
import '../../state/random_fact/random_fact_state.dart';

class RandomFactNotifier extends StateNotifier<RandomFactBaseState> {
  final RandomFactRepository _randomFactRepository;

  RandomFactNotifier(this._randomFactRepository)
      : super(RandomFactInitialState());

  void loadFact() async {
    state = RandomFactLoadingState();
    final receivedData = await _randomFactRepository.getRandomFact();
    state = receivedData.success
        ? RandomFactLoadedState(receivedData.data!)
        : RandomFactErrorState(receivedData.error!);
  }
}
