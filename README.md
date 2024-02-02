# Zen Flutter

Created by [Zencode.io](https://zencode.io/) 🤖

---

## Getting Started 🚀

After cloning the project you need to do the following:

- Rename package and bundle name using `change_app_package_name`
- Rename the project name from `pubspec.yaml`

> in **Android studio**, go to ***lib***, right click and choose ***Replace in Files***, then
> replace ***zen_flutter*** with ***your_project_name***


When you initially clone the repository, you'll notice that all the generated files are included in
the repository. This is because our DevOps build system doesn't automatically generate these files
each time.

So, there's no need to generate all the files right away. However, when you add a new freezed file
or an isar-collection file, please run the following command to generate the necessary files:

```sh
$ dart run build_runner watch --delete-conflicting-outputs
```

### Project Flavors

This project supports three flavors:

- Development
- Staging
- Production

To run your desired flavor, you can either use the launch configuration in VSCode/Android Studio or
execute the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows
the [official internationalization guide for Flutter][internationalization_link].

### Adding Supported Locales

For each supported locale, please add a new ARB file in `lib/l10n/arb` as shown below:

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_ka.arb
```

### Adding Strings

To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb` and follow
these steps:

```arb
{
    "counterAppBarTitle": "Counter",
}
```

Next, add a new key/value and description:

```arb
{
    "counterAppBarTitle": "Counter",
    ...
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

You can use the new string in your code like this:

```dart
import 'package:payme/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  return Text(context.l10n.helloWorld);
}
```

Don't forget to update the `CFBundleLocalizations` array in the `Info.plist` file
at `ios/Runner/Info.plist` to include the new locale:

```xml
    ...

<key>CFBundleLocalizations</key>    <array>
<string>en</string>
<string>es</string>
</array>

    ...
```

---

## Before Starting a New Feature

We use the Bloc library for state management, Dio as the main HTTP client, and a variety of custom
libraries for other functionalities.

Before you start working on a new feature, it's essential to understand the style and structure we
follow:

The repository itself adheres to a future-based foldering structure. When you need to add a new
feature, navigate to `payme/lib/features` and create a new folder for your feature. For
example: `payme/lib/features/trusted_devices`.

Let's assume your feature requires a backend integration. This would entail top-level repository
interfaces, top-level repositories, a remote service, a local service, custom state implementations,
and pages.

The project structure for your feature would look something like this:

```
- trusted_devices
  - cubit/         # State implementations
  - data/
    - collections/ # Isar model representations
    - dtos/        # Data transfer model representations
    - sources/     # Top-level repository implementations
  - domain/        # Interface repository implementations and entities
    - entities/    # All default data model representations
  - view/          # User interface-related widget/screen implementations
    - widgets/     # User interface-related widget implementations
```

This structure helps maintain a clean and organized codebase as your feature evolves.

To get started, follow these steps:

1. Begin by implementing default data models.
2. Next, implement data transfer models and isar collection models.
3. Ensure you include freezed in all models.

Let's start by creating a Session model:

```dart
part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const Session._();

  const factory Session({required String title, required String date}) = _Session;
}
```

Then create a DTO:

```dart
part 'session_dto.freezed.dart';

part 'session_dto.g.dart';

@freezed
class SessionDto with _$SessionDto {
  const SessionDto._();

  const factory SessionDto({required String title, required String date}) = _SessionDto;

  Session toDomain() => Session(title: title, date: date);

  SessionCollection toCollection() => SessionCollection(title: title, date: date);

  factory SessionDto.fromDomain(Session _) => SessionDto(title: _.title, date: _.date);

  factory SessionDto.fromJson(Map<String, dynamic> json) => _$SessionDtoFromJson(json);
}
```

Finally, create the isar collection data model:

```dart
part 'session_collection.g.dart';

@collection
class SessionCollection {
  Id id = Isar.autoIncrement;

  final String title;
  final String date;

  SessionCollection({required this.title, required this.date});

  SessionDto toDomain() => SessionDto(title: title, date: date);

  factory SessionCollection.fromDomain(SessionDto _) {
    return SessionCollection(title: _.title, date: _.date);
  }
}
```

After initializing the data models, then create the interface repository:

```dart
abstract class ISessionsRepository {
  Future<Either<PaymeFailure, List<SessionDto>>> getSessions();
}
```

Then, you need to write your local and remote services. If your feature doesn't require super
customized implementation, you can use `RemoteService<YourDto>` and `LocalService<IsarCollection>`.
To use `RemoteService` and `LocalService` with this simplified variant, register
your `RemoteService<YourDto>` in the `remote_services_di.dart` file like this:

```dart
..registerSingleton
(
RemoteService
<
SessionDto
>
(
)
);
```

and retrieve it like this:

```dart

final remote = i.get<RemoteService<SessionDto>>();
```

Do the same for local services by registering your `LocalService<IsarCollection>` in
the `local_services_di.dart`:

```dart
..registerSingleton
(
LocalServices
<
SessionCollection
>
(
)
);
```

and access it like this:

```dart

final local = i.get<LocalServices<SessionCollection>>();
```

After completing the implementation of data models, repositories, and services, you need to write
your state. Inside the `trusted_devices/cubit` folder, create two files: `sessions_state.dart`
and `sessions_cubit.dart`.

Your `sessions_state.dart` should look like this:

```dart
part 'sessions_state.freezed.dart';

@freezed
class SessionsState with _$SessionsState {
  const SessionsState._();

  const factory SessionsState({
    @Default(StateStatus.none) StateStatus status,
    List<Session>? sessions,
    Payme

    Failure? failure,
  }) = _SessionState;
}
```

This state is created using the freezed library and has two default fields: `StateStatus`
and `PaymeFailure`, along with one specific to the feature, which is `List<Session>`.

The `StateStatus` field represents the current state status of the `getSessions` operation. If your
feature includes more states than just fetching and displaying data, consider
using `Map<String, StateStatus>` or creating an enum to indicate which method is currently being
called. You can then check the state dynamically based on this value.

The `PaymeFailure` field is used to capture error information. It can be a `RemoteResponse` or a
similar error object, but it's recommended to avoid using `RemoteResponse` for new features as it
may not be well-suited for error handling.

After implementing the state, create the actual cubit:

```dart
export 'sessions_state.dart';

class SessionsCubit extends Cubit<SessionsState> {
  SessionsCubit() : super(const SessionsState());

  final repo = i.get<ISessionsRepository>();

  Future<void> getSessions() async {
    emit(state.copyWith(status: StateStatus.loading));
    final res = await repo.getSessions();
    res.fold(
          (failure) =>
          emit(state.copyWith(
            status: StateStatus.error,
            failure: failure,
          )),
          (sessions) =>
          emit(state.copyWith(
            status: StateStatus.success,
            sessions: sessions.map((d) => d.toDomain()).toList(),
          )),
    );
  }
}
```

With this, your feature is ready for development. You can create your screens inside
the `trusted_devices/view/` folder and continue development.
