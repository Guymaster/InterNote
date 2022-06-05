import 'package:flutter/material.dart';
import '../outils/constantes.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:flutter/scheduler.dart';
import '../treatment/initFiles.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SplashPage> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  late RiveAnimationController _loadingController;
  bool get isPlaying => _loadingController.isActive;
  void _togglePlay() => setState(() => _loadingController.isActive = !_loadingController.isActive);
  void _goHome() {
    context.goNamed(RouteName.home);
  }

  @override
  void initState(){
    super.initState();
    //ToDo: Améliorer SplashScreen
    _loadingController = SimpleAnimation("Animation 1");
    WidgetsBinding.instance.addPostFrameCallback((_){ //On commence à verifier les fichiers après le build de la page
        initApp(context).then((value) => print(value));
      }
    );
  }

  @override
  void dispose(){
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: RiveAnimation.asset('assets/rive/loading.riv'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goHome,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}