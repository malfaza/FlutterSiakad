import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';
import '../../../common/components/buttons.dart';
import '../../../common/components/custom_text_field.dart';
import '../../../common/constants/colors.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../../data/models/request/auth_request_model.dart';
import '../../dosen/dosen_page.dart';
import '../../mahasiswa/mahasiswa_page.dart';

class LoginBottomSheet extends StatefulWidget {
  // final VoidCallback onPressed;
  const LoginBottomSheet({
    super.key,
    // required this.onPressed,
  });

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(width: 40.0),
            ],
          ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              const Text(
                "Selamat Datang",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Masukkan email dan password agar bisa mengakses informasi administrasi.",
                style: TextStyle(
                  color: ColorName.red,
                ),
              ),
              const SizedBox(height: 50.0),
              CustomTextField(
                controller: usernameController,
                label: 'Email',
              ),
              const SizedBox(height: 12.0),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loaded: (data) {
                      AuthLocalDatasource().saveAuthData(data);
                      if (data.user.roles == 'mahasiswa' ||
                          data.user.roles == 'admin') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const MahasiswaPage();
                        }));
                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const DosenPage();
                        }));
                      }
                    },
                    error: (message) {
                      showDialog(
                          context: context,
                          builder: (contex) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: Text(message),
                            );
                          });
                    },
                  );
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return Button.filled(
                        onPressed: () {
                          final requestModel = AuthRequestModel(
                            email: usernameController.text,
                            password: passwordController.text,
                          );
                          context
                              .read<LoginBloc>()
                              .add(LoginEvent.login(requestModel));
                        },
                        label: 'Masuk',
                        color: Colors.lightBlue,
                      );
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                  },
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ],
      ),
    );
  }
}
