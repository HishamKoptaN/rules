---
name: rules-bloc
description: BLoC file structure — explicit freezed/event/state part directives named after the feature, and dispatching events via GetIt instead of BlocProvider.of
metadata:
  type: feedback
---

# BLoC Structure & Dispatching Rules

Related: [[rules]], [[architecture]]

## Part Directives
- In BLoC files, state, event, and freezed parts must be declared explicitly using the naming convention corresponding to the feature name (e.g., for `shops_bloc.dart`):
  ```dart
  part 'shops_bloc.freezed.dart';
  part 'shops_event.dart';
  part 'shops_state.dart';
  ```

## Access & Dispatching
- Instead of `BlocProvider.of<SuggestionsBloc>(context).add(...)` (or `BlocProvider.of<T>(context)`), prefer `getIt<SuggestionsBloc>().add(...)` via the GetIt service locator when appropriate for the given context.