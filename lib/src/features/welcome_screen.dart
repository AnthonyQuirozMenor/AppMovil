
import 'package:flutter/material.dart';
import 'package:u_swarp/src/common_widgets/app_logo.dart';
import 'package:u_swarp/src/common_widgets/final.dart';
import 'package:u_swarp/src/common_widgets/primary_button.dart';
import 'package:u_swarp/src/constants/app_text_styles.dart';


class WelcomeScreen extends StatelessWidget {
const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text('¡BIENVENIDO!', style: AppTextStyles.screenTitle, textAlign: TextAlign.center),
              const SizedBox(height: 32),
              const AppLogo(size: 150),
              const SizedBox(height: 16),
              Text('TE ESPERA UNA GRAN OFERTA', style: AppTextStyles.brandName, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Text(
                'Descubre nuestros servicios VIP.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const Final(size: 150),

              
              const Spacer(),
              PrimaryButton(
                text: 'Iniciar Sesión',
                onPressed: () {
                  // Aquí iría la navegación a la pantalla de Login basica
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                 //navegacion robusta
                 // Navigator.pushNamed(context, AppRoutes.login);
                },
              ),
               const SizedBox(height: 5),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿No tienes una cuenta?', 
                  style: AppTextStyles.body.copyWith(fontSize: 14)),
                  TextButton(
                    onPressed: () {
                      // Aquí iría la navegación a la pantalla de Registro
                    },
                    child: Text('Regístrate', style: AppTextStyles.body.copyWith(color: Colors.blue)),
                  ),
                ],
               ),



              const SizedBox(height: 20),

              Text(
                'I need Help, pliss.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),



            ],
          ),
        ),
      ),
    );
  }
}