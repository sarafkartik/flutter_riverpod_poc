# riverpod_init

A simple flutter application demonstrating the use of [Riverpod](https://docs-v2.riverpod.dev/) for state management.
## Riverpod 
Riverpod (anagram of Provider) is a reactive caching framework for Flutter/Dart. It can automatically fetch, cache, combine and recompute network requests, while also taking care of errors.
Riverpod has multiple types fo providers that can be used. This application leverages the use of State Notifier Provider.

## State Notifer Provider 
This application uses [State Notifier Provider](https://docs-v2.riverpod.dev/docs/providers/state_notifier_provider) for providing State Notifier which notifies if there is a change in state.
It is typically used for:
1. exposing an immutable state which can change over time after reacting to custom events.
2. centralizing the logic for modifying some state (aka "business logic") in a single place, improving maintainability over time.

## Architecture

![arch_diagram](https://user-images.githubusercontent.com/79578417/215424823-aaa9916d-91f3-42dc-b993-1d81ed498d90.png)

The State Notifer exposes an immutable state which can provided to the widget using a State Notifier Provider. The service class supplies the date for the state which is fetched from some data source (cache/remote). StateNotifierProvider along with StateNotifier is Riverpod’s recommended solution for managing state which may change in reaction to a user interaction.

## Testing 

This apploication utilises [Mockito](https://pub.dev/packages/mockito), along with [Build Runner](https://pub.dev/packages/build_runner) for generating mocks and stubs.
It also uses [State Notifer Test](https://pub.dev/packages/state_notifier_test) for testing State Notifer.

