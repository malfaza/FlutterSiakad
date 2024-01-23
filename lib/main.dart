import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/khs/khs_bloc.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'pages/auth/auth_page.dart';
import 'pages/mahasiswa/mahasiswa_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KhsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: BlocProvider(
        //   create: (context) => LoginBloc(),
        //   child: const SplashPage(),
        // ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              return BlocProvider(
                create: (context) => KhsBloc(),
                child: const MahasiswaPage(),
              );
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
