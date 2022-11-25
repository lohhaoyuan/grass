//
//  ContentView.swift
//  grass
//
//  Created by saumil on 22/10/22.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var plantManager = PlantManager()
    @State var isNewPlantPresented = false
    var body: some View {
            TabView{
                LaunchView()
                AddCustomPlantView(plants: $plantManager.plants)
            }.tabViewStyle(.page)
        }
    }


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
