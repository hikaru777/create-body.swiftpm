//
//  HumanImage.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/16.
//

import SwiftUI

struct OldHumanBody: View {
    @ObservedObject var viewModel: OldHumanViewModel
    var body: some View {
        
        VStack(spacing: -20) {
            
            ZStack {
                
                Path(ellipseIn: CGRect(x:0, y: 0, width: 140, height: 140))
                    .fill(viewModel.color)
                    .frame(width: 140, height: 140)
                
                Rectangle()
                    .frame(width: 3,height: 40)
                    .foregroundStyle(.black)
                    .rotationEffect(.degrees(45))
                    .padding(.trailing, 40)
                    .padding(.top, 20)
                
                Rectangle()
                    .frame(width: 3,height: 40)
                    .foregroundStyle(.black)
                    .rotationEffect(.degrees(315))
                    .padding(.leading, 40)
                    .padding(.top, 20)
                
            }
            .padding(.bottom, -60)
            
            HStack(spacing: 3) {
                ZStack {
                    Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                        .fill(viewModel.color)
                        .frame(width: CGFloat(viewModel.roundWeight), height: 120)
                        .rotationEffect(.degrees(20))
                        .padding(.bottom, 60)
                    Rectangle()
                        .fill(Color.brown)
                        .frame(width:20, height: 200)
                        .padding(.top, 130)
                }
                
                Path(ellipseIn: CGRect(x:0, y: 0, width: CGFloat(viewModel.weight), height: 170))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.weight), height: 200)
                    .padding(.bottom, 25)
                
                    Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                        .fill(viewModel.color)
                        .frame(width: CGFloat(viewModel.roundWeight), height: 120)
                        .rotationEffect(.degrees(160))
                        .padding(.bottom, 60)
                
            }
            
            HStack(spacing: 10) {
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.roundWeight), height: 120)
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.roundWeight), height: 120)
            }
            .padding(.top, -100)
            
        }
    }
}

#Preview() {
    OldHumanBody(viewModel: .init())
}
