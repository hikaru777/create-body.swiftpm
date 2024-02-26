//
//  FinishFirstView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/25.
//

import SwiftUI

@available(iOS 17.0, *)
struct SecondClearView: View {
    @State var goSecondView = false
    @State var transaction = Transaction()
    @ObservedObject var viewModel: OldHumanViewModel
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 30) {
                
                OldHumanBody(viewModel: .init())
                
                ZStack {
                    
                    VStack {
                        Text("Fantastic! The human body of an average adult is composed of approximately 45-60% water, 10-20% protein, 6-10% carbohydrates, and 20-30% fats.")
                            .font(.system(size: 20, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding()
                        Text("Next, let's examine the composition of an infant's body.")
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            
                            Button {
                                transaction.disablesAnimations = true
                                viewModel.secondClear = false
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
                    CreateYoungBodyView(viewModel: .init())
                }
            }
            
        }
        .frame(width: 900, height: 600)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}

