# Architecture & Feature Conventions

## Feature Architecture
When creating new features, always follow the Clean Architecture directory structure:
- [`lib/features/<feature_name>/data/`](lib/features/posts/data/) - Data layer (models, data sources, repository implementations)
- [`lib/features/<feature_name>/domain/`](lib/features/posts/domain/) - Domain layer (entities, repository interfaces, use cases)
- [`lib/features/<feature_name>/present/`](lib/features/posts/present/) - Presentation layer (state management/controllers/bloc/cubit)
- [`lib/features/<feature_name>/present/views/`](lib/features/suggestions/present/views) - View files location (screens, UI widgets, and views)

## Firebase & Backend Services
- When a feature requires Firebase, set up Remote DataSources, models, and repositories within `lib/features/<feature_name>/data/datasources/` or utilize shared Firebase services under [`lib/core/`](lib/core/).

## General Code Standards
- Write clean, modular, and well-tested code.
- Follow SOLID principles.
- Maintain consistent naming conventions across all layers.
- Automatically deduce feature names from high-level task descriptions (e.g., complaints and suggestions -> `complaints_and_suggestions`) and scaffold the full Clean Architecture structure.

## Error Handling & Result Types
- **NEVER** use `Either` (e.g. `Future<Either<Exception, T>>`) for error handling or repository methods (e.g., `Future<Either<Exception, List<FarmEntity>>> getFarms`).
- **ALWAYS** use `Future<ExecuteGuard<T>>` (e.g., `Future<ExecuteGuard<List<FarmEntity>>>`) for capturing errors and handling methods that can fail or succeed.
