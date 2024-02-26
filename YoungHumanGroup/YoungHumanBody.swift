//
//  HumanImage.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/16.
//

import SwiftUI

struct YoungHumanBody: View {
    @ObservedObject var viewModel: YoungHumanViewModel
    var body: some View {
        
        VStack(spacing: -10) {
            Path(ellipseIn: CGRect(x:0, y: 0, width: 100, height: 100))
                .fill(viewModel.color)
                .frame(width: 100, height: 100)
            
            HStack(spacing: 3) {
                
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 80))
                        .fill(viewModel.color)
                        .frame(width: CGFloat(viewModel.roundWeight), height: 80)
                        .rotationEffect(.degrees(20))
                        .padding(.bottom, 60)
                
                Path(ellipseIn: CGRect(x:0, y: 0, width: CGFloat(110), height: 140))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(110), height: 140)
                    .padding(.bottom, 25)
                
                    Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 80))
                        .fill(viewModel.color)
                        .frame(width: CGFloat(viewModel.roundWeight), height: 80)
                        .rotationEffect(.degrees(160))
                        .padding(.bottom, 60)
                
            }
            
            HStack(spacing: 10) {
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 80))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.roundWeight), height: 80)
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 80))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.roundWeight), height: 80)
            }
            .padding(.top, -20)
            
        }
    }
}

