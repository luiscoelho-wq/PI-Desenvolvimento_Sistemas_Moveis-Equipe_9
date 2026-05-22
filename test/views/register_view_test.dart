import 'package:flutter_test/flutter_test.dart';
import 'package:pi2/views/register_view.dart';
import '../helpers/testable_widget.dart';
import '../mocks/fake_auth_service.dart';

void main() {
  testWidgets('Register carregado', (tester) async {
    final auth = FakeAuthService();

    await tester.pumpWidget(
      makeTestableWidget(
        authService: auth,
        child: RegisterView(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Registrar'), findsOneWidget);
  });
}