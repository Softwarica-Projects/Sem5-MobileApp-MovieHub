import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/auth/domain/use_case/register_usecase.dart';
import 'package:moviehub/feature/auth/presentation/view/signup_view.dart';
import 'package:moviehub/feature/auth/presentation/view_model/signup/signup_view_model.dart';

import '../../../../core.dart';

class MockSignupViewModel extends MockBloc<SignupEvent, SignupState> implements SignupViewModel {}

class MockRegisterUsecase extends Mock implements RegisterUsecase {}

class FakeSignupEntity extends Fake implements SignupEntity {}

class FakeSignupRequested extends Fake implements SignupRequested {}

void main() {
  late MockSignupViewModel mockSignupViewModel;
  late MockRegisterUsecase mockRegisterUsecase;

  setUpAll(() {
    registerFallbackValue(FakeSignupEntity());
    registerFallbackValue(FakeSignupRequested());
  });

  setUp(() {
    mockSignupViewModel = MockSignupViewModel();
    mockRegisterUsecase = MockRegisterUsecase();

    when(() => mockSignupViewModel.state).thenReturn(SignupInitial());
    when(() => mockSignupViewModel.stream).thenAnswer((_) => const Stream<SignupState>.empty());
    when(() => mockSignupViewModel.close()).thenAnswer((_) async {});
    when(() => mockSignupViewModel.add(any())).thenReturn(null);

    if (GetIt.instance.isRegistered<SignupViewModel>()) {
      GetIt.instance.unregister<SignupViewModel>();
    }
    if (GetIt.instance.isRegistered<RegisterUsecase>()) {
      GetIt.instance.unregister<RegisterUsecase>();
    }

    GetIt.instance.registerFactory<RegisterUsecase>(() => mockRegisterUsecase);
    GetIt.instance.registerFactory<SignupViewModel>(() => mockSignupViewModel);
  });

  tearDown(() {
    if (GetIt.instance.isRegistered<SignupViewModel>()) {
      GetIt.instance.unregister<SignupViewModel>();
    }
    if (GetIt.instance.isRegistered<RegisterUsecase>()) {
      GetIt.instance.unregister<RegisterUsecase>();
    }
  });

  Widget createWidgetUnderTest() {
    return getMaterialWidgetForTesting(SignupView());
  }

  group('SignupView Widget Tests', () {
    testWidgets('should show signup button', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.widgetWithText(TextButton, 'Signup'), findsOneWidget);
    });

    testWidgets('should show full name, email and password text fields', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('should return same value when input is entered in full name text field', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final fullNameField = find.byType(TextFormField).first;
      const testName = 'Rishan Shrestha';

      await tester.enterText(fullNameField, testName);
      await tester.pump();

      expect(find.text(testName), findsOneWidget);
    });

    testWidgets('should return same value when input is entered in email text field', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final emailField = find.byType(TextFormField).at(1);
      const testEmail = 'rishan@gmail.com';

      await tester.enterText(emailField, testEmail);
      await tester.pump();

      expect(find.text(testEmail), findsOneWidget);
    });

    testWidgets('should return same value when input is entered in password text field', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final passwordField = find.byType(TextFormField).last;
      const testPassword = 'Rishan@123';

      await tester.enterText(passwordField, testPassword);
      await tester.pump();

      expect(find.text(testPassword), findsOneWidget);
    });

    testWidgets('should show all three fields with entered values', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final fullNameField = find.byType(TextFormField).first;
      final emailField = find.byType(TextFormField).at(1);
      final passwordField = find.byType(TextFormField).last;
      const testName = 'Rishan Shrestha';
      const testEmail = 'rishan@gmail.com';
      const testPassword = 'Rishan@123';

      await tester.enterText(fullNameField, testName);
      await tester.enterText(emailField, testEmail);
      await tester.enterText(passwordField, testPassword);
      await tester.pump();

      expect(find.text(testName), findsOneWidget);
      expect(find.text(testEmail), findsOneWidget);
      expect(find.text(testPassword), findsOneWidget);
    });

    testWidgets('should show "Already have an account?" link', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Already have an account?'), findsOneWidget);
    });

    testWidgets('should show signup page title in app bar', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Signup'), findsNWidgets(2));
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should trigger signup when signup button is pressed with valid data', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final fullNameField = find.byType(TextFormField).first;
      final emailField = find.byType(TextFormField).at(1);
      final passwordField = find.byType(TextFormField).last;

      const testName = 'Rishan Shrestha';
      const testEmail = 'rishan@gmail.com';
      const testPassword = 'Rishan@123';
      await tester.enterText(fullNameField, testName);
      await tester.enterText(emailField, testEmail);
      await tester.enterText(passwordField, testPassword);
      await tester.pump();

      await tester.tap(find.widgetWithText(TextButton, "Signup"));
      await tester.pump();

      verify(() => mockSignupViewModel.add(any())).called(1);
    });
  });
}
