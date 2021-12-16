//
//  UI_394App.swift
//  UI-394
//
//  Created by nyannyan0328 on 2021/12/16.
//

import SwiftUI

@main
struct UI_394App: App {
    @StateObject var model = AppDataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onOpenURL { url in
                    if model.checkDeepLink(url: url){
                        
                        
                        print("OK")
                    }
                    else{
                        
                        
                        print("NG")
                    }
                }
        }
    }
}
