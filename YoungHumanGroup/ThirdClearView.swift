//
//  FinishFirstView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/25.
//

import SwiftUI

@available(iOS 17.0, *)
struct ThirdClearView: View {
    @State var goSecondView = false
    @State var transaction = Transaction()
    @State var finish = false
    @ObservedObject var viewModel: YoungHumanViewModel
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 30) {
                
                    YoungHumanBody(viewModel: .init())
                
                ZStack {
                    
                    VStack {
                        Text("Great! The human body of an average adult is composed of approximately 70-75% water, 12-15% protein, 6-8% carbohydrates, and 15-25% fats.")
                            .font(.system(size: 20, weight: .semibold))
                            .multilineTextAlignment(.center)
                        Text("Let's now examine the relationship between the ratios of atoms constituting these elements, age, and the body!")
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            
                            Button {
                                transaction.disablesAnimations = true
                                viewModel.thirdClear = false
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
                    ElementView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.gray.opacity(0.3))
                }
            }
            
        }
        .frame(width: 900, height: 600)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}

