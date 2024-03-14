//
//  QuoteView.swift
//  GumboApp
//
//  Created by Vova Novosad on 09.03.2024.
//

import SwiftUI

enum QuoteMood {
    case happy
    case uplifting
    
    var quote: String {
        switch self {
        case .happy:
            ["Happiness is a warm bowl of gumbo and a fuzzy beaver hug.",
             "Life's a spicy adventure, just like a good gumbo. You never know what amazing flavor is next!",
             "Gumbo days are the best days! Even if you spill a little, a beaver smile makes it all better.",
             "A beaver without a bowl of gumbo is like a sky without sunshine... something's just missing.",
             "The secret ingredient to happiness? A generous spoonful of gumbo and a whole lot of beaver laughter."]
                .randomElement()!
        case .uplifting:
            ["You're stronger than you think, just like a well-seasoned gumbo.",
             "Just like a gumbo gets better with time, you do too! Keep simmering, my beaver friend.",
             "Believe in yourself, and always remember, you've got the spice to achieve anything – just like the perfect gumbo.",
             "Even when you make a mistake, it's just a new flavor in the gumbo of life. Keep stirring!",
             "It's okay to take a break sometimes. Just curl up like a beaver with a big bowl of gumbo and recharge."]
                .randomElement()!
        }
    }
}

struct QuoteView: View {
    @Environment(\.dismiss) var dismiss
    
    let quote: QuoteMood
    
    @State private var displayedText = ""
    @State private var isTyping = true
    @State private var letters: [String] = []
    let typingInterval = 0.07
    
    var body: some View {
        ZStack {
            Color.quote
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 20, height: 20)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                }
                
                HStack(alignment: .bottom) {
                    Text(displayedText)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(10)
                    
                    if isTyping {
                        TypingIndicatorView()
                    }
                }
                .padding(EdgeInsets(top: 50, leading: 10, bottom: 0, trailing: 10))
                .onAppear {
                    animate()
                }
                
                Spacer()
                
                Image("GumboSleep")
                    .resizable()
                    .scaledToFit()
                    .opacity(isTyping ? 0 : 1)
                    .animation(.easeInOut(duration: 1.5), value: isTyping)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension QuoteView {
    
    private func animate() {
        isTyping = true
        letters = []
        letters = Array(quote.quote).map { String($0) }
        loop()
    }
    
    private func loop() {
        if !letters.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + typingInterval) {
                displayedText += letters.removeFirst()
                loop()
            }
        } else {
            isTyping = false
        }
        
    }
}

struct TypingIndicatorView: View {
    @State private var opacity = 0.0
    
    var body: some View {
        Circle().frame(width: 5, height: 5)
            .opacity(opacity)
            .animation(.easeInOut(duration: 0.5).repeatForever(), value: opacity)
            .onAppear { opacity = 1.0 }
    }
}

#Preview {
    QuoteView(quote: .happy)
}
