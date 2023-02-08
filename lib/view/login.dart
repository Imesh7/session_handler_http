import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_handling_http/controller/login_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(hintText: "Username"),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
                controller: controller.passwordController,
                decoration: const InputDecoration(hintText: "Password")),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.login(context);
                },
                child: const Text("Login")),
            const SizedBox(
              height: 50,
            ),
            controller.isLoading == true
                ? const CircularProgressIndicator()
                : Container(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
