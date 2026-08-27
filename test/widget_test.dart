import 'package:dubaione/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DubaiOne home screen loads', (tester) async {
    await tester.pumpWidget(const DubaiOneApp());
    expect(find.text('DUBAIONE'), findsOneWidget);
    expect(find.text('Our Services'), findsOneWidget);
    expect(find.text('Golden Visa'), findsOneWidget);
  });
}
