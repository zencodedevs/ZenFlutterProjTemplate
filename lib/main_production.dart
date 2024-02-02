import 'package:zen_flutter/app/app.dart';
import 'package:zen_flutter/bootstrap.dart';

void main() {
  bootstrap(
    () => const App(),
    enableSentry: true,
    environment: 'production',
  );
}
