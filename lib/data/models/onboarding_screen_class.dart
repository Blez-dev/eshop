class OnboardingScreenClass {
  final String image;
  final String title;
  final String description;

  OnboardingScreenClass({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingScreenClass> items = <OnboardingScreenClass>[
  OnboardingScreenClass(
    image: "assets/images/onboardingFirstPic.png",
    title: "Buy and Sell Phones Easily",
    description: "Explore a wide range of smartphones from trusted sellers, or list your own device for sale in just a few taps.",
  ),
  OnboardingScreenClass(
    image: "assets/images/onboardingSecondPic.png",
    title: "Connect with Real Sellers",
    description: "Chat directly with verified sellers and buyers, negotiate prices, and make secure deals all in one place.",
  ),
  OnboardingScreenClass(
    image: "assets/images/onboardingThirdPic.png",
    title: " Simplified Marketplace",
    description: "Enjoy a smooth, user-friendly experience designed to make phone trading fast, safe, and hassle-free.",
  ),
];
