//
//  FunctionDescriptionView.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/26.
//

import SwiftUI
import AVFoundation

@available(iOS 17.0, *)
struct FunctionDescriptionView: View {
    @State var play = false
    var player: AVPlayer = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "movie", ofType: "mov")!))
    var body: some View {
        
        ZStack {
            
            VStack() {
                
                PlayerView(player: self.player)
                    .frame(width: 700)
                    .ignoresSafeArea()
                    .onAppear {
                        player.play()
                        movieStart()
                    }
                    .padding(.bottom, -20)
                
                Text("When the elements constituting the human body are insufficient, the color of the doll changes to a lighter shade representing the deficient element, and when they are in excess, the color intensifies. \n\nUse this as a guide to determine the correct proportion of elements. Additionally, by pressing the 『 Anomalous Condition Button 』, you can gain detailed insights into the effects of variations in element levels on the body. \n\nFinally, there's a quiz about the human body, so feel free to try out various patterns!")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 1000)
                    .padding(.bottom, 100)
            }
            
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        play.toggle()
                    } label: {
                        HStack {
                            
                            Text("Let's Play !")
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
                    .fullScreenCover(isPresented: $play) {
                        ContentView(viewModel: .init())
                    }

                }
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
    private func movieStart() {
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            self.player.seek(to: .zero)
        }
    }
}

struct PlayerView: UIViewRepresentable {
    let player: AVPlayer
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(player: player)
    }
    
}
