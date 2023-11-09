import StoreKit

struct Skin {
    
    var name: String
    var slug: String
    var owner: Character!
    
    var id: String {
        return "skin.\(owner.name.lowercased()).\(slug)"
    }
}

extension Skin {
    static var arcane: Skin = .init(name: "Jinx Arcane", slug: "arcane")

    static var felina: Skin = .init(name: "Jinx Felina", slug: "felina")
    
    static var felinaPrestigio: Skin = .init(name: "Jinx Felina", slug: "felina.prestigio")
    
    static var kawaii: Skin = .init(name: "Jinx Kawaii", slug: "kawaii")
    
    static var coelha: Skin = .init(name: "Riven Coelha", slug: "coelha")
    
    static var quebrada: Skin = .init(name: "Riven Coelha", slug: "coelha")
    
    static var sentinela: Skin = .init(name: "Riven Sentinela", slug: "quebrada")
    
    static var lobo: Skin = .init(name: "Sylas Lobo", slug: "lobo")
    
    static var matador: Skin = .init(name: "Sylas Matador", slug: "matador")
}
