import '../../../data/random_fact.dart';
import 'random_fact_base_state.dart';

class RandomFactInitialState extends RandomFactBaseState {}

class RandomFactLoadingState extends RandomFactBaseState {}

class RandomFactLoadedState extends RandomFactBaseState {
  final RandomFact randomFact;

  const RandomFactLoadedState(this.randomFact);
}

class RandomFactErrorState extends RandomFactBaseState {
  final String error;

  const RandomFactErrorState(this.error);
}
