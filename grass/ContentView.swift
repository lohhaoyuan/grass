//
//we were forced to write this code
//
//pls no copy
//
//made by tu madere 

import SwiftUI
import UserNotifications

enum NotificationAction: String {
    case dimiss
    case reminder
}

enum NotificationCategory: String {
    case general
}

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        print(userInfo)
        
        completionHandler()
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
}

struct ContentView: View {
    
    @StateObject var plantManager = PlantManager()
    
    @State var isNewPlantPresented = false
    @State var isOnboardingPresented = false
    
    @AppStorage("IsFirstLaunch") var isFirstLaunch = true
    
    var body: some View {
        NavigationView {
            List {
                ForEach($plantManager.plants) { $plant in
                    NavigationLink(destination: PlantDetailView(plants: $plant)) {
                        VStack(alignment: .leading){
                            Text(plant.name)
                            HStack{
                                Spacer()
                            }
                        }
                    }
                }.onDelete { offset in
                    // Remove notifications related to the deleted plants
                    let plantsToDelete = offset.map { plantManager.plants[$0] }
                    for plant in plantsToDelete {
                        removeNotifications(for: plant)
                    }
                    
                    plantManager.plants.remove(atOffsets: offset)
                }.onMove { source, destination in
                    plantManager.plants.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("My Plants")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isNewPlantPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.sheet(isPresented: $isNewPlantPresented) {
            AddCustomPlantView(plants: $plantManager.plants)
        }.sheet(isPresented: $isOnboardingPresented) {
            OnboardingView()
        }
        .onChange(of: plantManager.plants) { newValue in
            isOnboardingPresented = newValue.isEmpty
        }
        .onAppear {
            if isFirstLaunch {
                isOnboardingPresented = true
                isFirstLaunch = false
            }
        }
    }
    
    // Function to remove notifications for a specific plant
    func removeNotifications(for plant: Plant) {
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests { requests in
            for request in requests {
                if request.identifier == plant.id.uuidString {
                    center.removePendingNotificationRequests(withIdentifiers: [request.identifier])
                }
            }
        }
    }
}


