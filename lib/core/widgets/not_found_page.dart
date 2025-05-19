import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/text_style.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.redAccent),
            const SizedBox(height: 24),
            Text('404', style: AppTextStyle.titleLarge()),
            const SizedBox(height: 12),
            Text('Sorry, the page you are looking for does not exist.', textAlign: TextAlign.center, style: AppTextStyle.bodyMedium()),
          ],
        ),
      ),
    );
  }
}
