import 'package:eshop/data/models/onboarding_screen_class.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/skip_button.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   int currentIndex=0;
   int counts= 2;
 final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19,vertical: 24),
              child: Column(
                children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: PageView.builder(
                          onPageChanged: (index){
                            setState(() {
                              currentIndex=index;

                            });
                          },
                            controller: _pageController,
                            itemCount: items.length,
                            itemBuilder: (context,index){
                              final onboardingItem= items[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Image.asset(onboardingItem.image,
                                height: MediaQuery.of(context).size.height* 0.4,
                              width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 15,),
                              Text(
                                  textAlign: TextAlign.center,
                                  onboardingItem.title,
                                style: Theme.of(context).textTheme.titleLarge
                              ),
                              SizedBox(height: 15,),
                              Text(onboardingItem.description,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff9AA5B8)
                                ),
                                textAlign: TextAlign.center,
                              ),

                            ],


                          );
                        }),
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         ...List.generate(items.length, (index){
                           return AnimatedContainer(
                               width: index==currentIndex?20:9,
                               height: 7,

                               duration: Duration(milliseconds: 100),
                                margin: EdgeInsets.symmetric(horizontal: 4),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(4),
                               color: index==currentIndex? Color.fromRGBO(219, 48, 34, 1): Color(0xffB5BDCB)
                             ),

                           );
                         })
                       ],
                     ),
                        Spacer(),
                  Row(
                    children: [
                      SkipCustomButton(width: 110, text: "skip", onTap: (){
                        context.go(RoutePaths.navigator);
                      }),
                      SizedBox(width: 10,),
                      Expanded(
                        child: CustomButton(
                          width: 229,
                          text: currentIndex==counts?"Get Started":"Next",
                          onTap: () {
                           if(currentIndex<counts){
                             _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                           }else{
                             //Logic to move to Login Page
                             context.go(RoutePaths.navigator);
                             AuthController.setState("isFirstTime", false);
                           }
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}
