import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back_ios, size: 18,color: Colors.black,)
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sign up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),
              const SizedBox(height: 70,),
              Container(
                height: 55,
                width: size.width - 36,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                height: 55,
                width: size.width - 36,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                height: 55,
                width: size.width - 36,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: size.width * .55,
                      child: const Row(
                        children: [
                          Text('Already have an account?',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              )
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_forward,size: 20 ,color: Colors.black,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 45,
                width: size.width - 36,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('SIGN UP',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                  )
                ),
              ),
              const SizedBox(height: 110,),
              Container(
                height: size.height * .14,
                width: size.width - 36,
                child:  Column(
                  children: [
                    const Center(
                        child: Text('Or sign up with social account',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                        )
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * .252),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 55,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                                child: Icon(Icons.safety_check, size: 30,color: Colors.red,)
                            ),
                          ),
                          Container(
                            height: 55,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                                child: Icon(Icons.safety_check, size: 30,color: Colors.red,)
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
