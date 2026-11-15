---
name: rules-packages
description: The permanent package stack — core baseline dependencies every new Flutter project starts with, in-house git packages, dev dependencies, feature add-ons, and libraries banned from new projects
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

## 3. dev_dependencies Baseline

`flutter_lints`, `build_runner`, `freezed`, `json_serializable`, `injectable_generator`, `retrofit_generator`, `flutter_launcher_icons`, `flutter_native_splash`, `flutter_arb_translator`, `package_rename`. وللاختبار: `flutter_test`, `bloc_test`, `mocktail`.

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.13
  freezed: ^3.1.0
  json_serializable: ^6.9.0
  injectable_generator: ^3.0.0
  retrofit_generator: ^10.0.0
  flutter_launcher_icons: ^0.14.4
  flutter_native_splash: ^2.4.6
  flutter_arb_translator: ^1.1.0
  package_rename: ^1.8.0
```

## 4. Feature Add-Ons (تُضاف عند الحاجة فقط)

- **Video/Audio:** `video_player`, `chewie`, `cached_video_player_plus`, `just_audio`, `file_picker`, `image_cropper`.
- **PDF:** `pdf`, `printing`, `syncfusion_flutter_pdfviewer`.
- **Maps/Location:** `geolocator`, `flutter_map`, `latlong2`, `geocoding`, `permission_handler`.
- **Pickers/Formatters:** `country_picker`, `country_code_picker`, `syncfusion_flutter_datepicker`, `currency_text_input_formatter`, `intl`, `timeago`.
- **Realtime/Background:** `pusher_channels_flutter`, `flutter_local_notifications`, `workmanager`, `connectivity_plus`, `badges`, `event_bus`.
- **Arabic support:** `hijri`, `hijri_date`, `number_words_reader`, `to_arabic_number`, `bidi`.
- **Utilities:** `share_plus`, `package_info_plus`, `archive`, `visibility_detector`, `isolate_manager`, `easy_debounce`, `flutter_otp_kit`, `rxdart` (للاتجاهات المتعددة فقط).

## 5. ممنوع في المشاريع الجديدة (Legacy)

| ممنوع | البديل المعتمد |
| --- | --- |
| `dartz` / `Either` | `ExecuteGuard<T>` من `error_handler` |
| `get` (GetX) | `flutter_bloc` + `get_it` |
| `provider` | `flutter_bloc` |
| `vexana` | `dio` + `retrofit` |
| `fluttertoast` | `delightful_toast` / feedback من الـ Theme |
| `shimmer` , `flutter_skeleton_ui` | `skeletonizer` |
| `get_storage` | `shared_preferences` + `flutter_secure_storage` |
| `flutter_quick_router` | `go_router` |
| `flutter_gen_runner` | assets مباشرة عبر `flutter_svg` / `Image.asset` |
| `http` | `dio` |

المشاريع القديمة لا تُعاد كتابتها، لكن لا تُضاف هذه الحزم إلى أي مشروع جديد.

## 6. قواعد الالتزام

- **مصدر واحد لكل وظيفة:** لا مكتبة HTTP ثانية، لا DI ثانية، لا Router ثاني، لا State Management ثاني.
- **الإصدارات:** caret `^` دائماً، ونفس إصدارات الجدول أعلاه حتى يوجد سبب مكتوب للترقية.
- **الأسماء في `pubspec.yaml`:** أبجدي داخل قسم `dependencies`، و`sdk: flutter` أولاً.
- `publish_to: "none"` و`environment` بنفس صيغة القالب المعتمد.
- عند إضافة حزمة جديدة لم تكن في هذا الملف، أضفها هنا في نفس الـ commit.

```yaml
name: <project_name>
description: <project_name>
publish_to: "none"
environment:
  sdk: ^3.13.5
  flutter: 3.47.7
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  # ... بقية حزم القسم 1
```
