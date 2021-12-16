//
//  AppDataModel.swift
//  UI-394
//
//  Created by nyannyan0328 on 2021/12/16.
//

import SwiftUI

class AppDataModel: ObservableObject {
    
    @Published var currentTab : Tab = .Search
    
    @Published var curretnDetailPage : String?
    
    
    func checkDeepLink(url : URL)->Bool{
        
        
        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else{
            
            return false
        }
        
        
        if host == Tab.Home.rawValue{
            
            currentTab = .Home
            
        }
        
        else if host == Tab.Search.rawValue{
            
            currentTab = .Search
            
        }
        
        
        else if host == Tab.Settings.rawValue{
            
            currentTab = .Settings
            
        }
        
        else{
            
            return checkInternalLink(host: host)
            
           
        }
        
        return true
        
        
    }
    
    func checkInternalLink(host : String)->Bool{
        
        
        if let index = coffees.firstIndex(where: { coffee in
          return coffee.id == host
        }){
            
            
            currentTab = .Search
            curretnDetailPage = coffees[index].id
            
         
            
            return true
        }
        
        return false
        
        
        
        
        
        
    }
    
    

    
   
}


enum Tab : String{
    
    case Home = "home"
    case Search = "search"
    case Settings = "settings"
    
}
