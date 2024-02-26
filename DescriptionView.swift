//
//  DescriptionView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/25.
//

import SwiftUI

@available(iOS 17.0, *)
struct DescriptionView: View {
    
    @State var showYesView = false
    @State var showNoView = false
    @ObservedObject var viewModel: viewModel
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 50) {
                
                HStack(spacing: 30) {
                    
                    Image("Image 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    
                    Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    
                    Image("Image 2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                }
                
                VStack(spacing: 30) {
                    BlockTextAnimation(text: "Do you know what the human body is made of and how it is composed in what proportions?",
                                       font: .bold(.title2)(),
                                       startTime: 0.3)
                    BlockTextAnimation(text: "In this game, you can learn about the composition and mechanisms of the body, \nas well as the physical issues caused by their proportions.",
                                       font: .bold(.title3)(),
                                       startTime: 1.0)
                }
                
            }
            .padding(.bottom, 150)
            
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        UserDefaults.standard.setValue(false, forKey: "a")
                        showYesView = true
                    } label: {
                        HStack {
                            
                            Text("Next")
                                .font(.title)
                                .foregroundStyle(.black)
                            
                        }
                    }
                    .padding(50)
                    .frame(height: 70)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 2)
                    )
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
            }
            .padding(30)
            
            if showYesView {
                FunctionDescriptionView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
            }
        }
    }
}
