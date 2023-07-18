//
//  Film+Mock.swift
//  
//
//  Created by Valentin COUSIEN on 17/07/2023.
//

import Foundation

extension Film {
    
    public enum Mock {
        
        public static let film1 = Film(id: 1, title: "Toto", openingCrawl: "C'est l'histoire de Toto")
        public static let film2 = Film(id: 2, title: "Toto contre la maitresse", openingCrawl: "Et la maitresse, elle dit devant Toto")
        public static let film3 = Film(id: 3, title: "La revanche de Toto", openingCrawl: "Du coup, Toto il essaye de se venger")
    }
}
