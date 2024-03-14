//
//  ChooseMoodView.swift
//  GumboApp
//
//  Created by Vova Novosad on 09.03.2024.
//

import SwiftUI

struct ChooseMoodView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mood
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
                    
                    Spacer()
                    
                    Text("Choose your mood today")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    NavigationLink {
                        QuoteView(quote: .happy)
                    } label: {
                        Image("gumbo-fine")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }

                    
                    
                    NavigationLink {
                        QuoteView(quote: .uplifting)
                    } label: {
                        Image("gumbo-ass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .offset(x: -10)
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ChooseMoodView()
}
