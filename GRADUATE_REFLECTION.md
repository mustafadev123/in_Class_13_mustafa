# In-Class Activity 13: Graduate Reflection

## My project

I built a Flutter app that uses Firebase Authentication for email and
password accounts. My app lets a person register, sign in, see a protected
profile, update a password, and sign out.

I kept the Firebase work in one service instead of placing it directly in
each screen. This made the screens easier to read and gave me one place to
translate Firebase errors into messages that a user can understand.

## My original design claim

My original claim was that the app should use the current authentication
state to decide which screen a person can see. A signed-out person should see
the sign-in or registration form. A signed-in person should see the profile.
The profile should display the email belonging to the current account.

I also decided that the app should not store passwords in the app's regular
data. The authentication service should handle account credentials.

This design appears in [main.dart](lib/main.dart), where the app listens to
`authStateChanges()`. It shows [AuthScreen](lib/screens/auth_screen.dart) when
there is no signed-in user and [ProfileScreen](lib/screens/profile_screen.dart)
when a user is signed in.

## My main risk

My main risk was assuming that hiding the profile screen would be enough to
protect all user data. I changed my thinking during this project. The app
screen controls what the person can see in the Flutter interface, but the
Firebase project must also protect any stored data. This project does not add
Firestore records, so my implementation currently demonstrates protected
screen access rather than a complete protected data collection.

Another risk was making the error messages too technical. I handled this in
[auth_service.dart](lib/services/auth_service.dart) by converting common
Firebase error codes into short messages such as “The email or password is
incorrect” and “For security, sign in again before changing your password.”

## My three-case test plan

| Test case | Expected result | Result |
|---|---|---|
| Register with a new email and a valid password | The account is created and the profile appears | Passed |
| Submit an empty email or a password shorter than six characters | The form shows a clear validation message and does not send the request | Passed |
| Sign out and sign in again with the same account | The profile appears again with the account email | Passed |

I also tested the password update action. The first attempt exposed a Flutter
dialog lifecycle problem. I fixed that problem by giving the password dialog
ownership of its own text controller in
[profile_screen.dart](lib/screens/profile_screen.dart). After that fix, the
project analysis and automated tests passed.

## AI comparison



The AI suggestion that improved my plan was to test more than successful
registration. It encouraged me to test invalid input, sign-out, signing in
again, password updates, and reopening the app while a session exists. This
made my test plan more realistic.



Another important discovery came from my own test evidence. The first
password update attempt produced Flutter errors about `_dependents.isEmpty`
and a dirty widget being built in the wrong build scope. I traced this to the
dialog controller being disposed by the parent while the dialog was still
closing. I changed the design so `_PasswordUpdateDialog` creates and disposes
its own controller. This was a better decision than treating the error as a
Firebase failure.

## Evidence from my repository

The repository contains:

- Firebase initialization in [main.dart](lib/main.dart).
- Centralized registration, sign-in, sign-out, and password update operations
  in [auth_service.dart](lib/services/auth_service.dart).
- Email and password validation in
  [input_validators.dart](lib/services/input_validators.dart).
- Signed-out and signed-in screens in
  [auth_screen.dart](lib/screens/auth_screen.dart) and
  [profile_screen.dart](lib/screens/profile_screen.dart).
- Automated validation tests in [auth_test.dart](test/auth_test.dart).
- Setup and behavior notes in [README.md](README.md).
- Screenshot evidence in the [public folder](public/), including the Firebase
  Authentication users screenshot.

I ran `flutter analyze` and `flutter test`. Both completed successfully after
the password dialog fix. I also built a debug Android APK during development.

## Final design decision

I kept the service-based design because it separates Firebase operations from
the visual screens. I kept auth-state routing because it updates the interface
when registration, sign-in, or sign-out changes the current user.

I kept form validation before the Firebase call because it gives immediate
feedback and avoids unnecessary requests. I also kept loading indicators
because a person should not be able to submit the same authentication action
repeatedly while it is still running.

For password changes, I kept the recent-login error message rather than hiding
it. The message explains the next step without showing raw Firebase error
details.

## Submission evidence checklist

I will include these screenshots with my final reflection:

1. Firebase Authentication users screen.
2. Email/password sign-in form.
3. Invalid email or short-password validation.
4. Successful profile screen showing the signed-in email.
5. Password update dialog and success message.
6. Signed-out screen after pressing Sign out.
7. Profile screen after signing in again.
8. Profile screen after reopening the app with an existing session.

.

## What I learned

I learned that authentication is not just a sign-in button. The app must
respond to the current user, handle loading and failure states, and recover
from actions that require a recent sign-in. I also learned that a problem
seen while changing a password may come from the Flutter widget lifecycle
rather than from Firebase itself.

The final implementation is small, but it gives me a clear structure for
adding protected user data later. If I add that data, I will need to add and
test database rules separately instead of assuming that the Flutter screens
provide complete protection.
