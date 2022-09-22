//
//  ContentView.swift
//  cw7
//
//  Created by JARRAH MAYYAL on 21/09/2022.
//

import SwiftUI
struct Movies: Identifiable{
    let id = UUID()
    let movename: String
    let imagename: String
    let actors: [String]
}

struct ContentView: View {
    var movies = [Movies(movename: "Blck Widow", imagename: "fst", actors: ["natasha", "scarlet", "ropot", "ryan", "florans", "evr andreson"] ),
                  Movies(movename: " Joker", imagename: "joker", actors: ["bradley", "Joaquin", "lady", "Adam", "Brian", "Hildur", "Isabella"] ),
                  
                  Movies(movename: "Top Gun", imagename: "top gun", actors: ["Anthony", "charlotte", "Meg Ryan", "Tom Cruise"] ) ]
    
    var body: some View {
        NavigationView{
            List (movies){
                
                movie in
                
                NavigationLink {
                    moviesinfo (imagename: movie.imagename, movename: movie.movename, actors: movie.actors)
                } label:
                {
                    HStack{
                        Image (movie.imagename)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 110, height: 110)

                        
                        Text(movie.movename)
                    }

                }
                
                
                
                

            }
            .navigationTitle("Movies")
            
            
            
            
        }
        .accentColor(.white)

    }
}

struct moviesinfo: View{
    var imagename: String
    var movename: String
    var actors: [String]
    var body: some View {
        
        
        ZStack{
            Image (imagename)
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 3)
                .opacity(0.7)
            VStack{
                
                Image (imagename)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    
                Text(movename)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                ScrollView(.horizontal){
                    
                    HStack{
                        ForEach(actors, id:\.self){
                            
                            actor in
                            VStack{
                                Image(actor)
                                    .resizable()
                                    .frame(width: 110, height: 200)
                                Text(actor)
                                
                                
                                
                            }
                            
                            
                        }
                        
                    }
                }
                
                
                
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
