import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/use_case/login_usecase.dart';
import 'package:moviehub/feature/auth/presentation/view/login_view.dart';
import 'package:moviehub/feature/auth/presentation/view_model/login/login_view_model.dart';

import '../../../../core.dart';

class MockLoginViewModel extends MockBloc<LoginEvent, LoginState> implements LoginViewModel {}

class MockLoginUsecase extends Mock implements LoginUsecase {}

class FakeLoginEntity extends Fake implements LoginEntity {}

class FakeLoginRequested extends Fake implements LoginRequested {}

void main() {
  late MockLoginViewModel mockLoginViewModel;
  late MockLoginUsecase mockLoginUsecase;

  setUpAll(() {
    registerFallbackValue(FakeLoginEntity());
    registerFallbackValue(FakeLoginRequested());
  });

  setUp(() {
    mockLoginViewModel = MockLoginViewModel();
    mockLoginUsecase = MockLoginUsecase();

    when(() => mockLoginViewModel.state).thenReturn(LoginInitial());
    when(() => mockLoginViewModel.stream).thenAnswer((_) => const Stream<LoginState>.empty());
    when(() => mockLoginViewModel.close()).thenAnswer((_) async {});
    when(() => mockLoginViewModel.add(any())).thenReturn(null);

    if (GetIt.instance.isRegistered<LoginViewModel>()) {
      GetIt.instance.unregister<LoginViewModel>();
    }
    if (GetIt.instance.isRegistered<LoginUsecase>()) {
      GetIt.instance.unregister<LoginUsecase>();
    }

    GetIt.instance.registerFactory<LoginUsecase>(() => mockLoginUsecase);
    GetIt.instance.registerFactory<LoginViewModel>(() => mockLoginViewModel);
  });

  tearDown(() {
    if (GetIt.instance.isRegistered<LoginViewModel>()) {
      GetIt.instance.unregister<LoginViewModel>();
    }
    if (GetIt.instance.isRegistered<LoginUsecase>()) {
      GetIt.instance.unregister<LoginUsecase>();
    }
  });

  Widget createWidgetUnderTest() {
    return getMaterialWidgetForTesting(LoginView());
  }

  group('LoginView Widget Tests', () {
    testWidgets('should show login button', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.widgetWithText(TextButton, 'Login'), findsOneWidget);
    });

    testWidgets('should show email and password text fields', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('should show both email and password fields with entered values', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;
      const testEmail = 'user@gmail.com';
      const testPassword = 'testuser';

      await tester.enterText(emailField, testEmail);
      await tester.enterText(passwordField, testPassword);
      await tester.pump();

      expect(find.text(testEmail), findsOneWidget);
      expect(find.text(testPassword), findsOneWidget);
    });

    testWidgets('should show "Create an account?" link', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Create an account?'), findsOneWidget);
    });
  });
}
