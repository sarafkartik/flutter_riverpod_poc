import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_init/src/data/random_fact.dart';
import 'package:riverpod_init/src/presentation/state/random_fact/random_fact_base_state.dart';
import 'package:riverpod_init/src/presentation/ui/random_fact/random_fact_provider.dart';

import '../../state/random_fact/random_fact_state.dart';

class RandomFactPage extends ConsumerStatefulWidget {
  const RandomFactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RandomFactScreenState();
}

class _RandomFactScreenState extends ConsumerState<RandomFactPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(randomFactProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Facts'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoadRandomFactWidget(
            state: state,
            onPressed: () => ref.read(randomFactProvider.notifier).loadFact(),
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}

class LoadRandomFactWidget extends StatelessWidget {
  final RandomFactBaseState state;
  final Function()? onPressed;

  const LoadRandomFactWidget({
    Key? key,
    required this.state,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Load random fact'),
        ),
        const SizedBox(height: 25),
        if (state is RandomFactLoadingState)
          const Center(child: CircularProgressIndicator()),
        if (state is RandomFactLoadedState)
          RandomFactCard(
            (state as RandomFactLoadedState).randomFact,
          ),
        if (state is RandomFactErrorState)
          Center(child: Text((state as RandomFactErrorState).error)),
      ],
    );
  }
}

class RandomFactCard extends StatelessWidget {
  final RandomFact randomFact;

  const RandomFactCard(this.randomFact, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: Text(randomFact.text != null ? randomFact.text! : ""),
          ),
        ],
      ),
    );
  }
}