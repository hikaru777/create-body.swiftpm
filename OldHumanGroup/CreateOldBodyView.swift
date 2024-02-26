//
//  SwiftUIView.swift
//  
//
//  Created by 本田輝 on 2024/02/26.
//

import SwiftUI
import Charts

@available(iOS 17.0, *)
struct CreateOldBodyView: View {
    
    @State var weight = 130
    
    @State var color: Color = .yellow
    
    @State var opacity: Double = 0
    
    @State var graphOpacity: Double = 1
    
    @ObservedObject var viewModel: OldHumanViewModel
    
    @State var isPresented = false
    
    @State var showElementView = false
    
    @State var elementViewOpacity: Double = 0
    
    @State var showDrawView = 0
    
    var favoriteFruits: [FavoriteFruit] {[
        FavoriteFruit(name: "water", count: viewModel.value0),
        FavoriteFruit(name: "protein", count: viewModel.value1),
        FavoriteFruit(name: "carbohydrates", count: viewModel.value2),
        FavoriteFruit(name: "lipid", count: viewModel.value3),
        FavoriteFruit(name: "other substances", count: 5),
    ]}
    
    @State private var selectedCount: Int?
    
    @State private var selectedFruit: FavoriteFruit?
    
    var body: some View {
        
        ZStack {
            
            HStack {
                Spacer()
                
            }
            .padding(.top, 10)
            .padding(.leading, 30)
            
            HStack() {
                
                Spacer()
                
                VStack(spacing: 60) {
                        
                    if !viewModel.problems.isEmpty {
                        
                        HStack {
                            
                            Text("Anomalous condition")
                            
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundStyle(.red)
                            
                            
                            Image(systemName: isPresented ? "lessthan" : "greaterthan")
                                .foregroundStyle(.gray)
                            
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                        .onTapGesture {
                            isPresented.toggle()
                        }
                        .opacity(viewModel.problems.isEmpty ? 0 : 1)
                        .disabled(viewModel.problems.isEmpty)
                        
                    } else {
                        
                        HStack {
                            
                            Text("grate! Go next!")
                            
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.green)
                            
                            
                            Image(systemName: isPresented ? "lessthan" : "greaterthan")
                                .foregroundStyle(.gray)
                            
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                        .onTapGesture {
                            viewModel.secondClear.toggle()
                        }
                        .opacity(viewModel.problems.isEmpty ? 1 : 0)
                    }
                        
                    
                    OldHumanBody(viewModel: viewModel)
                    
                }
                .padding(.bottom, 80)
                .padding(.top)
                
                Spacer()
                
                VStack(spacing: 20) {
                    
                    if isPresented {
                        
                        if !viewModel.problems.isEmpty {
                            
                            ZStack {
                                
                                OldChartView(viewModel: viewModel, isPresented: $isPresented)
                                    .frame(width: 500, height: 700)
                                    .opacity(self.opacity)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(15)
                                    .onAppear {
                                        withAnimation(.linear(duration: 0.3)) {
                                            // NOTE: opacityを変更する画面再描画に対してアニメーションを適用する
                                            graphOpacity = 0
                                            self.opacity = 1.0
                                        }
                                    }
                                    .onDisappear {
                                        withAnimation {
                                            self.opacity = 0
                                            graphOpacity = 1
                                            viewModel.weight = 130
                                            viewModel.roundWeight = 70
                                        }
                                    }
                                
                            }
                            
                        } else {
                            
                            
                            Text("Grate!")
                                .frame(width: 500, height: 600)
                                .opacity(self.opacity)
                                .background(.ultraThinMaterial)
                                .cornerRadius(15)
                                .onAppear {
                                    withAnimation(.linear(duration: 0.3)) {
                                        graphOpacity = 0
                                        self.opacity = 1.0
                                    }
                                }
                                .onDisappear {
                                    withAnimation {
                                        self.opacity = 0
                                        graphOpacity = 1
                                        viewModel.weight = 130
                                        viewModel.roundWeight = 70
                                    }
                                }
                            
                        }
                        
                    } else {
                        
                        VStack {
                            
                            VStack() {
                                
                                ZStack {
                                    
                                    if let selectedFruit = selectedFruit {
                                        
                                        Text(String(format: "%.1f", selectedFruit.count))
                                        
                                    }
                                    
                                    Chart(favoriteFruits, id: \.name) { favoriteFruit in
                                        SectorMark(
                                            angle: .value("count", favoriteFruit.count),
                                            innerRadius: .inset(50),
                                            outerRadius: selectedFruit == favoriteFruit ? .automatic : .inset(10),
                                            angularInset: 3.0
                                        )
                                        .foregroundStyle(by: .value("name", favoriteFruit.name))
                                        .opacity(selectedFruit == nil ? 1.0 : selectedFruit == favoriteFruit ? 1.0 : 0.5)
                                    }
                                    .chartAngleSelection(value: $selectedCount)
                                    
                                    .frame(width: 390, height: 390)
                                }
                                .padding(.bottom, 50)
                                
                                OldSliderView(viewModel: viewModel)
                                    .onChange(of: viewModel.value0) {
                                        viewModel.changedValue0()
                                    }
                                    .onChange(of: viewModel.value1) {
                                        viewModel.changedValue1()
                                    }
                                    .onChange(of: viewModel.value2) {
                                        viewModel.changedValue2()
                                    }
                                    .onChange(of: viewModel.value3) {
                                        viewModel.changedValue3()
                                    }
                                
                            }
                            .frame(width: 500, height: 700)
                            .opacity(graphOpacity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                        }
                    }
                    
                }
            }
            .padding(.trailing, 100)
            
            if !viewModel.secondExpress {
                
                SecondView(viewModel: viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
                
            }
            
            if viewModel.secondClear {
                
                SecondClearView(viewModel: viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
                
            }
        }
    }
}
