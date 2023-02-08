import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_handling_http/controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("Home View"),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  controller.getHomeData(context: context);
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Refresh")),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
