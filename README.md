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

---

# Connection handling

In Payme, efficient connection handling is a critical aspect of the application's functionality.
We've integrated the [connectivity_plus](https://pub.dev/packages/connectivity_plus) package to
manage network connections seamlessly. To simplify and streamline the connection handling process,
we've developed the `ConnectivityUtils` class, which takes care of implementing all the necessary
functions.

In addition to `ConnectivityUtils`, we've introduced a powerful Cubit implementation
called `ConnectivityCubit`. This Cubit provides default listeners and streams to ensure robust
network connection management. For detailed information, please refer to the associated
documentation file.

Our application seamlessly handles network connection checking and provides real-time status updates
through a combination of these utilities and Cubits. Additionally, we've implemented automatic
notification displays within the application through a general listener widget. This widget also
encompasses various features related to embedded authentication and more.

It's important to note that any method that could potentially trigger a network call, whether it's
executed immediately or in future steps, should be wrapped within the `networkCall` top-level
method. This approach is similar to Flutter's `setState`. Here's an example of how to use it:

```dart
await networkCall
(
() async {
// Your method logic here.
})
```

By following these practices, you can ensure that network calls are handled efficiently and
gracefully throughout the Payme application.

# Notifications

In Payme, our notification system is designed for end-to-end functionality, utilizing Firebase
Notifications to seamlessly deliver notifications to our users. The implementation involves several
components working in harmony:

**1. Notification Handling:** Notifications are intercepted and processed in
the `notification_handler.dart` file. This is where the initial notification data is received and
prepared for further action.

**2. Local Notification Service:** The actual display of notifications on the user's device is
managed by the `local_notification_service.dart`. This service ensures that notifications are
presented to users in a user-friendly manner.

**3. Navigation Control:** To direct users to the appropriate destination when they interact with
notifications, we utilize the `notification_router.dart`. This router handles the routing logic
based on the content of the notification.

**4. User Authentication Status:** We maintain a simple variable, `LocalAuthUtils.hasPassedScreen`,
to determine if the user is currently on the local authentication (passcode) screen or elsewhere
within the application. This status helps us tailor the notification handling process.

When a new notification arrives, it undergoes the following process:

- The notification is captured and processed in `notification_handler.dart`.
- It is then presented on the user's device using the `local_notification_service.dart`.
- Navigation control is handled by `notification_router.dart` in conjunction
  with `notification_router_cubit.dart`.

After completing this entire process, the notification data is relayed to the general
listener's `NotificationRouterCubit` listener. Here, we perform a crucial check:

- If the user is already on the local authentication (passcode) screen, we interrupt the process. In
  this case, the `LocalAuthScreen` is responsible for managing the user's interaction with the
  notification. For instance, if the user enters the correct passcode, the app automatically
  navigates to the relevant notification screen.

- If the user is not on the local authentication screen, we open the notification page while
  embedding local authentication functionality. This ensures a seamless user experience when
  transitioning from the notification to any related actions within the app.

By implementing this comprehensive notification system, we aim to provide users with a smooth and
intuitive experience when interacting with notifications in Payme.

# Authentication

Authentication is a complex yet efficient process within our application, even though we don't have
traditional login and signup pages. Instead, we've designed a streamlined authentication flow that
involves two screens and two state managers:

1. **Enter Number Screen**: This screen is managed by the `enter_number_cubit` and is responsible
   for capturing the user's phone number and selecting the appropriate country code. Once the user
   provides these details, the OTP code cubit is triggered, and a request for OTP (One-Time
   Password) is initiated.

2. **Enter OTP Code Screen**: In this screen, managed by the `otp_code_cubit`, users enter the OTP
   code they receive. This code is then used to complete the authentication process.

The central element in this authentication flow is the `OTPState`, which has been intricately
designed to accommodate various data structures using Maps.

The primary components of the `OTPState` include:

```dart
Map<AuthType, Map<OtpSendMethod, X?>>
```

This structure involves a nested mapping that associates an `AuthType` with a Map of `OtpSendMethod`
to `[X]`. This arrangement allows us to handle different authentication methods efficiently and
adapt to various scenarios seamlessly.

While this approach may seem complex, it's crucial for ensuring that our authentication process
functions flawlessly across different use cases. By maintaining a single `OTPState` and a
unified `OtpCodeScreen`, we can effectively manage and authenticate users without the need for
separate login and signup pages.

```dart
Map<AuthType, Map<OtpSendMethod, X?>>
```

This structure involves a nested mapping that associates an `AuthType` with a Map of `OtpSendMethod`
to `[X]`. This arrangement allows us to handle different authentication methods efficiently and
adapt to various scenarios seamlessly.

While this approach may seem complex, it's crucial for ensuring that our authentication process
functions flawlessly across different use cases. By maintaining a single `OTPState` and a
unified `OtpCodeScreen`, we can effectively manage and authenticate users without the need for
separate login and signup pages.

# Local & Embedded Authentication

In Payme, local authentication stands as a pivotal component of our application's security
framework. We prioritize user security by mandating the setup of a passcode and biometrics during
both the login and signup processes. Subsequently, each time the app is launched, users are required
to authenticate themselves through the local authentication screen.

The passcode set by the user undergoes rigorous security measures, employing advanced hashing
techniques. We achieve this level of security with the assistance of the [FlutterSecureStorage]
library, a wrapper for shared preferences that incorporates hashing mechanisms.

## Local Authentication

Local authentication serves as the primary gateway to the application. It handles the initial
authentication process, encompassing passcode entry and biometric authentication (if configured). If
there is a pending notification in the notification router state, the user will be directed to the
appropriate notification screen following a successful passcode entry.

This screen also integrates device trust functionality, a fundamental element of both the initial
and embedded authentication processes. When users enter their passcode, the app checks if the
current device is trusted. If it is, users are swiftly directed to either the appropriate
notification screen or the home screen. However, if the device is not marked as trusted, the app
will repeatedly prompt users to establish trust. Failure to mark the device as trusted will result
in the issuance of a one-time password (OTP) code each time a passcode is entered or any embedded
authentication functionality is executed.

## Embedded Authentication

Embedded authentication simplifies the integration of the local authentication screen and allows its
use as a screen blocker in various parts of the application. This feature inherits all
functionalities from [LocalAuthScreen], utilizing the same state managers—[LocalAuthCubit]
and [LocalAuthState].

To facilitate easy integration, we provide a shortcut method to open [EmbeddedAuth] as
a [MaterialPageRoute]. If passcode protection is enabled, users will be prompted to enter their
passcode; if not, the app will directly request biometric authentication. Here's how to use it:

```dart
EmbeddedAuth.request
(
context, then: () {
//  Perform desired actions ...
});
```

By seamlessly integrating local and embedded authentication throughout our application, we ensure
robust security and a user-friendly experience.
