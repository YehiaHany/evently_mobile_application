import 'package:evently/Authentication/widget/custom_google_button.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_styles.dart';
import 'package:evently/core/utils/dialog_utils.dart';
import 'package:evently/extensions/device_dimensions.dart';
import 'package:evently/extensions/validations.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_assets.dart';
import '../providers/event_list_provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/user_provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscure = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                      AppLocalizations.of(context)!.login_title,
                      style:
                      isDark
                          ? AppStyles.semiBold24white
                          : AppStyles.semiBold24PrimeBlue,
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
                    Align(
                      alignment:
                      isEnglish
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          // todo:forget password function
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.forgetPasswordScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forget_password_link,
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
                    ),

                    SizedBox(height: context.height * 0.01),
                    ElevatedButton(
                      onPressed: () async {
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
                                .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            var newUser = await FirebaseUtils
                                .getUserFromFireStore(
                                credential.user?.uid ?? "");
                            if (newUser == null) {
                              return;
                            }
                            UserProvider userProvider = Provider.of<
                                UserProvider>(context, listen: false);
                            userProvider.updateUser(newUser);
                            var getEventProvider = Provider.of<EventProvider>(
                                context, listen: false);
                            getEventProvider.changeIndex(
                                0, userProvider.user!.id);
                            getEventProvider.getFavouriteList(
                                userProvider.user!.id);
                            DialogUtils.hideDialog(context: context);
                            DialogUtils.showMessage(
                                title: AppLocalizations.of(context)!.success,
                                customColor: AppColors.successGreen,
                                context: context,
                                dismissible: false,
                                message: AppLocalizations.of(context)!
                                    .login_success,
                                posActionName: AppLocalizations.of(context)!.ok,
                                posAction: () {
                                  Navigator.of(context,).pushReplacementNamed(
                                      AppRoutes.mainScreen);
                                }
                            );
                          } on FirebaseAuthException catch (e) {
                            DialogUtils.hideDialog(context: context);
                            String message;
                            switch (e.code) {
                              case 'user-not-found':
                                message = AppLocalizations.of(context)!
                                    .user_not_found;
                                break;
                              case 'invalid-credential':
                                message = AppLocalizations.of(context)!
                                    .wrong_password;
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
                        AppLocalizations.of(context)!.login_button,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelLarge,
                      ),
                    ),
                    SizedBox(height: context.height * 0.005),
                    Row(
                      spacing: 2,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.donot_have_account,
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
                            ).pushReplacementNamed(AppRoutes.registerScreen);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signup_link,
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
                            color:
                            isDark
                                ? AppColors.blueDark
                                : AppColors.offWhite,
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
                            color:
                            isDark
                                ? AppColors.blueDark
                                : AppColors.offWhite,
                            indent: context.width * 0.02,
                            endIndent: context.width * 0.02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.005),
                    CustomGoogleButton(
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
}
