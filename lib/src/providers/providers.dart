import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_init/src/network/api/service/random_fact_service.dart';

import '../domain/random_fact_repository.dart';
import '../presentation/state/random_fact/random_fact_base_state.dart';
import '../presentation/ui/random_fact/random_fact_notifier.dart';

final randomFactServiceProvider =
    Provider<RandomFactService>((ref) => RandomFactService());

final randomFactRepositoryProvider = Provider(
    (ref) => RandomFactRepository(ref.watch(randomFactServiceProvider)));

final randomFactProvider =
    StateNotifierProvider<RandomFactNotifier, RandomFactBaseState>(
  (ref) => RandomFactNotifier(
    ref.watch(randomFactRepositoryProvider),
  ),
);
