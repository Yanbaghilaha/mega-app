import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShow = false;
  final _username = TextEditingController();
  final _password = TextEditingController();

  bool isInputField() {
    return _username.text.isNotEmpty && _password.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 100,
        backgroundColor: pureWhite,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.5,
            horizontal: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                IconlyLight.arrow_left_2,
                color: navyBlack,
              ),
              Text(
                "Login",
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: navyBlack,
                ),
              ),
              const Icon(null),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 72, 25, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Welcome Back Text
                Text(
                  "Welcome back to\nMega Mall",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Silahkan masukan data untuk login",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w400,
                    color: darkGrey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                //Text Input Username
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email/ Phone",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: navyBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: _username,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukan Alamat Email/ No Telepon Anda",
                          hintStyle: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: halfGrey,
                          ),
                        ),
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: navyBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                //Password
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: navyBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukan Kata Sandi Akun",
                          hintStyle: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: halfGrey,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            child: Icon(
                              isShow == true
                                  ? IconlyLight.show
                                  : IconlyLight.hide,
                              color: darkGrey,
                            ),
                          ),
                        ),
                        obscureText: isShow,
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 70,
                ),
                //Button Sign In
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isInputField() ? blueOcean : darkGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ),
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: pureWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Sign Up Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Forgot Password?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Sign Up",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: blueOcean,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
