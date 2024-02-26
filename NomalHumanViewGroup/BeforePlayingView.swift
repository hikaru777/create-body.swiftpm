//
//  BeforePlayingView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/25.
//

import SwiftUI
import AVKit

struct BeforePlayingView: View {
    @ObservedObject var viewModel: viewModel
    
    var player: AVPlayer = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "movie", ofType: "mov")!))
    var body: some View {
        
        ZStack {
            
            HStack {
                
                VStack(spacing: 40) {
                    Text("Let's try to compose the elements for this body!")
                        .font(.custom("Avenir-Black", size: 20))
//                    BlockTextAnimation(text: "Let's try to compose the elements for this body!",
//                                       font: .custom("Avenir-Black", size: 21),
//                                       startTime: 0.3)
                    
                    HumanImage(viewModel: .init())
                    
                }
                
                
                ZStack {
                    VStack(alignment: .center) {
                        
                        VStack(spacing: 30) {
                            
                            Text("First, let's try making one element complete in the body.")
                                .font(.system(size: 20, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .frame(height: 60)
                            
                            Button {
                                UserDefaults.standard.setValue(true, forKey: "a")
                                viewModel.firstExpress = true
                                
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
