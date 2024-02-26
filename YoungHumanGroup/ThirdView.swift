//
//  secondView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/25.
//

import SwiftUI

struct ThirdView: View {
    @ObservedObject var viewModel: YoungHumanViewModel
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 20) {
                
                VStack(spacing: 40) {
                    Text("Let's create the body of this infant next!")
                        .font(.custom("Avenir-Black", size: 20))

                    YoungHumanBody(viewModel: .init())
                    
                }
                
                
                ZStack {
                    VStack(alignment: .center) {
                        
                        
                        VStack {
                            
                            Text("Simply aging from an adult to an elderly person results in significant differences in the body's water content and other factors. Now, what about infants? Let's explore.")
                                .font(.system(size: 20, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Button {
                                viewModel.thirdExpress.toggle()
                                
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
