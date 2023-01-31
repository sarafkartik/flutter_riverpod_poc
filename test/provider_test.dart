import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class Tyre {}

class YamahaTyre extends Tyre {}

class ApolloTyre extends Tyre {}

class Car1 {
  final tyre = ApolloTyre();

  void makeCar() {
    put(tyre);
  }

  void put(ApolloTyre tyre) {
    print("Attaching tyre of type ${tyre.runtimeType}");
  }
}

class Car2 {
  Car2(this.tyre);

  final Tyre tyre;

  void makeCar() {
    put(tyre);
  }

  void put(Tyre tyre) {
    print("Attaching tyre of type ${tyre.runtimeType}");
  }
}

abstract class MyService {
  String implementMe();
}

class RemoteServiceImpl extends MyService {
  @override
  String implementMe() => "Remote Data";
}

class LocalServiceImpl extends MyService {
  @override
  String implementMe() => "Local Data";
}

class MyServiceRepository {
  final MyService service;

  MyServiceRepository(this.service);

  void callImplementation() {
    print(service.implementMe());
  }
}

final myServiceRepositoryProvider = Provider<MyServiceRepository>(
    (ref) => MyServiceRepository(LocalServiceImpl()));

class SampleWidget extends StatelessWidget {
  const SampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: ChildWidget());
  }
}

class ChildWidget extends ConsumerWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(myServiceRepositoryProvider).callImplementation();
    return MaterialApp(
        home: Column(
      children: const [Text("Hello")],
    ));
  }
}

void main() {

  testWidgets("Seeing providers in action", (tester) async {
    Car1().makeCar();
    Car2(YamahaTyre()).makeCar();
    await tester.pumpWidget(const ProviderScope(child: SampleWidget()));
    expect(find.text("Hello"), findsOneWidget);
  });
}
