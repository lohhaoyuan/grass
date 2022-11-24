import SwiftUI
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
    
    
    
    
    @StateObject private var notificationManager = NotificationManager()
    @State private var isCreatePresented = false
    
    private static var notificationDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
    
    private func timeDisplayText(from notification: UNNotificationRequest) -> String {
        guard let nextTriggerDate = (notification.trigger as? UNCalendarNotificationTrigger)?.nextTriggerDate() else { return "" }
        return Self.notificationDateFormatter.string(from: nextTriggerDate)
    }
    
    @ViewBuilder
    var infoOverlayView: some View {
        switch notificationManager.authorizationStatus {
        case .authorized:
            if notificationManager.notifications.isEmpty {
                InfoOverlayView(
                    infoMessage: "No Notifications Yet",
                    buttonTitle: "Create",
                    systemImageName: "plus.circle",
                    action: {
                        isCreatePresented = true
                    }
                )
            }
        case .denied:
            InfoOverlayView(
                infoMessage: "Please Enable Notification Permission In Settings",
                buttonTitle: "Settings",
                systemImageName: "gear",
                action: {
                    if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            )
        default:
            EmptyView()
        }
    }
    

    
    @State var isNewPlantPresented = false
    
    @StateObject var plantManager = PlantManager()
    
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
                    plantManager.plants.remove(atOffsets: offset)
                }
                .onMove { source, destination in
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
                    } label:   {
                        Image(systemName: "plus")
                    }
                }
            }
        }.sheet(isPresented: $isNewPlantPresented) {
            AddCustomPlantView(plants: $plantManager.plants)
        }
    }
}

/*
 Saumils Notification Code
 VStack {
     Button("Schedule Notification") {
         
         let center = UNUserNotificationCenter.current()
         
         // create content
         let content = UNMutableNotificationContent()
         content.title = "Hot Coffee"
         content.body =  "Your delicious coffee is ready!"
         content.categoryIdentifier = NotificationCategory.general.rawValue
         content.userInfo = ["customData": "Some Data"]
         
         if let url = Bundle.main.url(forResource: "coffee", withExtension: "png") {
             if let attachment = try? UNNotificationAttachment(identifier: "image", url: url, options: nil) {
                 content.attachments = [attachment]
             }
         }
         
         // create trigger
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
         
         // create request
         let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
         
         // define actions
         let dismiss = UNNotificationAction(identifier: NotificationAction.dimiss.rawValue, title: "Dismiss", options: [])
         
         let reminder = UNNotificationAction(identifier: NotificationAction.reminder.rawValue, title: "Reminder", options: [])
         
         let generalCategory = UNNotificationCategory(identifier: NotificationCategory.general.rawValue, actions: [dismiss, reminder], intentIdentifiers: [], options: [])
         
         center.setNotificationCategories([generalCategory])
         
         // add request to notification center
         center.add(request) { error in
             if let error = error {
                 print(error)
             }
         }
     }
 }
 */
