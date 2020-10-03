//
//  ContentView.swift
//  LunchScreenAnimation
//
//  Created by Magizhan on 03/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animate: Bool = false
    @State private var doneSplash:Bool = false
    
    var body: some View {
        ZStack{
            Home()
            ZStack{
                Color("bgColor")

                Image("instalogo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                    .scaleEffect(animate ? 10: 1)
                    .frame(width: UIScreen.main.bounds.width)

            }
            .ignoresSafeArea()
            .onAppear(perform: {
                splashAnimation()
            })
            .opacity(doneSplash ? 0 : 1)
        }
    }
    
    func splashAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            withAnimation(Animation.easeOut(duration: 0.80)){
                animate.toggle()
            }
            
            withAnimation(Animation.easeIn(duration: 0.60)){
                doneSplash.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    var body: some View{
        VStack {
            Spacer()
                Text("Welcome")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            
        }
        
    }
}
