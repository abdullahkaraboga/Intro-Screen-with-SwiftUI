//
//  OnboardingScreen.swift
//  IntroScreen
//
//  Created by Abdullah Karaboğa on 26.12.2022.
//

import SwiftUI
import Lottie

struct OnboardingScreen: View {
    
    @State var onboardingItems : [OnboardingItem] = [
        .init(title: "Request Pickup", subTitle: "Subtitle Text",lottieView: .init(name : "cat-1",bundle: .main)),
        .init(title: "Request Pick", subTitle: "Subtitle Te",lottieView: .init(name : "cat-2",bundle: .main)),
        .init(title: "Request ", subTitle: "Subtitle ",lottieView: .init(name : "cat-3",bundle: .main)),
    
    ]
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
