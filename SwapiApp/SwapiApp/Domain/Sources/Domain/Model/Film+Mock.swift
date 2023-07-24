//
//  Film+Mock.swift
//  
//
//  Created by Valentin COUSIEN on 17/07/2023.
//

import Foundation

extension Film {
    
    public enum Mock {
        
        public static let film1 = Film(id: 1, title: "Les aventures hilarantes de Toto", openingCrawl: "Toto, un jeune garçon plein d'esprit, se retrouve constamment au cœur des situations les plus folles à l'école. Entre les farces en classe et les blagues jouées aux enseignants, Toto est devenu une légende parmi ses camarades. Mais lorsqu'un mystère se présente à lui, impliquant la disparition des cookies de la cantine, Toto et ses amis Léo et Emma se lancent dans une quête pleine d'humour pour résoudre le mystère. Leur aventure les mènera à travers l'école, les salles de classe et les recoins secrets. Vont-ils découvrir qui se cache derrière cette mystérieuse affaire de cookies ?", isFavorite: false)
        public static let film2 = Film(id: 2, title: "Toto contre les clowns farceurs", openingCrawl: "Après avoir résolu le mystère des cookies, Toto et ses amis se retrouvent confrontés à un nouveau problème lorsque des clowns farceurs envahissent la ville. Lorsque Toto découvre une connexion entre les clowns et une série d'événements étranges, il se lance dans une mission pour les arrêter. Avec l'aide de Léo et Emma, Toto pénètre dans un cirque mystérieux où les rires et les surprises ne sont pas toujours ce qu'ils semblent être. Parviendront-ils à déjouer les plans des clowns farceurs et à ramener la paix dans la ville ?", isFavorite: true)
        public static let film3 = Film(id: 3, title: "Le grand dénouement de Toto", openingCrawl: "Toto, Léo et Emma sont maintenant devenus de véritables héros dans leur ville, grâce à leurs aventures précédentes. Mais l'histoire ne s'arrête pas là pour Toto, car de nouveaux défis se dressent sur son chemin. Lorsqu'il découvre un complot diabolique visant à voler tous les gâteaux de la ville, Toto se prépare pour l'ultime confrontation. Avec sa détermination et son esprit vif, Toto se lance dans une aventure épique pour arrêter les méchants clowns et sauver les pâtisseries bien-aimées de la ville. Leur confrontation finale sera remplie de rires, de rebondissements et de blagues hilarantes. Toto prouvera une fois de plus que même les plus petits peuvent réaliser de grandes choses.", isFavorite: false)
    }
}
