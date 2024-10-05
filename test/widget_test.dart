import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Welcome Page shows login and signup buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the welcome text is displayed.
    expect(find.text('Welcome in Attend UMM'), findsOneWidget);

    // Verify that the login and signup buttons are present.
    expect(find.byKey(const Key('loginButton')), findsOneWidget);
    expect(find.byKey(const Key('signupButton')), findsOneWidget);
  });

  testWidgets('Tapping on login button navigates to Login Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the login button.
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle(); // Wait for the navigation animation to finish.

    // Verify that we are on the Login Page.
    expect(find.text('Login'), findsOneWidget); // Pastikan ada teks Login di Login Page.
  });

  testWidgets('Tapping on signup button navigates to Sign Up Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the signup button.
    await tester.tap(find.byKey(const Key('signupButton')));
    await tester.pumpAndSettle(); // Wait for the navigation animation to finish.

    // Verify that we are on the Sign Up Page.
    expect(find.text('Sign Up'), findsOneWidget); // Pastikan ada teks Sign Up di Sign Up Page.
  });
}
