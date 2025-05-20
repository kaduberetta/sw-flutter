import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sw_flutter_carlos/core/config/status_notifier.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
import 'package:sw_flutter_carlos/core/widgets/default_snack_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/default_text_field.dart';
import 'package:sw_flutter_carlos/core/widgets/widgets.dart';
import 'package:sw_flutter_carlos/features/auth/viewmodel/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => LoginProvider(), child: _LoginPageContent());
  }
}

class _LoginPageContent extends StatefulWidget {
  @override
  State<_LoginPageContent> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<_LoginPageContent> {
  ProviderStatus? _previousStatus;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        if (_previousStatus != provider.status) {
          if (provider.hasError && provider.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(DefaultSnackBar.error(message: provider.errorMessage!));
            });
          }
          _previousStatus = provider.status;
        }
        return Scaffold(
          backgroundColor: ColorPalette.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.x2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/swfast-logo.png'),
                  const SizedBox(height: Spacing.x8),
                  DefaultTextField(
                    hintText: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    onChanged: provider.setEmail,
                  ),
                  const SizedBox(height: Spacing.x2),
                  DefaultTextField(
                    hintText: 'Senha',
                    obscureText: provider.obscurePassword,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        provider.obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: provider.toggleObscurePassword,
                    ),
                    onChanged: provider.setPassword,
                  ),
                  const SizedBox(height: Spacing.x2),
                  PrimaryButton(
                    label: 'Entrar',
                    isLoading: provider.isLoading,
                    // onPressed: provider.login,
                    onPressed: () => context.pushReplacement(RouteConstants.listOrders),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
