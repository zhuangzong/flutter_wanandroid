import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/modules/login_module/login_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              onPressed: () => Get.back(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            BounceInDown(
              child: Container(
                margin: const EdgeInsets.all(50),
                child: const FlutterLogo(
                  size: 80,
                ),
              ),
            ),
            FadeInLeft(
              child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "欢迎使用",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30.0),
              child: InkWell(
                onTap: (){
                  if(controller.pageType.value == 0){
                    controller.pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                  }else{
                    controller.pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Visibility(
                        visible: controller.pageType.value==1,
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.blueAccent,
                          size: 16,
                        ),
                      )),
                      Obx(() => Text(
                        controller.pageType.value==0?"去注册":"去登录",
                        style: const TextStyle(
                            color: Colors.blueAccent, fontSize: 12, height: 1),
                      ),),
                      Obx(() =>Visibility(
                        visible: controller.pageType.value==0,
                        child: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.blueAccent,
                          size: 16,
                        ),
                      ), ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 600,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index)=>controller.pageType.value = index,
                children: [
                  loginWidget(),
                  registerWidget(),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }

  Widget loginNameWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Center(
        child: Obx(() => TextField(
              controller: controller.loginName.value,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              onChanged: controller.onUsernameChanged,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: "请输入用户名",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: controller.onUsernameClear,
                  )),
              autofocus: false,
            )),
      ),
    );
  }

  Widget passwordWidget(int type) {
    return Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Center(
          child: Obx(() => TextField(
                controller: type==0?controller.password.value:controller.repassword.value,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: true,
                style: const TextStyle(fontSize: 18),
                onChanged: type==0?controller.onPasswordChanged:controller.onRePasswordChanged,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    // ),
                    labelText: type==0?"请输入密码":"请再次输入密码",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: type==0?controller.onPasswordClear:controller.onRePasswordClear,
                    )),
                autofocus: false,
              )),
        ));
  }

  Widget loginButtonWidget(int type) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(type==0?Colors.blueAccent:Colors.redAccent),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 16)),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 45)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)))),
                onPressed: () =>type==0?controller.login():controller.register(),
                child: Text(type==0?"登录":"注册"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        loginNameWidget(),
        passwordWidget(0),
        loginButtonWidget(0),
      ],
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        loginNameWidget(),
        passwordWidget(0),
        passwordWidget(1),
        loginButtonWidget(1),
      ],
    );
  }
}
