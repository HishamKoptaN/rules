---
name: rules-packages
description: Core baseline dependencies every new Flutter project starts with and in-house git packages with usage rules
metadata:
  type: feedback
---

# Stack Packages & pubspec Baseline

Related: [[architecture]], [[rules-bloc]], [[rules-components]], [[rules-file-structure]]

هذه هي حزم المشروع القياسية، مستخرجة من فحص كل مشاريع `~/coding/flutter projects`. أي مشروع جديد يبدأ بهذه القائمة بدل اختيار حزمة جديدة، ولأي وظيفة موجودة هنا **لا تُضف مكتبة بديلة**.

Baseline: Dart `^3.13.5` / Flutter `3.47.7` (أحدث ما تستخدمه المشاريع).

## 1. Core Baseline (كل مشروع جديد)

| Concern | Package | Version |
| --- | --- | --- |
| State management | `flutter_bloc` | `^9.0.0` |
| Event concurrency | `bloc_concurrency` | `^0.3.0` |
| State persistence | `hydrated_bloc` | `^11.0.0` |
| Form validation | `formz` | `^0.8.0` |
| Equality | `equatable` | `^2.0.8` |
| DI container | `get_it` | `^9.2.0` |
| DI codegen | `injectable` | `^3.0.0` |
| Routing | `go_router` | `^18.0.1` |
| HTTP client | `dio` | `^5.8.0+1` |
| Typed API client | `retrofit` | `^4.9.0` |
| Network logs | `pretty_dio_logger` | `^1.4.0` |
| Logging | `logger` | `^2.6.0` |
| Connectivity | `internet_connection_checker_plus` | `^3.1.1` |
| Models | `freezed_annotation` | `^3.1.0` |
| JSON | `json_annotation` | `^4.9.0` |
| Responsive sizing | `flutter_screenutil` | `^5.9.3` |
| Spacing | `gap` | `^3.0.1` |
| Icons (**no Material Icons**) | `font_awesome_flutter` | `^11.0.0` |
| Vectors | `flutter_svg` | `^2.3.0` |
| Remote images | `cached_network_image` | `^3.4.1` |
| Loading skeletons | `skeletonizer` | `^3.0.0` |
| Tokens / secrets | `flutter_secure_storage` | `^11.0.0` |
| Local flags & prefs | `shared_preferences` | `^2.5.5` |
| Images & files | `image_picker` | `^1.2.2` |
| Deep links & calls | `url_launcher` | `^6.3.0` |
| App paths | `path_provider` | `^2.1.5` |
| Device data | `device_info_plus` | `^13.2.0` |
| Web/native guards | `universal_platform` | `^1.1.0` |
| Firebase core | `firebase_core` | `^4.13.0` |
| Firebase auth | `firebase_auth` | `^6.5.7` |
| Firebase DB | `cloud_firestore` | `^6.0.0` |
| Push notifications | `firebase_messaging` | `^16.0.0` |
| Crash reporting | `firebase_crashlytics` | `^5.0.0` |
| Localization | `flutter_localizations` | `sdk: flutter` |
| Locale names | `flutter_localized_locales` | `^2.0.5` |

## 2. In-House Packages (git dependencies, never `path:`)

| Package | Provides | Use for |
| --- | --- | --- |
| `error_handler` | `ExecuteGuard<T>`, `ErrorInfo`, `ErrorMapper` | كل عملية قد تفشل — **بديل `Either` نهائياً** |
| `form_inputs` | `GenericFormInput`, `EmailFormInput`, `PasswordFormInput`, `PhoneFormNumberInput`, `XFileFormInput`, `DateTimeFormInput` | كل حقول الفورم مع `formz` |
| `translator` | ترجمة نصوص/ARB | مشاريع متعددة اللغات |

```yaml
  error_handler:
    git:
      url: https://github.com/HishamKoptaN/error_handler.git
      ref: main
  form_inputs:
    git:
      url: https://github.com/HishamKoptaN/form_inputs.git
      ref: main
```

- استخدم `ref: main` (أو commit hash مثبت) — لا `ref: branch` مجهولة.
- `ExecuteGuard<T>` هو نوع الإرجاع القياسي، ولا يُستخدم `dartz` / `Either` في كود جديد.
