//
//  InformationTransferabilitySimulationApp.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/16.
//

import SwiftUI

@available(iOS 17.0, *)
@main
struct InformationTransferabilitySimulationApp: App {
    var body: some Scene {
        WindowGroup {
            DescriptionView(viewModel: .init())
//            ContentView(viewModel: .init())
//            ElementView()
//            PenKitView()
        }
    }
}
