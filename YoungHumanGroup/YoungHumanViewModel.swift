//
//  OldHumanViewModel.swift
//  HowToBuildAHumanBody
//
//  Created by 本田輝 on 2024/02/26.
//

import Foundation
import UIKit
import SwiftUI


class YoungHumanViewModel: NSObject, ObservableObject {
    
    @Published var value0: Double = 100
    @Published var value1: Double = 0
    @Published var value2: Double = 100
    @Published var value3: Double = 0
    @Published var weight: Int = 110
    @Published var roundWeight: Int = 70
    @Published var color: Color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
    @Published var loding = false
    @Published var currentValue: Double = 5
    @Published var problems: [problemArray] = []
    @Published var data: problemArray!
    @Published var thirdExpress = false
    @Published var thirdClear = false
    
    var width: CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    
    func changedValue0() {
        if value0 >= 75 {
            
            if !problems.contains(where: { $0.number == 1 }) {
                
                problems.append(problemArray(title: "excessive water content", subTitle: "・Hyponatremia: Excessive intake of water can lead to a decrease in the concentration of sodium and other electrolytes in the body. This is related to cellular osmotic pressure and may cause cells to swell, potentially leading to cerebral edema (excess fluid in the brain).\n\n・Abdominal discomfort: Excessive water intake can cause excessive stretching of the stomach and intestines, leading to abdominal discomfort and nausea.\n\n・Hyponatremia: Excessive water intake may lead to a decrease in sodium concentration in the body. Known as hyponatremia, this condition can cause symptoms such as headaches, dizziness, seizures, and altered consciousness.\n\n・Increased cardiac workload: Excessive water intake may increase the workload on the heart. When the volume of blood increases, the heart needs to work harder to pump it effectively.\n\n・Decreased urea nitrogen: Excessive water intake may lead to a decrease in the concentration of urinary components such as urea nitrogen. This can potentially affect kidney function.", text: "TAP to see possible physical changes.", color: .cyan, number: 1, bodyColor: .blue))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
            
        } else if value0 <= 70 {
            
            if !problems.contains(where: { $0.number == 2 }) {
                
                problems.append(problemArray(title: "water shortage", subTitle: "・Impaired body temperature regulation: Water plays a crucial role in regulating body temperature. Insufficient water intake can lead to a decrease in the body's ability to regulate temperature, potentially resulting in problems such as heatstroke.\n\n・Elevation of blood concentration: Insufficient water intake leads to an increase in blood concentration. This can increase the workload on the heart and potentially elevate blood pressure.\n\n・Decreased metabolism: Water serves as a solvent necessary for metabolic reactions in the body. Insufficient water intake can lead to a decrease in metabolism, hindering energy production.\n\n・Digestive system issues: Water is crucial for digestion. Inadequate water intake can lead to digestive issues such as constipation and indigestion.\n\n・Decline in brain function: Dehydration can lead to a decrease in concentration, memory, and cognitive function. Additionally, severe dehydration can cause dizziness and impaired consciousness.\n\n・Decreased kidney function: Water is essential for excreting waste products from the body. Prolonged insufficient water intake can lead to a decline in kidney function and a decrease in urine output. This can result in the accumulation of waste products in the body, potentially causing adverse health effects.", text: "TAP to see possible physical changes.", color: .cyan, number: 2, bodyColor: .blue.opacity(0.5)))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
            
        } else {
            withAnimation {
                problems.removeAll(where: {$0.number == 1})
                problems.removeAll(where: {$0.number == 2})
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
        }
    }
    
    func changedValue1() {
        if value1 >= 15 {
            
            if !problems.contains(where: { $0.number == 3 }) {
                
                problems.append(problemArray(title: "excess protein", subTitle: "・Kidney burden: Excessive protein intake may impose a burden on the kidneys as they need to excrete excess nitrogen, potentially leading to a decline in kidney function and an increased risk of kidney disease in the long term.\n\n・Calcium excretion: High protein intake may increase the excretion of calcium, potentially leading to decreased bone density and an increased risk of fractures and osteoporosis.\n\n・Imbalance in nutritional intake: Excessive protein intake can lead to a reduction in the intake of other nutrients, particularly carbohydrates and fats, disrupting a balanced diet.\n\n・Environmental impact: In the livestock industry, excessive demand for protein may require large-scale production of feed, imposing a burden on the environment.", text: "TAP to see possible physical changes.", color: .green, number: 3, bodyColor: .green))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
            
        } else if value1 <= 12 {
            
            if !problems.contains(where: { $0.number == 4 }) {
                
                problems.append(problemArray(title: "protein deficiency", subTitle: "・Muscle loss: Protein is a primary component of muscles, and inadequate intake may lead to a decrease in muscle mass, potentially resulting in reduced muscle strength and physical performance.\n\n・Decreased immune function: Some parts of the immune system rely on proteins, and insufficient protein intake can lead to a decrease in immune function, weakening the body's ability to resist infections.\n\n・Anemia: Inadequate protein intake may increase the risk of anemia as hemoglobin and other proteins in the blood may be insufficient. This is because red blood cells are necessary for transporting oxygen.\n\n・Skin issues: Protein is essential for the health and repair of the skin. Inadequate intake may lead to skin problems and delayed wound healing.\n\n・Bone health: Protein is involved in bone formation and maintenance. Inadequate intake may compromise bone health, increasing the risk of osteoporosis.", text: "TAP to see possible physical changes.", color: .green, number: 4, bodyColor: .green.opacity(0.5)))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
//                weight = 80
//                roundWeight = 50
            if let problem = problems.first {
                color = problem.bodyColor
            } else {
                color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
            }
            }
            
        } else {
            withAnimation {
                problems.removeAll(where: {$0.number == 3})
                problems.removeAll(where: {$0.number == 4})
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
        }
    }
    
    func changedValue2() {
        if value2 >= 8 {
            
            if !problems.contains(where: { $0.number == 5 }) {
                
                problems.append(problemArray(title: "excessive carbohydrate", subTitle: "・Weight gain: Carbohydrates function as an energy source, and consuming them in excess can lead to the accumulation of surplus energy as fat, potentially resulting in weight gain.\n\n・Insulin resistance and diabetes risk: High-carbohydrate diets may increase insulin secretion, potentially leading to insulin resistance over time. This is a risk factor for the development of diabetes.\n\n・Rapid fluctuations in blood sugar levels: Consuming high glycemic index (GI) carbohydrates can cause blood sugar levels to rise rapidly and then fall sharply. This may lead to feelings of hunger and fatigue, making it difficult to control meal intake.\n\n・Increased cardiovascular risk: Excessive carbohydrate intake may increase the risk of cardiovascular diseases such as high cholesterol and triglycerides.\n\n・Changes in gut microbiota: High-carbohydrate diets may disrupt the balance of gut bacteria, leading to changes in gut microbiota and digestive issues.", text: "TAP to see possible physical changes.", color: .orange, number: 5, bodyColor: .orange))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
            
        } else if value2 <= 6 {
            
            if !problems.contains(where: { $0.number == 6 }) {
                
                problems.append(problemArray(title: "carbohydrate deficiency", subTitle: "・Energy deficiency: Carbohydrates are a primary energy source for the body. In cases of carbohydrate deficiency, the body attempts to metabolize and utilize other nutrients and internal proteins to obtain energy, which is inefficient and may lead to fatigue and lethargy.\n\n・Decrease in blood sugar levels: Carbohydrates play a role in stabilizing blood sugar levels. Inadequate carbohydrate intake can lead to a decrease in blood sugar levels, resulting in symptoms of hypoglycemia such as dizziness, headaches, decreased concentration, anxiety, irritability, and trembling.\n\n・Nutritional deficiency: Excessive exclusion of carbohydrates may reduce opportunities to intake essential nutrients such as vitamins, minerals, and dietary fiber from the diet, increasing the risk of nutritional deficiencies.\n\n・Metabolic changes: Prolonged restriction of carbohydrates can lead to metabolic changes where the body starts utilizing fats and proteins as energy sources. This may have implications such as tissue damage and muscle loss.", text: "TAP to see possible physical changes.", color: .orange, number: 6, bodyColor: .orange.opacity(0.5)))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
            
        } else {
            withAnimation {
                problems.removeAll(where: {$0.number == 5})
                problems.removeAll(where: {$0.number == 6})
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
        }
    }
    
    func changedValue3() {
        if value3 >= 25 {
            //肥満
            
            if !problems.contains(where: { $0.number == 7 }) {
                
                problems.append(problemArray(title: "excess fat", subTitle: "・Obesity: Excessive accumulation of fat leads to obesity, increasing the risk of chronic diseases such as cardiovascular diseases, diabetes, hypertension, arthritis, and sleep apnea.\n\n・Cardiovascular diseases: Excess fat can cause atherosclerosis, impairing the health of the heart and blood vessels. This increases the risk of cardiovascular diseases such as heart attacks and strokes.\n\n・Type 2 diabetes: Excess fat can impair pancreatic function and lead to insulin resistance, resulting in elevated blood sugar levels and an increased risk of developing type 2 diabetes.\n\n・Joint strain: Increased fat puts extra strain on the joints, increasing the risk of arthritis.\n\n・Cancer: Research suggests that increased fat tissue may increase the risk of cancer, particularly colorectal, breast, and uterine cancers.\n\n・Psychological effects: Obesity and excessive fat accumulation can lower self-esteem and increase the risk of depression.\n\n・Sleep disorders: Obesity increases the risk of sleep disorders such as sleep apnea.", text: "TAP to see possible physical changes.", color: .purple, number: 7, bodyColor: .purple))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
//                weight = 180
//                roundWeight = 90
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
            
        } else if value3 <= 15 {
            //がり
            
            if !problems.contains(where: { $0.number == 8 }) {
                problems.append(problemArray(title: "lack of fat", subTitle: "・Nutritional deficiency: Excessive dieting or dietary restrictions may result in the inability to intake necessary nutrients, leading to malnutrition and adverse health effects.\n\n・Decrease in muscle mass: Inadequate nutrition and insufficient training lead to a decrease in muscle mass. This lowers the body's metabolic rate, resulting in a decrease in basal metabolic rate.\n\n・Decreased immune function: Inadequate intake of proper nutrition can lead to a decrease in immune function, weakening the body's resistance to infections and diseases.\n\n・Decreased reproductive function: Excessive nutritional restriction can disrupt hormone balance and affect reproductive function. In females, this may manifest as irregular menstruation or cessation of menstruation, while in males, it may result in decreased sexual function.\n\n・Osteoporosis: Inadequate intake of proper nutrients leads to a decrease in bone density, increasing the risk of osteoporosis.\n\n・Increased cardiovascular risk: Excessive reduction in body fat below healthy levels may increase the risk of cardiovascular diseases.\n\n・Psychological effects: Excessive dietary restrictions and weight loss can lead to eating disorders and psychological stress.", text: "TAP to see possible physical changes.", color: .purple, number: 8, bodyColor: .purple.opacity(0.5)))
                
                problems.sort(by: {$0.number < $1.number})
                
            }
            withAnimation {
//                weight = 80
//                roundWeight = 50
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
            
        } else {
            withAnimation {
                problems.removeAll(where: {$0.number == 7})
                problems.removeAll(where: {$0.number == 8})
                if !problems.isEmpty {
                    color = problems.first!.bodyColor
                } else {
                    color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                }
            }
        }
    }

    
}
