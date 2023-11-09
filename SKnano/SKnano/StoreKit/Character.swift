import Foundation

struct Character: Identifiable {
    var id = UUID()
    
    
    var name: String
    var skins: [Skin]
    
    init(id: UUID = UUID(), name: String, skins: [Skin]) {
        self.id = id
        self.name = name
        self.skins = []
    
        var newSkins = skins.map { skin in
            var newSkin = skin
            
            newSkin.owner = self
            
            
            return newSkin
        }
        
        self.skins = newSkins
    }
    
    static func all() -> [Character] {
        return [
            jinx, sylas, riven
        ]
    }
}

extension Character {
    
    static var jinx: Character {
        var char: Character = .init(name: "Jinx", skins: [
            .arcane, .felina, .felinaPrestigio, .kawaii
        ])
        
        
        return char
    }
    static var sylas: Character = .init(name: "Sylas", skins: [
        .coelha, .quebrada, .sentinela
    ])
    static var riven: Character = .init(name: "Riven", skins: [
        .lobo, .matador
    ])
    
}
