//
//  CustomTexts.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/21.
//

import SwiftUI

struct Block: View {
    var body: some View {
        ZStack {
            ScrollView{
                VStack(alignment: .leading){

                    BlockTextAnimation(text: "Block Reveal Animation",
                                       font: .custom("Avenir-Black", size: 16),
                                       startTime: 1.0)

                    BlockTextAnimation(text: "秋空を二つに断てり椎大樹",
                                       font: .custom("HiraMinProN-W3", fixedSize: 27),
                                       startTime: 1.0)

                    Image("sampleImage1")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(height: 200)
                        .clipped()

                    BlockTextAnimation(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                       font: .custom("Avenir-Light", fixedSize: 17),
                                       startTime: 1.5)
                        .padding(.top, 50)

                }.padding()
            }
        }
    }
}

struct BlockTextAnimation: View {
    let characters: Array<String.Element>
    var font: Font

    @State var rectHeight: CGFloat = 0.1
    @State var pathWidth: CGFloat = 100
    @State var pathHeight: CGFloat = 100

    @State var rectScale: Double = 0.0
    @State var rectAnchor: UnitPoint = .leading

    @State var textOpacity: Double = 0.0

    var baseTime: Double = 1.0

    init(text: String, font: Font, startTime: Double) {
        self.characters = Array(text)
        self.font = font
        self.baseTime = startTime
    }

    var body: some View {
        ZStack {
            Text(String(characters))
                .multilineTextAlignment(.center)
                .font(font)
                .opacity(textOpacity)
                .background(GeometryReader{ geometry -> Text in
                    // NavigationLinkなどで遷移した際、
                    // 正しく描画後のサイズが取れないことがあるのでバッファ時間を設ける
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        rectHeight = geometry.frame(in: .local).height
                        pathWidth = geometry.frame(in: .local).width
                        pathHeight = geometry.frame(in: .local).height
                    }
                    return Text("")
                })

            Rectangle()
                .scale(x: rectScale, y: 1, anchor: rectAnchor)
                .frame(width: pathWidth, height: pathHeight, alignment: .center)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 + baseTime) {
                        withAnimation(.easeInOut) {
                            rectScale = 1
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 + baseTime) {
                        textOpacity = 1.0
                        rectAnchor = .trailing
                        withAnimation(.easeInOut){
                            rectScale = 0.0
                        }
                    }
                }
        }
        .onTapGesture {
            blockAnimation()
        }
    }

    func blockAnimation(){
        rectAnchor = .leading
        textOpacity = 0.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeInOut) {
                rectScale = 1
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            textOpacity = 1.0
            rectAnchor = .trailing
            withAnimation(.easeInOut){
                rectScale = 0.0
            }
        }
    }
}
