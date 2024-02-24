//
//  ChartView.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/17.
//

import SwiftUI

struct ChartView: View {
    
    @ObservedObject var viewModel: viewModel
    @State var opacity: Double = 0
    @State var showInfoView: Bool = false
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    @State var data: problemArray!
    
    var body: some View {
        ScrollView {
            
            ForEach(viewModel.problemArray, id: \.number) { index in
                
                makeSection(section: index)
                
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                    .onTapGesture {
                        print(index.number)
                        data = index
                        
                        showInfoView.toggle()
                    }
                    .sheet(isPresented: $showInfoView) {
                        if let data = data {
                            
                            Infoview(data: data)
                            
                        }
                        
                    }
            }
            .padding()
        }
    }
    
    struct Infoview: View {
        
        @State var data: problemArray
        @Environment(\.dismiss) private var dismiss
        var body: some View {
            ZStack {
                
                VStack {
                    
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("起こりうる問題")
                            .font(.body)
                            .foregroundStyle(.gray)
                            .padding(.bottom)
                        
                        Text(data.subTitle)
                            .font(.headline)
                        
                    }
                    .padding(30)
                    .padding(.bottom, 20)
                }
                
                HStack {
                    
                    VStack {
                        Text(data.title)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(40)
                        Spacer()
                    }
                    
                    Spacer()
                    VStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                        .padding()
                        Spacer()
                    }
                }
                
            }
        }
    }
    
    //カスタムcell
    
    @ViewBuilder
    func makeSection(section: problemArray) -> some View {
        
        VStack(alignment: .leading) {
            
            Text(section.title)
                .font(.system(size: 24, weight: .bold))
                .frame(width: 160, alignment: .leading)
                .foregroundColor(.white)
            
            Text(section.text)
                .font(.system(size: 15, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.all, 20)
        .frame(width: 450)
        .background(section.color.opacity(0.5))
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
    
    
    
}
