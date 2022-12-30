//
//  OnboardingScreen.swift
//  IntroScreen
//
//  Created by Abdullah Karaboğa on 26.12.2022.
//

import SwiftUI
import Lottie

struct OnboardingScreen: View {

    @State var onboardingItems: [OnboardingItem] = [
            .init(title: "What is Lorem Ipsum?", subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", lottieView: .init(name: "cat1", bundle: .main)),
            .init(title: "Where does it come from?", subTitle: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ", lottieView: .init(name: "cat2", bundle: .main)),
            .init(title: "Why do we use it?", subTitle: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", lottieView: .init(name: "cat3", bundle: .main)),

    ]

    @State var currentIndex: Int = 0


    var body: some View {

        GeometryReader {
            let size = $0.size

            HStack(spacing: 0) {
                ForEach($onboardingItems) { $item in

                    let isLastSlide = (currentIndex == onboardingItems.count - 1)

                    VStack {
                        HStack {
                            Button("Back") {

                                if currentIndex > 0 {
                                    currentIndex -= 1
                                    playAnimation()
                                }

                            }
                            .opacity(currentIndex > 0 ? 1 : 0)
                            
                            Spacer(minLength: 0)
                            Button("Skip") {

                                currentIndex = onboardingItems.count - 1
                                playAnimation()

                            }
                            .opacity(isLastSlide ? 0 : 1)
                        }
                            .animation(.easeOut, value: currentIndex)
                            .tint(.blue)
                            .fontWeight(.bold)
                        VStack(spacing: 15) {
                            let offset = -CGFloat(currentIndex) * size.width
                            ResizableLottieView(onboardingItem: $item)
                                .frame(height: size.width)
                                .onAppear {
                                if currentIndex == indexOf(item) {
                                    item.lottieView.play(toProgress: 0.7)
                                }
                            }.offset(x: offset)
                                .animation(.easeOut(duration: 0.5), value: currentIndex)
                            Text(item.title).font(.title.bold())
                                .offset(x: offset)
                                .animation(.easeOut(duration: 0.5).delay(0.1), value: currentIndex)
                            Text(item.subTitle).font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 15)
                                .foregroundColor(.gray)
                                .offset(x: offset)
                                .animation(.easeOut(duration: 0.5).delay(0.2), value: currentIndex)
                        }

                        Spacer(minLength: 0)
                        VStack(spacing: 15) {

                            Text(isLastSlide ? "Login" : "Next")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical,12)
                                .frame(maxWidth: .infinity)
                                .background {
                                Capsule().fill(.blue)
                            }.padding(.horizontal, 50)
                                .onTapGesture {
                                if currentIndex < onboardingItems.count - 1 {

                                    let currentProgress = onboardingItems [currentIndex].lottieView.currentProgress

                                    onboardingItems[currentIndex].lottieView.currentProgress = (currentProgress == 0 ? 0.7 : currentProgress)


                                    currentIndex += 1
                                    playAnimation()

                                }
                            }

                            VStack (spacing: 15) {

                                Text("Terms and Service")

                                Text("Privacy Policy")
                            }.font(.caption2).underline(true, color: .black).offset(y: 5)

                        }

                    }
                    
                        .padding(15)
                        .frame(width: size.width, height: size.height)
                }

            }
                .frame(width: size.width * CGFloat(onboardingItems.count), alignment: .leading)
        }
    }

    func playAnimation() {
        onboardingItems[currentIndex].lottieView.currentProgress = 0
        onboardingItems[currentIndex].lottieView.play(toProgress: 1)
    }

    func indexOf(_ item: OnboardingItem) -> Int {
        if let index = onboardingItems.firstIndex(of: item) {
            return index
        }
        return 0
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ResizableLottieView: UIViewRepresentable {
    @Binding var onboardingItem: OnboardingItem
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        setupLottieView(view)
        return view

    }
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func setupLottieView(_ to: UIView) {

        let lottieView = onboardingItem.lottieView
        lottieView.backgroundColor = .clear
        lottieView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor),

        ]

        to.addSubview(lottieView)
        to.addConstraints(constraints)

    }
}
