//
//  FinishFirstView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/25.
//

import SwiftUI

@available(iOS 17.0, *)
struct FinishFirstView: View {
    @State var goSecondView = false
    @State var transaction = Transaction()
    @ObservedObject var viewModel: viewModel
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 30) {
                
                    HumanImage(viewModel: .init())
                
                ZStack {
                    
                    VStack {
                        Text("Correct. The human body of an average adult is composed of approximately 50-65% water, 15-25% protein, 5-10% carbohydrates, and 5-20% fats.")
                            .font(.system(size: 20, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding()
                        Text("Next, let's examine the composition of an elderly person's body.")
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            
                            Button {
                                transaction.disablesAnimations = true
                                viewModel.firstClear = false
                            } label: {
                                Text("← Back")
                                    .foregroundStyle(.black)
                            }
                            .frame(height: 50)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.blue, lineWidth: 2)
                            )
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            
                            Button {
                                transaction.disablesAnimations = true
                                goSecondView.toggle()
                            } label: {
                                Text("Next →")
                                    .foregroundStyle(.black)
                            }
                            .frame(height: 50)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.blue, lineWidth: 2)
                            )
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            
                        }
                    }
                    
                }
                .frame(width: 400, height: 500)
                .background(.white)
                .cornerRadius(15)
                .fullScreenCover(isPresented: $goSecondView) {
                    CreateOldBodyView(viewModel: .init())
                }
            }
            
        }
        .frame(width: 900, height: 600)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}
