//
//  PlantSelectionView.swift
//  grass
//
//  Created by James Kuang on 28/10/22.
//

import SwiftUI

struct PlantSelectionView: View {
    
    @StateObject var plantManager = PlantManager()
    
    var body: some View {
            VStack{
                Text("What do you want to grow?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Swamp Green"))
                    .padding([.top, .leading, .trailing], 18.0)
                
               
        }
    }
}

struct PlantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlantSelectionView()
    }
}
