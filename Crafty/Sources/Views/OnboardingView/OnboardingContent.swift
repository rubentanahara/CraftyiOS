//
//  OnboardingContent.swift
//  FoodNinja
//
//  Created by Imran on 27/12/23.
//

import SwiftUI

struct OnboardingPage {
    let imageName: ImageName
    let title: String
    let description: String
}

struct OnboardingContent: View {
    let page: OnboardingPage
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            
            
            Image(name: page.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .offset(y: isAnimating ? 20 : 0)
                .animation(
                    .easeInOut(duration: 5)
                    .repeatForever(autoreverses: true),
                    value: isAnimating)
                .opacity(isAnimating ? 1 : 0)
           
            
            Text(page.title)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
                .opacity(isAnimating ? 1 : 0)
            
            Text(page.description)
                .font(.system(size:14, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
                .opacity(isAnimating ? 1 : 0)
            
        }
        .foregroundColor(Color("WHITE_SECONDARY"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.accentColor)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1)) {
                isAnimating = true
            }
        })
    }
}

#Preview {
    OnboardingContent(page: OnboardingPage(imageName: .CRAFTY_LOGO, title: "Find your  Comfort Food here", description: "Here You Can find a chef or dish for every taste and color. Enjoy!"))
}
