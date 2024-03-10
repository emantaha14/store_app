import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/business_logic_layer/login_cubit/login_cubit.dart';
import 'package:store_app/widgets/default_button.dart';
import '../widgets/default_text_form_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: 830,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.purple[300],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 90,
                          ),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[300],
                            ),
                          ),
                          DefaultTextFormField(
                            controller: _emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email Address';
                              }
                            },
                            labelOfTextFormField: 'User Name',
                            prefix: Icons.email_outlined,
                          ),
                          DefaultTextFormField(
                            controller: _passwordController,
                            type: TextInputType.visiblePassword,
                            isPassword: true,
                            labelOfTextFormField: 'Password',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                            },
                            onSubmit: (value){
                              if(_formKey.currentState!.validate()){
                                context.read<LoginCubit>().userLogin(username: _emailController.text, password: _passwordController.text);
                              }
                              else{
                                print('object');
                              }
                            },
                            prefix: Icons.lock_outline,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                              const Text(
                                    'Don\'t have an account ?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.teal, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: DefaultButton(onPressed: () {
                          if(state.status ==  LoginStatus.success){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  HomeScreen(username: _emailController.text),), (route) => false);
                          }
                          else if (state.status == LoginStatus.failure) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.errorMessage ?? 'Login failed.'),
                                ),
                              );
                            });
                          }
                        },
                          text: 'Login',
                          bottomSize: 300,

                        )
                    ),
                    const Expanded(
                      flex: 1,
                        child: SizedBox(height: 20,)),
                  ],
                ),
              ),
            ),
          ),
        );
      },)
    );
  }
}
