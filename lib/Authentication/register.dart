import 'package:evently/Authentication/widget/custom_google_button.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:evently/extensions/device_dimensions.dart';
import 'package:evently/extensions/validations.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/my_user.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_assets.dart';
import '../core/utils/dialog_utils.dart';
import '../providers/event_list_provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/user_provider.dart';

class Register extends StatefulWidget {

  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscure = true;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    bool isDark = themeProvider.isDarkMode();
    bool isEnglish = languageProvider.appLanguage == "en";
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.03,
                  horizontal: context.width * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: context.height * 0.02,
                  children: [
                    Center(
                      child:
                      themeProvider.isDarkMode()
                          ? Image.asset(AppAssets.darkEventlyLogo)
                          : Image.asset(AppAssets.lightEventlyLogo),
                    ),
                    SizedBox(height: context.height * 0.01),
                    Text(
                      AppLocalizations.of(context)!.create_account_title,
                      style:
                      isDark
                          ? AppStyles.semiBold24white
                          : AppStyles.semiBold24PrimeBlue,
                    ),
                    CustomTextField(
                      controller: _nameController,
                      validator: (name) {
                        return name!.userNameValidation(name, context);
                      },
                      hintText: AppLocalizations.of(context)!.name_hint,
                      prefixIcon: "${AppAssets.userIcon}.svg",
                      prefixColorLight: AppColors.grayLight,
                      prefixColorDark: AppColors.grayLight,
                      prefixPadding: EdgeInsets.only(
                        right: isEnglish ? 4 : 16,
                        left: isEnglish ? 16 : 4,
                      ),
                    ),
                    CustomTextField(
                      controller: _emailController,
                      validator: (email) {
                        return email!.emailValidation(email, context);
                      },
                      hintText: AppLocalizations.of(context)!.email_hint,
                      prefixIcon: AppAssets.smsIcon,
                      prefixColorLight: AppColors.grayLight,
                      prefixColorDark: AppColors.grayLight,
                      prefixPadding: EdgeInsets.only(
                        right: isEnglish ? 4 : 16,
                        left: isEnglish ? 16 : 4,
                      ),
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      validator: (password) {
                        return password!.passwordValidation(password, context);
                      },
                      hintText: AppLocalizations.of(context)!.password_hint,
                      obscure: true,
                      prefixIcon: AppAssets.lockIcon,
                      prefixColorLight: AppColors.grayLight,
                      prefixColorDark: AppColors.grayLight,
                      suffixIcon: AppAssets.eyeIcon,
                      suffixColorLight: AppColors.grayLight,
                      suffixColorDark: AppColors.grayLight,
                      isPassword: true,
                      prefixPadding: EdgeInsets.only(
                        right: isEnglish ? 4 : 16,
                        left: isEnglish ? 16 : 4,
                      ),
                    ),
                    CustomTextField(
                      controller: _confirmPasswordController,
                      validator: (confirmPassword) {
                        return confirmPassword!.passwordValidation(
                            _passwordController.text, context, confirmPassword);
                      },
                      hintText: AppLocalizations.of(context)!
                          .confirm_password_hint,
                      obscure: true,
                      prefixIcon: AppAssets.lockIcon,
                      prefixColorLight: AppColors.grayLight,
                      prefixColorDark: AppColors.grayLight,
                      suffixIcon: AppAssets.eyeIcon,
                      suffixColorLight: AppColors.grayLight,
                      suffixColorDark: AppColors.grayLight,
                      isPassword: true,
                      prefixPadding: EdgeInsets.only(
                        right: isEnglish ? 4 : 16,
                        left: isEnglish ? 16 : 4,
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_formKey.currentState!.validate()) {
                          DialogUtils.showLoading(
                            context: context,
                            loadingMessage: AppLocalizations.of(context)!
                                .loading,
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall!,
                          );
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            UserProvider userProvider = Provider.of<
                                UserProvider>(context, listen: false);
                            MyUser newUser = MyUser(
                                id: credential.user?.uid ?? "",
                                email: _emailController.text,
                                name: _nameController.text);
                            userProvider.updateUser(newUser);
                            var getEventProvider = Provider.of<EventProvider>(
                                context, listen: false);
                            getEventProvider.changeIndex(
                                0, userProvider.user!.id);
                            getEventProvider.getFavouriteList(
                                userProvider.user!.id);
                            await FirebaseUtils.addUserToFireStore(newUser);
                            DialogUtils.hideDialog(context: context);
                            DialogUtils.showMessage(
                                title: AppLocalizations.of(context)!.success,
                                customColor: AppColors.successGreen,
                                context: context,
                                dismissible: false,
                                message: AppLocalizations.of(context)!
                                    .register_success,
                                posActionName: AppLocalizations.of(context)!.ok,
                                posAction: () {
                                  Navigator.of(context,).pushReplacementNamed(
                                      AppRoutes.mainScreen);
                                }
                            );
                          } on FirebaseAuthException catch (e) {
                            if (!mounted) return;
                            DialogUtils.hideDialog(context: context);
                            String message;
                            switch (e.code) {
                              case 'weak-password':
                                message =
                                    AppLocalizations.of(context)!.weak_password;
                                break;
                              case 'email-already-in-use':
                                message = AppLocalizations.of(context)!
                                    .email_already_in_use;
                                break;
                              case 'invalid-email':
                                message =
                                    AppLocalizations.of(context)!.email_invalid;
                                break;
                              default:
                                message = e.message ??
                                    AppLocalizations.of(context)!
                                        .authentication_error;
                            }

                            DialogUtils.showMessage(
                              title: AppLocalizations.of(context)!.error,
                              customColor: AppColors.errorRed,
                              context: context,
                              message: message,
                              posActionName: AppLocalizations.of(context)!.ok,
                            );
                          }
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signup_link,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelLarge,
                      ),
                    ),
                    SizedBox(height: context.height * 0.005),
                    Row(
                      spacing: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.already_have_account,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(AppRoutes.loginScreen);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login_link,
                            style:
                            isDark
                                ? AppStyles.semiBold14BlueAccent.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.blueAccent,
                            )
                                : AppStyles.semiBold14PrimeBlue.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor:
                              AppColors
                                  .primaryBlue, // Set the underline color
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.005),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: isDark ? AppColors.blueDark : AppColors
                                .offWhite,
                            indent: context.width * 0.02,
                            endIndent: context.width * 0.02,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.or_divider,
                          style:
                          isDark
                              ? AppStyles.medium16BlueAccent
                              : AppStyles.medium16PrimaryBlue,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: isDark ? AppColors.blueDark : AppColors
                                .offWhite,
                            indent: context.width * 0.02,
                            endIndent: context.width * 0.02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.005),
                    CustomGoogleButton(
                      function: () async {
                        DialogUtils.showLoading(
                          context: context,
                          loadingMessage: AppLocalizations.of(context)!
                              .loading,
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .bodySmall!,
                        );
                        try {
                          User? user = await signInWithGoogle();
                          MyUser newUser = MyUser(id: user?.uid ?? "",
                            email: user?.email ?? "",
                            name: user?.displayName ?? "",);
                          UserProvider userProvider = Provider.of<UserProvider>(
                              context, listen: false);
                          userProvider.updateUser(newUser);
                          var getEventProvider = Provider.of<EventProvider>(
                              context, listen: false);
                          getEventProvider.changeIndex(
                              0, userProvider.user!.id);
                          getEventProvider.getFavouriteList(
                              userProvider.user!.id);
                          await FirebaseUtils.addUserToFireStore(newUser);
                          DialogUtils.hideDialog(context: context);
                          DialogUtils.showMessage(
                              title: AppLocalizations.of(context)!.success,
                              customColor: AppColors.successGreen,
                              context: context,
                              dismissible: false,
                              message: AppLocalizations.of(context)!
                                  .register_success,
                              posActionName: AppLocalizations.of(context)!.ok,
                              posAction: () {
                                Navigator.of(context,).pushReplacementNamed(
                                    AppRoutes.mainScreen);
                              }
                          );
                        }
                        catch (e) {
                          DialogUtils.hideDialog(context: context);
                          DialogUtils.showMessage(
                            title: AppLocalizations.of(context)!.error,
                            customColor: AppColors.errorRed,
                            context: context,
                            dismissible: false,
                            message: AppLocalizations.of(context)!
                                .authentication_error,
                            posActionName: AppLocalizations.of(context)!.ok,
                          );
                        }
                      },
                      child: Row(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.googleIcon),
                          Text(
                            AppLocalizations.of(context)!.login_with_google,
                            style:
                            isDark
                                ? AppStyles.medium18BlueAccent
                                : AppStyles.medium18Blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    ;
    // Once signed in, return the UserCredential
    return userCredential.user;
  }
}
