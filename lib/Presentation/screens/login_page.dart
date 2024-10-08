import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              const Text('Login',
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
              const SizedBox(height: 20,),
              Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: size.width * .5,
                      child: const Row(
                        children: [
                          Text('Forget your password?',
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
                    child: Text('LOGIN',
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
                        child: Text('Or login with social account',
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
