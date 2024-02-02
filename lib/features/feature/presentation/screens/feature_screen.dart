import 'package:flutter/material.dart';
import 'package:zen_flutter/l10n/l10n.dart';

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.feature),
      ),
    );
  }
}
