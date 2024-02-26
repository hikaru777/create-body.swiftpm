//
//  SwiftUIView.swift
//  
//
//  Created by 本田輝 on 2024/02/26.
//

import SwiftUI

struct OldChartView: View {
    
    @ObservedObject var viewModel: OldHumanViewModel
    @State var opacity: Double = 0
    @State var showInfoView: Bool = false
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    @State var data: problemArray!
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                ForEach(viewModel.problems, id: \.number) { index in
                    
                    makeSection(section: index)
                    
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                        .onTapGesture {
                            print(index.number)
                            data = index
                            viewModel.data = data
                            showInfoView.toggle()
                        }
                        .disabled(showInfoView)
                        .sheet(isPresented: $showInfoView) {
                            if data != nil {
                                
                                Infoview(viewModel: viewModel)
                                
                            }
                            
                        }
                }
                .padding()
                .padding(.top, 20)
                
            }
        }
    }
    
    struct Infoview: View {
        
        @ObservedObject  var viewModel: OldHumanViewModel
        @Environment(\.dismiss) private var dismiss
        var body: some View {
            ZStack {
                
                VStack {
                    
                    HStack(alignment: .top) {
                        Text(viewModel.data.title)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(40)
                        
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                        .padding()
                        
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Potential problems")
                            .font(.body)
                            .foregroundStyle(.gray)
                            .padding(.bottom)
                        
                        ScrollView {
                            
                            Text(viewModel.data.subTitle)
                                .font(.headline)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    
                    Spacer()
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
                .frame(width: 400, alignment: .leading)
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
