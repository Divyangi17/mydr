import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydr/app/modules/dashboard/views/dashboard_view.dart';
import '../../../core/utils/common.dart';
import '../../../core/widget/ripple.dart';
import '../../main/views/main_view.dart';
import '../controllers/login_controller.dart';
import '../model/login_data.dart';
import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/elevated_container.dart';
import '/app/core/widget/icon_text_widgets.dart';
import '/app/routes/app_pages.dart';
class LoginWidget extends StatefulWidget {
  final LoginController loginController;
  LoginWidget({
    Key? formKey,
    required this.loginController,
  }) : super();

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

// class RegisterCard extends StatefulWidget {
//
//   @override
//   RegisterCardState createState() => RegisterCardState();
// }

class LoginWidgetState extends State<LoginWidget> {
// class LoginWidget extends StatelessWidget with BaseWidgetMixin {

  final GlobalKey<FormState> _signinKey = GlobalKey();
  final GlobalKey<FormState> _signupKey2 = GlobalKey();

  final _emailController1 = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _cpasswordController1 = TextEditingController();

  bool _isEmailVerificationSent = false;

  // final loginController = Get.find<LoginController>();


  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
          child:Column(
            children: [
              GetX<LoginController>(builder:(controller){
                return Form(
                  key: _signinKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 40,
                            ),

                            Text( 'Create Your Account',
                                style: TextStyle(fontSize: 20, color: Colors.indigo))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                        child: TextFormField(

                          controller: _emailController1,
                          enabled: ! _isEmailVerificationSent,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  borderSide: BorderSide(color: Colors.white24)),
                              labelText: 'Email',
                              labelStyle: TextStyle(fontWeight: FontWeight.w500)),
                          keyboardType: TextInputType.emailAddress,
                          //ignore: missing_return,
                          validator: (value) {
                            if (value!.isEmpty || !isEmail(value)) {
                              return 'Invalid email id!';
                              // ignore: missing_return
                            }
                          },

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                        child: TextFormField(
                          controller: _passwordController1,
                          enabled: true,//verifyPhoneState, //_isphoneVerificationSent,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  borderSide: BorderSide(color: Colors.white24)),
                              labelText: 'Password',
                              labelStyle: TextStyle(fontWeight: FontWeight.w500),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    // print(widget.loginController);
                                    // widget.loginController.obsecure1.value=(widget.loginController.obsecure1.value)?false:true;
                                    print(controller);
                                    controller.obsecure1.value=(controller.obsecure1.value)?false:true;
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    size: 25,
                                    color: Colors.black,
                                  ))),
                          // obscureText: widget.loginController.obsecure1.value,
                          obscureText: controller.obsecure1.value,
                          // ignore: missing_return
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Invalid email id!';
                              // ignore: missing_return
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                        child: TextFormField(
                          controller: _cpasswordController1,
                          enabled: true,//verifyPhoneState, //_isphoneVerificationSent,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  borderSide: BorderSide(color: Colors.white24)),
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(fontWeight: FontWeight.w500),
                              suffixIcon: IconButton(
                                  onPressed: () => {
                                    (controller.obsecure1.value)?false:true
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    size: 25,
                                    color: Colors.black,
                                  ))),
                          obscureText: controller.obsecure1.value,
                          // ignore: missing_return
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Invalid email id!';
                              // ignore: missing_return
                            }
                            if (value != _passwordController1.text) {
                              return 'Password not matched !';
                              // ignore: missing_return
                            }
                          },
                        ),
                      ),
                      ///******************************************************* Sign up Button ****************************************************************/
                      SizedBox(
                        height: 40,
                        width: 285,
                        child: MaterialButton(
                          onPressed: () {
                            Get.toNamed(Routes.MAIN);
                            // print("inside signup");
                            // if(_isLoading && (!_isPhoneVerificationSent)){return;}
                            // print("inside signup...");
                            // if (!_formKey.currentState!.validate()) {
                            //   // Invalid!
                            //   return;
                            // }
                            // _formKey.currentState?.save();
                            // _submit();

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          // color: (_isLoading && (!_isPhoneVerificationSent))?Colors.indigo.shade300:Colors.indigo.shade600,

                          textColor: AppColors.colorAccent,
                          child: Text( "Sign up"),
                        ),
                      ),


                      const Text( 'Sign in with..',
                          style: TextStyle(fontSize: 20, color: Colors.indigo)),



                      const SizedBox(
                        height: 20,
                      ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    ],
                  ),
                );
              })



            ],
          )

        //)
      );

  }


}
