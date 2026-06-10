import 'dart:developer';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:madani/src/index.dart';
import 'package:madani/src/utils/app_config.dart';

// Conditional import for path_provider (only on non-web platforms)
import 'path_provider_stub.dart' if (dart.library.io) 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (kIsWeb) {
      // For web, use an empty string as storage directory (uses localStorage)
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(''),
      );
    } else {
      // Use file-based storage for mobile platforms
      final tempDir = await getTemporaryDirectory();
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(tempDir.path),
      );
    }
  } catch (e) {
    log('Error initializing HydratedStorage: $e');
    rethrow;
  }
  Bloc.observer = EnhancedBlocObserver();
  
  // Initialize API key for mobile auth middleware
  // Set your API key here or retrieve it from environment/config
  // Example:
  // const apiKey = String.fromEnvironment('API_KEY', defaultValue: '');
  // if (apiKey.isNotEmpty) {
  //   await AppConfig.setApiKey(apiKey);
  // }
  // Or set it manually:
  await AppConfig.setApiKey('nLn0lp52yckJHvxMQ1C5mEbCv6zrtBTqearecN2YFwE=xYh');
  
  // Set system UI overlay style to avoid fullscreen (only for mobile)
  if (!kIsWeb) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    
    // Disable fullscreen mode
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    
    // Force portrait orientation only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider<InitiativeBloc>(
            create: (context) => InitiativeBloc(),
          ),
          BlocProvider<AccessibilityCubit>(
            lazy: false,
            create: (context) => AccessibilityCubit()
              ..initialDragging(dx: size.width - 48, dy: 50),
              // ..getCountdownTime(), // Removed - API not used
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: MadaniRoutes.splashscreenRoute,
          onGenerateRoute: generatedRoute,
          // Global safe area for edge-to-edge mode: all routes (including new pages) avoid status/navigation bar overlap.
          builder: (context, child) {
            return SafeArea(
              child: child ?? const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
