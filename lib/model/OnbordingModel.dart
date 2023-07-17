class OnboardingData {
  List<OnboardingData>? onboardingData;

  OnboardingData({this.onboardingData});

  OnboardingData.fromJson(Map<String, dynamic> json) {
    if (json['onboardingData'] != null) {
      onboardingData = <OnboardingData>[];
      json['onboardingData'].forEach((v) {
        onboardingData!.add(new OnboardingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.onboardingData != null) {
      data['onboardingData'] =
          this.onboardingData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Onboarding {
  String? imageurl;
  String? title;
  String? disc;

  Onboarding({this.imageurl, this.title, this.disc});

  Onboarding.fromJson(Map<String, dynamic> json) {
    imageurl = json['imageurl'];
    title = json['title'];
    disc = json['disc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageurl'] = this.imageurl;
    data['title'] = this.title;
    data['disc'] = this.disc;
    return data;
  }
}