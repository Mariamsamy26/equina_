import 'package:equina_task/app/start_app_cycle/models/onbording_model.dart';
import 'package:equina_task/app/start_app_cycle/views/auth_screen.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/helpers/navigation_helper.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:equina_task/widget/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  PageController _pageController = PageController();
  int _currentPageInedx = 0;

  List<OnbordingModel> onbordingData = [
    OnbordingModel(
      imgPth: 'assets/images/first_boarding.png',
      title: 'Advance Your \n Game',
      subtitle: 'Effortlessly Book and Track\n your Training Sessions',
    ),

    OnbordingModel(
      imgPth: 'assets/images/second_boarding.png',
      title: 'Trainer Login',
      subtitle:
          'Follow your trainer comments \n view your attendence \n Manage Cancellation ',
    ),

    OnbordingModel(
      imgPth: 'assets/images/third_boarding.png',
      title: 'equinaLIVER Is\n Available Now',
      subtitle:
          'View Your Horse(s) Details \n Get Healthcare Reminders\nFollow Its Daily Feeding & Fraining ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    AppDimentions().appDimentionsInit(context);

    return Scaffold(
      /*  appBar: AppBar(
        systemOverlayStyle:SystemUiOverlayStyle(systemNavigationBarColor: backgroundGrey,
        statusBarBrightness:Brightness.dark ),
      ),*/
      body: Container(
        height: AppDimentions().availableheightWithAppBar,
        width: AppDimentions().availableWidth,
        color: backgroundWhite,
        child: Column(
          children: [
            SizedBox(
              height: AppDimentions().availableheightWithAppBar * 0.7,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onbordingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageInedx = index;
                  });
                },
                itemBuilder: (BuildContext, index) {
                  dynamic bording = onbordingData[index];
                  return Column(
                    children: [Expanded(child: Onbording(data: bording))],
                  );
                },
              ),
            ),

            Transform.scale(
              filterQuality: FilterQuality.high,
              scale: 0.7,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: onbordingData.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: mainPurble,
                    dotHeight: 10.h,
                    dotWidth: 12.w,
                  ),
                ),
              ),
            ),
            Spacer(),
            if (_currentPageInedx == 0)
              Container(
                height: 140.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomElevatedButtom(
                        text: 'Skip',
                        OnPressed:
                            () => Navigation().goToScreenAndClearAll(
                              context,
                              (context) => AuthScreen(),
                            ),
                        colorButton: greyBorder,
                        colorText: black,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: CustomElevatedButtom(
                        text: 'Next',
                        OnPressed: () {
                          setState(() {
                            _pageController.animateToPage(
                              _currentPageInedx + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          });
                        },
                        colorButton: mainBlue,
                        colorText: white,
                      ),
                    ),
                  ],
                ),
              ),

            if (_currentPageInedx == 1)
              Container(
                height: 140.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomElevatedButtom(
                        text: 'Back',
                        OnPressed: () {
                          setState(() {
                            _pageController.animateToPage(
                              _currentPageInedx - 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          });
                          // initState();
                        },
                        colorButton: greyBorder,
                        colorText: black,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: CustomElevatedButtom(
                        text: 'Next',
                        OnPressed: () {
                          setState(() {
                            _pageController.animateToPage(
                              _currentPageInedx + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          });
                          // initState();
                        },
                        colorButton: mainBlue,
                        colorText: white,
                      ),
                    ),
                  ],
                ),
              ),

            if (_currentPageInedx == 2)
              Container(
                height: 140.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Welcome, Let's get started!",style: TextManager.regular().copyWith(color:mainDarkBlue.withAlpha(150) )),
                    CustomElevatedButtom(
                      text: 'Sign In',
                      OnPressed:
                          () => Navigation().goToScreenAndClearAll(
                        context,
                            (context) => AuthScreen(),
                      ),
                      colorButton: mainBlue,
                      colorText: white,
                    ),
                    CustomElevatedButtom(
                      text: 'Create Account',
                      OnPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => AuthScreen(
                              initialTabIndex: 1,
                            ),
                          ),
                        );
                      },
                      colorButton: mainPurble,
                      colorText: white,
                    ),
                  ],
                ),
              ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget Onbording({required OnbordingModel data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 0.1.sh),
        SizedBox(
          height: 235,
          child: Image.asset(
            data.imgPth,
            width: AppDimentions().availableWidth * 0.9,
            fit: BoxFit.fill,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 50.h),

          child: Text(
            data.title,
            style: TextManager.medium(fontSize: 20).copyWith(color: black),
            textAlign: TextAlign.center,
          ),
        ),

        Expanded(
          child: Text(
            data.subtitle,
            style: TextManager.regular(
              fontSize: 20,
            ).copyWith(color: lightGreyLabel),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
