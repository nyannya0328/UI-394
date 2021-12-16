//
//  Home.swift
//  UI-394
//
//  Created by nyannyan0328 on 2021/12/16.
//

import SwiftUI

struct Home: View {
     @EnvironmentObject var model : AppDataModel
  
    var body: some View {
        TabView(selection: $model.currentTab) {
            
            
            
            Text("Home")
                .tag(Tab.Home)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
           SearchView()
                .environmentObject(model)
                .tag(Tab.Search)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            
            Text("Settings")
                .tag(Tab.Settings)
                .tabItem {
                    Image(systemName: "gearshape")
                }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchView : View{
    
  @EnvironmentObject var model : AppDataModel
    
    var body: some View{
        
        NavigationView{
            
            List{
                
                
                ForEach(coffees){coffee in
                    
                    
                    
                    NavigationLink(tag: coffee.id, selection: $model.curretnDetailPage) {
                        
                        
                        DetailView(coffee: coffee)
                        
                    } label: {
                        
                        
                        HStack{
                            
                            
                            Image(coffee.productImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                
                                Text(coffee.title)
                                    .font(.body.bold())
                                    .foregroundColor(.black)
                                
                                
                                Text(coffee.productPrice)
                                    .font(.caption.bold())
                                    .foregroundColor(.gray)
                                
                                
                                
                                
                            }
                            
                            
                        }
                        
                        
                    }

                    
                    
                }
                
                
            }
            .navigationTitle("Search")
            
        }
    }
    @ViewBuilder
    func DetailView(coffee : Coffee) -> some View{
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                
                Image(coffee.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .cornerRadius(10)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Text(coffee.title)
                        .font(.largeTitle.bold())
                        .foregroundColor(.black)
                    
                    
                    
                    Text(coffee.productPrice)
                        .font(.callout.weight(.semibold))
                        .foregroundColor(.gray)
                    
                    
                    Text(coffee.description)
                        .font(.callout)
                        .lineSpacing(6)
                        .multilineTextAlignment(.leading)
                    
                    
                }
                
                
                
                
            }
            
            
            
        }
        .navigationTitle(coffee.title)
        .navigationBarTitleDisplayMode(.inline)
        
        
        
        
    }
    
}
