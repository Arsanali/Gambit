//
//  FavoriteData.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import Foundation



final class Favorites {
        
        static let shared = Favorites()

        private let key = "diit.test_project.Gambit"
    
        private var favorites: [Product] = []
    
        // MARK: - Init
        private init() {
            guard
                let data = UserDefaults.standard.data(forKey: key),
                let favorites = try? JSONDecoder().decode([Product].self, from: data) else { return }
            
            self.favorites = favorites
        }
        
        
        // MARK: - Public methods
        func checkForFavorites(id: Int) -> Bool {
            
            if let _ = favorites.first(where: { $0.id == id } ) {
                return true
            } else { return false }
        }
        

    
    func favoriteClick(item: Product) -> Bool {
        if let _ = favorites.firstIndex(where: { $0.id == item.id}) {
            return true
        } else {
            return false
        }
    }

    
    func addOrRemoveFavorite(item: Product) -> Bool {
        if let index = favorites.firstIndex(where: { $0.id == item.id}) {
            favorites.remove(at: index)
    
            //обновление данных юзерфалс
            synchronize()
            return false
        } else {
            favorites.append(item)
            synchronize()
            return true
        }
    }
        
        
        // MARK: - Private methods
    private func synchronize() {
        guard
            let favItems = try? JSONEncoder().encode(favorites)
            else { return }
        UserDefaults.standard.set(favItems, forKey: key)
    }
}




