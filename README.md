# Firebase Auth Lab

Flutter implementation for In-Class Activity 13. The app uses Firebase
Authentication for registration, sign-in, sign-out, profile access, and
password updates.

## Firebase setup

1. Create or open a Firebase project.
2. Enable **Authentication > Sign-in method > Email/Password**.
3. Install the FlutterFire CLI:

   ```powershell
   dart pub global activate flutterfire_cli
   ```

4. From this project directory, connect the app to your Firebase project:

   ```powershell
   flutterfire configure
   ```

   Select Android and web. This replaces the placeholder values in
   `lib/firebase_options.dart` with project-specific configuration.
5. Run the app:

   ```powershell
   flutter run
   ```
