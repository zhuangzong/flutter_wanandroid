import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

///这个界面没有调接口 只是做了个效果图 具体登录在LoginPage
class AnimLogin extends StatefulWidget {
  @override
  AnimLoginState createState() => AnimLoginState();
}

class AnimLoginState extends State<AnimLogin>
    with SingleTickerProviderStateMixin {
  bool isShowRegister = false;
  Duration defaultDuration = const Duration(milliseconds: 300);
  late AnimationController animationController;
  late Animation<double> animation;

  void setAnimation() {
    animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    animation = Tween<double>(begin: 0, end: 90).animate(animationController);
  }

  void updateView() {
    setState(() {
      isShowRegister = !isShowRegister;
    });
    isShowRegister
        ? animationController.forward()
        : animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: (context, _) {
          return Stack(
            children: [
              AnimatedPositioned(
                  width: Get.width * 0.88,
                  height: Get.height,
                  left: isShowRegister ? -Get.width * 0.76 : 0,
                  duration: defaultDuration,
                  child: Container(
                    color: Colors.blueAccent,
                    child: Login(),
                  )),
              AnimatedPositioned(
                  duration: defaultDuration,
                  width: Get.width * 0.88,
                  height: Get.height,
                  left: isShowRegister ? (Get.width * 0.12) : (Get.width * 0.88),
                  child: Container(
                    color: Colors.redAccent,
                    child: Register(),
                  )),
              AnimatedPositioned(
                  duration: defaultDuration,
                  top: Get.height * 0.1,
                  left: isShowRegister ? Get.width * 0.06 : 0,
                  right: isShowRegister ? 0 : Get.width * 0.06,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: Icon(
                      isShowRegister
                          ? Icons.person_add_alt
                          : Icons.person_pin_outlined,
                      color: Colors.white,
                      size: 60,
                    ),
                  )),
              AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: isShowRegister ? (Get.height * 0.5) : (Get.height * 0.2),
                  left: isShowRegister
                      ? -20+Get.width*0.06
                      : (Get.width * 0.44 - 40),
                  child: AnimatedDefaultTextStyle(
                    child: Transform.rotate(
                        angle: -animation.value * pi / 180,
                        child: InkWell(
                          onTap: () {
                            if (isShowRegister) {
                              updateView();
                            } else {
                              //do something
                            }
                          },
                          child:  const Text("登录"),
                        )),
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.0,
                        fontSize: isShowRegister ? 20 : 40),
                    duration: defaultDuration,
                  )),
              AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: isShowRegister ? (Get.height * 0.2) : (Get.height * 0.5),
                  left: isShowRegister ? (Get.width * 0.44) : (Get.width*0.94-20),
                  child: AnimatedDefaultTextStyle(
                    child: Transform.rotate(
                        angle: (90 - animation.value) * pi / 180,
                        child: InkWell(
                          onTap: () {
                            if (!isShowRegister) {
                              updateView();
                            } else {
                              //do something
                            }
                          },
                          child: const Text("注册")
                        )),
                    style: TextStyle(
                        color: Colors.white,height: 1.0,
                        fontSize: isShowRegister ? 40 : 20),
                    duration: defaultDuration,
                  )),
            ],
          );
        },
        animation: animationController,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    setAnimation();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  void didUpdateWidget(AnimLogin oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              child: Center(
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: "请输入用户名",
                      labelStyle: const TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  autofocus: false,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              child: Center(
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_open_sharp,
                        color: Colors.white,
                      ),
                      labelText: "请输入密码",
                      labelStyle: TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  autofocus: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              child: Center(
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: "请输入用户名",
                      labelStyle: TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  autofocus: false,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              child: Center(
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_open_sharp,
                        color: Colors.white,
                      ),
                      labelText: "请输入密码",
                      labelStyle: TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  autofocus: false,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              child: Center(
                child: TextField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_open_sharp,
                        color: Colors.white,
                      ),
                      labelText: "请再次输入密码",
                      labelStyle: TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                  autofocus: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
