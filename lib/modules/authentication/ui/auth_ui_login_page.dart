import 'package:dio/dio.dart';
import 'package:dukkantek_test/constants/con_assets.dart';
import 'package:dukkantek_test/constants/con_colors.dart';
import 'package:dukkantek_test/constants/con_dimens.dart';
import 'package:dukkantek_test/constants/con_radius.dart';
import 'package:dukkantek_test/constants/con_text_style.dart';
import 'package:dukkantek_test/managers/navigation/mgr_nav_routes.dart';
import 'package:dukkantek_test/modules/authentication/domain/blocs/auth_dom_authentication_bloc.dart';
import 'package:dukkantek_test/modules/authentication/domain/blocs/auth_dom_authentication_event.dart';
import 'package:dukkantek_test/modules/authentication/domain/blocs/auth_dom_authentication_state.dart';
import 'package:dukkantek_test/utils/errors/utl_error_handler.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:dukkantek_test/widgets/textfield/normal_form_field.dart';
import 'package:dukkantek_test/widgets/wdg_anim_column.dart';
import 'package:dukkantek_test/widgets/wdg_appbar_empty_appbar.dart';
import 'package:dukkantek_test/widgets/wdg_base_body.dart';
import 'package:dukkantek_test/widgets/wdg_btn_rounded_shadow.dart';
import 'package:dukkantek_test/widgets/wdg_horizontal_padding.dart';
import 'package:dukkantek_test/widgets/wdg_img_image_assets_circle.dart';
import 'package:dukkantek_test/widgets/wdg_vertical_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _cancelToken = CancelToken();
  AuthBloc _authBloc = AuthBloc();

  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController _passwordController = TextEditingController(text: "cityslicka");

  bool _emailValidation = false;
  bool _passwordValidation = false;

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1);

    return Scaffold(
      primary: true,
      appBar: const EmptyAppBar(),
      body: _buildBody(height: heightC, width: widthC),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody({required double width, required double height}) {
    return BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is SignInSuccess) {
            AppUtils.snackBarMessage(context: context, message: "Hello, Welcome back");
            /// actual logic for success login
            //Navigator.of(context).pushReplacementNamed(Routes.mainRootPage);

            /// easy to test another case of login
            Navigator.of(context).pushNamed(Routes.mainRootPage);
          }
          else if(state is SignInError){
            AppUtils.showErrorMessage(error: state.error,context: context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AuthLoading,
            color: AppColors.mainColor,
            opacity: 0.2,
            progressIndicator: const SpinKitRing(
              color: AppColors.mainColor,
            ),
            child: Form(
              key: formKey,
              child: BaseBodyWidget(
                portraitWidget: _portraitWidget(height: height, width: width),
                landscapeWidget: _landscapeWidget(height: height, width: width),
                isSafeAreaTop: true,
              ),
            ),
          );
        });
  }

  // portrait view:--------------------------------------------------------------
  Widget _portraitWidget({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
      child: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: AnimationColumnWidget(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          duration: const Duration(milliseconds: 1000),
          verticalOffset: 50,
          children: [
            const VerticalPadding(
              percentage: .2,
            ),
            Container(
              width: width,
              height: 100,
              alignment: Alignment.center,
              child: const ImageAssetCircleWidget(
                imagePath: AppAssets.userManagementBG,
              ),
            ),
            const VerticalPadding(
              percentage: 0.1,
            ),
            SizedBox(
              height: 45,
              child: NormalFormField(
                hintText: "E-Mail",
                style: appTextStyle.smallTSBasic
                    .copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
                controller: _emailController,
                onChanged: (value) {
                  setState(() {
                    _emailValidation = true;
                  });
                },
                validator: (value) {
                  return BaseValidator.validateValue(
                    context,
                    value!,
                    [RequiredValidator(), EmailValidator()],
                    _emailValidation,
                  );
                },
                focusNode: _emailNode,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passNode);
                },
              ),
            ),
            const VerticalPadding(
              percentage: 0.02,
            ),
            SizedBox(
              height: 45,
              child: NormalFormPasswordField(
                hintText: "Password",
                style: appTextStyle.smallTSBasic
                    .copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
                onChanged: (value) {
                  setState(() {
                    _passwordValidation = true;
                  });
                },
                controller: _passwordController,
                validator: (value) {
                  return BaseValidator.validateValue(
                    context,
                    value!,
                    [RequiredValidator(),MinLengthValidator(minLength: 8)],
                    _passwordValidation,
                  );
                },
                focusNode: _passNode,
                textInputAction: TextInputAction.next,
              ),
            ),
            const VerticalPadding(
              percentage: 0.05,
            ),
            TextButton(
                onPressed: (){},
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(AppDimens.space2),
                  child: Text(
                    "Forget password?",
                    style: appTextStyle.smallTSBasic
                        .copyWith(color: AppColors.mainColor),
                  ),
                )),
            const VerticalPadding(
              percentage: 0.05,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.horizontalPadding,
                  vertical: AppDimens.verticalPadding),
              alignment: AlignmentDirectional.center,
              width: width,
              child:   RoundedShadowButton(
                child: Center(
                  child: Text(
                    "Sign In",
                    style: appTextStyle.subTitle1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                width: width,
                height: 55,
                textColor: AppColors.transparent,
                color: AppColors.mainColor,
                shadowColor: AppColors.blue[50],
                onPressed: _signInOnPressButton,
                borderRadius: 55,
              ),),
            const VerticalPadding(
              percentage: .05,
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SignUpButton(
              ),
            ),
            const VerticalPadding(
              percentage: 0.1,
            ),

          ],
        ),
      ),
    );
  }

  Widget _landscapeWidget({required double width, required double height}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  // dispose:-------------------------------------------------------------------
  _signInOnPressButton(){
    if (mounted) {
      DeviceUtils.hideKeyboard(context);
      setState(() {
        _emailValidation = true;
        _passwordValidation = true;
      });
      if (formKey.currentState!.validate()) {
        _authBloc.add(SignInEvent(
            cancelToken: _cancelToken,
            email: _emailController.text,
            password: _passwordController.text));
        //widget.onSend(true);
      }
    }
  }
  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    _authBloc.close();
    _cancelToken.cancel();
    super.dispose();

  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black12,
                      Colors.black54,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              width: 100.0,
              height: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
              child: Text(
                "Or",
                style: appTextStyle.middleTSBasic.copyWith(color: AppColors.black),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black54,
                      Colors.black12,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              width: 100.0,
              height: 1.0,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Don't have an account? ",
                style:
                    appTextStyle.smallTSBasic.copyWith(color: AppColors.black)),
            InkWell(
              onTap: () {},
              child: Text("Sign Up",
                  style: appTextStyle.smallTSBasic.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ],
    );
  }
}
