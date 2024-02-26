//
//  secondView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/25.
//

import SwiftUI

struct SecondView: View {
    @ObservedObject var viewModel: OldHumanViewModel
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 30) {
                
                VStack(spacing: 40) {
                    Text("Let's create this elderly body next!")
                        .font(.custom("Avenir-Black", size: 20))

                    OldHumanBody(viewModel: .init())
                    
                }
                
                
                ZStack {
                    VStack(alignment: .center) {
                        
                        
                        VStack {
                            
                            Text("Wouldn't you think the previous body structure remains relatively unchanged? \nActually, it undergoes quite a few changes. Let's explore this as well.")
                                .font(.system(size: 20, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Button {
                                viewModel.secondExpress.toggle()
                                
                                viewModel.changedValue0()
                                viewModel.changedValue1()
                                viewModel.changedValue2()
                                viewModel.changedValue3()
                                
                                viewModel.problems.forEach { data in
                                    print(data.title)
                                }
                            } label: {
                                Text("Let's play")
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
                        .padding(.vertical, 50)
                    }
                    .padding(.horizontal)
                }
                .frame(width: 400, height: 500)
                .background(.white)
                .cornerRadius(15)
            }
            
        }
        .frame(width: 900, height: 600)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}
