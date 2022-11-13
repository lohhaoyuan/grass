//
//  AddCustomPlantView.swift
//  grass
//
//  Created by James Kuang on 29/10/22.
//

import SwiftUI

struct AddCustomPlantView: View {
    
    @State var plantName: String = ""
    @State var plantNickname: String = ""
    @State var pickerVisible
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Section(header: Text("Basic Details")) {
                        TextField(
                        "Plant Name",
                        text: $plantName
                        )
                        TextField(
                        "Nickname",
                        text: $plantNickname
                        )
                    }
                    Section(header: Text("Plant Care")) {
                        Text("Placeholder")
                    }
                }
            }
            .foregroundColor(Color("Swamp Green"))
            .navigationTitle("Add Custom Plant")
        }
    }
}

struct AddCustomPlantView_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomPlantView()
    }
}
