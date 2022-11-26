//
//  ContentView.swift
//  grass
//
//  Created by saumil on 22/10/22.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var plantManager = PlantManager()
<<<<<<< HEAD
    var body: some View {
        TabView{
            
            LaunchView()
            AddCustomPlantView(plants: $plantManager.plants)
        }.tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))

=======
    @State var isNewPlantPresented = false
    var body: some View {
            TabView{
                LaunchView()
                AddCustomPlantView(plants: $plantManager.plants)
            }.tabViewStyle(.page)
        }
>>>>>>> main
    }


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
