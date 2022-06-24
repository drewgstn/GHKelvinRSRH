//
//  OnBoardingTest.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/12/22.
//

import Foundation
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: LaunchView().environmentObject(ViewLaunch()))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

struct OnboardingView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    var body: some View {
        VStack {
            Spacer()
                Text("What's New")
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
                    .frame(width: 300, alignment: .leading)
        
                
                VStack(alignment: .leading) {
                    NewDetail(image: "heart.fill", imageColor: .pink, title: "More Personalized", description: "Top Stories picked for you and recommendations from siri.")
                    NewDetail(image: "paperclip", imageColor: .red, title: "New Spotlight Tab", description: "Discover great stories selected by our editors.")
                    NewDetail(image: "play.rectangle.fill", imageColor: .blue, title: "Video In Today View", description: "The day's best videos, right in the News widget.")
            }

            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(true, forKey: "LaunchBefore")
                withAnimation(){
                    self.viewlaunch.currentPage = "ContentView"
                }
            }){
            Text("Next")
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: 350, height: 60)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.top, 50)
            }
        }
    }
}

struct NewDetail: View {
    var image: String
    var imageColor: Color
    var title: String
    var description: String

    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Image(systemName: image)
                    .font(.system(size: 50))
                    .frame(width: 50)
                    .foregroundColor(imageColor)
                    .padding()

                VStack(alignment: .leading) {
                    Text(title).bold()
                
                    Text(description)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(width: 340, height: 100)
        }
    }
}

struct LaunchView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch

    var body: some View {
        VStack {
            if viewlaunch.currentPage == "onBoardingView" {
                OnboardingView()
            } else if viewlaunch.currentPage == "ConvertView" {
                ConvertView()
            }
        }
    }
}

class ViewLaunch: ObservableObject {

    init() {
        if !UserDefaults.standard.bool(forKey: "LaunchBefore") {
                currentPage = "onBoardingView"
        } else {
            currentPage = "ConvertView"
        }
    }
    @Published var currentPage: String
}
