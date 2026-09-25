# Venuze Flutter Assignment

Login and Bookings screens built from the Figma designs. Login uses the Venuze REST API.
The app uses **MVVM** with **GetX** for state management, dependency injection and routing.

## Features
- **Bookings:** header with a notification badge, an empty state and a custom bottom navigation bar. Signed-out users see a *Sign in* button.
- **Login:** email and password fields with validation, an "I'm not a robot" check, loading and error states, and social login buttons.
- **Login API:** sends `POST https://devapi.venuze.com/api/auth/login` as form data. Error messages from the server (for example *Incorrect email or password*) appear on screen.
- **Session:** after login, the tokens and user are saved with `get_storage`, so the user stays signed in after restarting the app. Log out from the Profile tab.
- **Responsive layout:** sizes are in logical pixels from the 375×812 frame. Content is capped at 480 px wide on tablets and in landscape, screens scroll when space is short, safe areas are respected, and text scaling is capped at 1.3×.

Test credentials: `fiju705+premier@gmail.com` / `12345678`

- **Model:** data classes and repositories. The repository returns typed models and turns every failure into an `ApiException`.
- **ViewModel:** a `GetxController` that holds observable state (`isLoading`, `errorMessage`, ...) and the screen logic. It gets its dependencies through its constructor, so it can be tested with fakes.
- **View:** a `GetView<ViewModel>` that only renders state and forwards user actions.

## Run

```bash
flutter pub get
flutter run
flutter test
flutter build apk --release
```
