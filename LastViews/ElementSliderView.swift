//
//  ElementSliderView.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/19.
//

import SwiftUI
import Charts

struct Element: Equatable {
    let name: String
    let count: Double
    let color: Color
}

@available(iOS 17.0, *)
struct ElementSliderView: View {
    
    @State var selectedData: Element = Element(name: "", count: 0, color: .black)
    
    @State var value: CGFloat = 50
    
    var allElement: [Element] {[
        Element(name: "Oxygen", count: 65, color: .blue),
        Element(name: "Carbon", count: 18, color: .blue),
        Element(name: "Hydrogen", count: 10, color: .blue),
        Element(name: "Nitrogen", count: 3, color: .blue),
        Element(name: "Calcium", count: 1.5, color: .blue),
        Element(name: "Phosphorus", count: 1.0, color: .blue),
        Element(name: "Small Elements", count: 0.9, color: .blue),
        Element(name: "Trace Element", count: 0.6, color: .blue),
        //        FavoriteFruit(name: "カリウム", count: viewModel.value6)
    ]}
    
    var element: [Element] {[
        Element(name: "Oxygen", count: 65, color: .blue),
        Element(name: "Carbon", count: 18, color: .green),
        Element(name: "Hydrogen", count: 10, color: .orange),
        Element(name: "Nitrogen", count: 3, color: .purple),
        //        FavoriteFruit(name: "カリウム", count: viewModel.value6)
    ]}
    
    var element2: [Element] {[
        Element(name: "Calcium", count: 1.5, color: .red),
        Element(name: "Phosphorus", count: 1.0, color: .cyan),
        Element(name: "Small Elements", count: 0.9, color: .yellow),
        Element(name: "Trace Element", count: 0.6, color: .blue),
        //        FavoriteFruit(name: "カリウム", count: viewModel.value6)
    ]}
    
    @State private var selectedCount: Int?
    
    @State private var selectedFruit: Element?
    
    var body: some View {
        
        HStack {
            
            if selectedData.name == "" {
                
//                ScrollView {
                    
                    Text("As we age, changes in body composition occur primarily due to:\n\n1. **Decrease in muscle mass**: Aging leads to a decrease in muscle mass and an increase in fat tissue, altering the overall ratio of muscle to fat in the body.\n\n2. **Loss of bone density**: Bone density tends to decrease with age, resulting in a decrease in bone mass and a shift in overall tissue composition.\n\n3. **Changes in hydration levels**: Aging is associated with a reduction in body water content, affecting tissue and cellular hydration levels, which can impact body composition.\n\n4. **Alterations in metabolic rate**: Metabolic rate tends to decline with age, affecting the body's efficiency in utilizing energy, potentially leading to changes in weight management and energy levels.\n\nThese factors contribute to changes in body tissue proportions and composition as we age, influencing overall bodily function and health. Adopting healthy lifestyle habits such as regular exercise, balanced nutrition, and adequate hydration can help mitigate these changes.")
                        .frame(width: 400,height: 650)
                    
//                }
                
            }
            
            VStack {
                
                Text("Approximate elements that make up the human body")
                    .font(.title3)
                    .bold()
                
                Chart(allElement, id: \.name) { favoriteFruit in
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
                .frame(width: 350, height: 400)
                
                VStack {
                    
                    HStack {
                        
                        ForEach(element, id: \.name) { data in
                            
                            Button {
                                print(data.count)
                                withAnimation {
                                    selectedData = data
                                }
                            } label: {
                                Text(data.name)
                                    .foregroundStyle(.black)
                            }
                            .frame(width: 100, height: 70)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(data.color, lineWidth: 2)
                            )
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        }
                    }
                    
                    HStack {
                        
                        ForEach(element2, id: \.name) { data in
                            
                            Button {
                                print(data.count)
                                withAnimation {
                                    selectedData = data
                                }
                            } label: {
                                Text(data.name)
                                    .foregroundStyle(.black)
                            }
                            .frame(width: 100, height: 70)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(data.color, lineWidth: 2)
                            )
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        }
                    }
                    Text("Tap to see the breakdown.")
                        .foregroundStyle(.gray)
                }
                .padding(.top, 40)
            }
            
            
            
            if selectedData.name == "" {
                
            } else if selectedData.name == "Oxygen" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("Water molecule (H2O) - The primary component of bodily fluids.\nCarbon dioxide (CO2) - Generated through respiration and expelled from the body.\nAs part of oxygen atoms in organic compounds, for example, proteins and lipids.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "Carbon" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("Integral to the fundamental structure of organic compounds, including carbohydrates, lipids, proteins, and other essential nutrients.\nFunctioning as the backbone of biomolecules, crucial for vital biological processes.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "Hydrogen" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                           
                            Text("Water molecule (H2O) - Constituent element of bodily fluids, serving as a primary component of human hydration.\nAs part of the hydrogen atoms in organic compounds, such as proteins and lipids.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "Nitrogen" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("Amino acids - Constituent elements of proteins, serving as the primary building blocks.\nAs part of biomolecules, such as nucleic acids like DNA and RNA.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "Calcium" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("Calcium - The primary component of bones and teeth, maintaining their strength and hardness.\nInvolved in physiological functions such as muscle contraction and nerve transmission.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "Phosphorus" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("Hydroxyapatite - A major component of bones and teeth, involved in the formation and maintenance of skeletal structure along with calcium. \nAlso, it is a constituent of phosphate compounds involved in energy transfer within the body, such as ATP.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "Small Elements" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("Trace elements are those present in relatively large amounts within the human body, comprising over 1 gram of the body weight. \nThese elements include calcium, phosphorus, potassium, sodium, magnesium, and others. \nTrace elements play crucial roles in functions such as skeletal integrity, cellular structure, and physiological processes.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "Trace Element" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Ratio")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("Main reaction and function")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("Trace elements are those that exist only in small amounts within the human body, comprising less than 1 gram of body weight. \nThese elements include zinc, copper, iron, selenium, iodine, among others. \nTrace elements play various roles within the body, such as serving as cofactors for enzymes, participating in hormone synthesis, and maintaining immune function.")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
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
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            }
            
        }
    }
}

