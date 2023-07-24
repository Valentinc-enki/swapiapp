import Foundation

class LocalDataSource {
    
    private let key = "favoriteFilms"

    public func saveFavoriteFilm(_ film: LocalFilm) {
        var favoriteFilms = getFavoriteFilms()
        if !favoriteFilms.contains(where: { $0.id == film.id }) {
            favoriteFilms.append(film)
            saveFavoriteFilms(favoriteFilms)
        }
    }

    public func removeFavoriteFilm(_ film: LocalFilm) {
        var favoriteFilms = getFavoriteFilms()
        if let index = favoriteFilms.firstIndex(where: { $0.id == film.id }) {
            favoriteFilms.remove(at: index)
            saveFavoriteFilms(favoriteFilms)
        }
    }

    public func getFavoriteFilms() -> [LocalFilm] {
        if let data = UserDefaults.standard.data(forKey: key),
           let favoriteFilms = try? JSONDecoder().decode([LocalFilm].self, from: data) {
            return favoriteFilms
        }
        return []
    }

    private func saveFavoriteFilms(_ favoriteFilms: [LocalFilm]) {
        if let data = try? JSONEncoder().encode(favoriteFilms) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
