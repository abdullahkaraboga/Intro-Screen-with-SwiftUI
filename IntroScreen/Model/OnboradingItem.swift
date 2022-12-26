//
//  OnboradingItem.swift
//  IntroScreen
//
//  Created by Abdullah Karaboğa on 26.12.2022.
//

import SwiftUI
import Lottie

struct OnboardingItem: Identifiable, Equatable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var lottieView: LottieAnimationView = .init()
}
