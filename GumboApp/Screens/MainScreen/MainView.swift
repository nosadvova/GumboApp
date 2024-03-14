//
//  MainView.swift
//  GumboApp
//
//  Created by Vova Novosad on 09.03.2024.
//

import SwiftUI


struct MainView: View {
    @State private var showGif = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gumbo
                    .ignoresSafeArea()
                
                if showGif {
                    GifView(name: "GumboGif")
                        .frame(width: 600, alignment: showGif ? .center : .top)
                        .ignoresSafeArea()
                } else {
                    informationView
                }
            }
            .animation(.spring(), value: showGif)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
                    withAnimation {
                        showGif = false
                    }
                }
            })
        }
    }
}

extension MainView {
    @ViewBuilder
    var informationView: some View {
        VStack {
            Image("GumboMainScreen")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: 390)
                .mask {
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                }
            
            Text("BR4ted")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            
            Text("X")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .bold()
                .padding(10)
            
            Text("GUMBO WORLD")
                .font(.largeTitle)
                .bold()
                .fontDesign(.rounded)
                .foregroundStyle(.white)
            
            Spacer()
            
            NavigationLink(destination: ChooseMoodView()) {
                HStack {
                    Text("Continue")
                    
                    Image(systemName: "arrow.right")
                }
                .frame(width: 240, height: 50)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
            }
        }
        
    }
}


#Preview {
    MainView()
}
