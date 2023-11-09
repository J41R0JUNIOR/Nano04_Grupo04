struct Character {
    
    var name: String
    var skins: [Skin]
    
}

extension Character {
    
    static var jinx: Character = .init(name: "Jinx", skins: [
        .arcane, .felina, .felinaPrestigio, .kawaii
    ])
    static var sylas: Character = .init(name: "Sylas", skins: [
        .coelha, .quebrada, .sentinela
    ])
    static var riven: Character = .init(name: "Riven", skins: [
        .lobo, .matador
    ])
    
}
