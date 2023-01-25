import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_init/src/domain/random_fact_repository.dart';
import 'package:riverpod_init/src/presentation/state/random_fact_base_state.dart';
import 'package:riverpod_init/src/presentation/state/random_fact/random_fact_notifier.dart';

final randomFactProvider = StateNotifierProvider<RandomFactNotifier, RandomFactBaseState>(
  (ref) => RandomFactNotifier(
    RandomFactRepository(),
  ),
);
