
import 'package:flutter/material.dart';
import 'package:u_swarp/src/common_widgets/custom_text_field.dart';
import 'package:u_swarp/src/common_widgets/primary_button.dart';
import 'package:u_swarp/src/constants/app_colors.dart';
import 'package:u_swarp/src/constants/app_text_styles.dart';
import 'package:u_swarp/src/routing/app_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Añadimos un AppBar para tener un botón de "atrás" automático.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: AppColors.textPrimary,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          // Usamos 'padding' solo en la parte inferior para que el contenido
          // se alinee bien con el AppBar.
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Título de la pantalla
                Text(
                  'Crear Nueva Cuenta',
                  style: AppTextStyles.screenTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // 2. Formulario de Registro
                const CustomTextField(label: 'Nombre y Apellido'),
                const SizedBox(height: 16),
                const CustomTextField(label: 'Email'),
                const SizedBox(height: 16),
                const CustomTextField(label: 'Password', isPassword: true),
                const SizedBox(height: 16),
                const CustomTextField(label: 'Repeat Password', isPassword: true),
                const SizedBox(height: 32),

                // 3. Botón de Registrarse
                PrimaryButton(
                  text: 'Registrarse',
                  onPressed: () {
                    // Lógica de registro iría aquí.
                    // Después de un registro exitoso, el usuario debe ir al cuestionario.
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login, // Siguiente paso: el cuestionario
                      (route) => false, // Elimina el stack de autenticación
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 4. Link para iniciar sesión
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya Estás Registrado? ',
                      style: AppTextStyles.body.copyWith(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        // Simplemente volvemos a la pantalla anterior (login)
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Inicia sesión aquí',
                        style: AppTextStyles.textLink,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}