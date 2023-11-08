struct Character {
    
    var name: String
    var skins: [Skin]
    
}

extension Character {
    
    static var jinx: Character = .init(name: "Jinx")
    static var sylas: Character = .init(name: "Sylas")
    static var riven: Character = .init(name: "Riven")
    
}
