import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: size.width - 36,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}
