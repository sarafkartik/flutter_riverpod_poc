# riverpod_init

A simple flutter application demonstrating the use of [Riverpod](https://docs-v2.riverpod.dev/) for state management.
## Riverpod 
Riverpod (anagram of Provider) is a reactive caching framework for Flutter/Dart. It can automatically fetch, cache, combine and recompute network requests, while also taking care of errors.
Riverpod has multiple types fo providers that can be used. This project leverages the use of State Notifier Provider.

## State Notifer Provider 
This application uses [State Notifier Provider](https://docs-v2.riverpod.dev/docs/providers/state_notifier_provider) for providing State Notifier which notifies if there is a change in state.
It is typically used for:
1. exposing an immutable state which can change over time after reacting to custom events.
2. centralizing the logic for modifying some state (aka "business logic") in a single place, improving maintainability over time.

## Architecture Diagram
[The application architecture is depicted below]
![arch_diagram](https://user-images.githubusercontent.com/79578417/215424823-aaa9916d-91f3-42dc-b993-1d81ed498d90.png)
