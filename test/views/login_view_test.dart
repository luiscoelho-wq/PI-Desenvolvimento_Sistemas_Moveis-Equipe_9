import 'package:flutter_test/flutter_test.dart';
import 'package:pi2/views/login_view.dart';
import '../helpers/testable_widget.dart';
import '../mocks/fake_auth_service.dart';

void main() {
  testWidgets('Login carregado', (tester) async {
    final auth = FakeAuthService();

    await tester.pumpWidget(
      makeTestableWidget(
        authService: auth,
        child: LoginView(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Entrar'), findsOneWidget);
  });
}