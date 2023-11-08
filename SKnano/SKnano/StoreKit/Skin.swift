import StoreKit

struct Skin {
    
    var name: String
    var slug: String
    var owner: Character
    
    var id: String {
        return "skin.\(owner.name.lowercased()).\(slug)"
    }
}

extension Skin {
    static var arcane: Skin = .init(name: "Jinx Arcane", slug: "arcane", owner: .jinx)

    static var felina: Skin = .init(name: "Jinx Felina", slug: "felina", owner: .jinx)
    
    static var felinaPrestigio: Skin = .init(name: "Jinx Felina", slug: "felina.prestigio", owner: .jinx)
    
    static var kawaii: Skin = .init(name: "Jinx Kawaii", slug: "kawaii", owner: .jinx)
    
    static var coelha: Skin = .init(name: "Riven Coelha", slug: "coelha", owner: .riven)
    
    static var quebrada: Skin = .init(name: "Riven Coelha", slug: "coelha", owner: .riven)
    
    static var sentinela: Skin = .init(name: "Riven Sentinela", slug: "quebrada", owner: .riven)
    
    static var lobo: Skin = .init(name: "Sylas Lobo", slug: "lobo", owner: .sylas)
    
    static var matador: Skin = .init(name: "Sylas Matador", slug: "matador", owner: .sylas)
}
