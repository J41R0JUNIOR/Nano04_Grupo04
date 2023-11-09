import StoreKit

public enum StoreError: Error {
    case failedVerification
}

@Observable class Store {
    
    var skins: [Product]
    var purchasedSkins: [Product]
    
    init() {
        skins = []
        purchasedSkins = []
        
        Task {
            await requestProducts()
            
            await updateProducts()
        }
        
    }
    
    func getProductsByCharacter(_ character: Character) -> [Product] {
        let skins = skins.filter { skin in
            character.skins.contains { _skin in
                return skin.id == _skin.slug
            }
        }
        
        return skins
    }
    
    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        //Check whether the JWS passes StoreKit verification.
        switch result {
            case .unverified:
                //StoreKit parses the JWS, but it fails verification.
                throw StoreError.failedVerification
            case .verified(let safe):
                //The result is verified. Return the unwrapped value.
                return safe
        }
    }
    
    private func requestProducts() async {
        
        let skinsIDs = [
            "skin.jinx.arcane",
            "skin.jinx.felina",
            "skin.jinx.felina.prestigio",
            "skin.riven.coelha",
            "skin.riven.quebrada",
            "skin.riven.sentinela",
            "skin.sylas.lobo",
            "skin.sylas.matador",
        ]
        
        var skins: [Product] = []
        
        do {
            let products = try await Product.products(for: skinsIDs)
            
            for product in products {
                switch product.type {
                        
                    case .nonConsumable:
                        skins.append(product)
                    default:
                        continue
                }
            
            }
        } catch {
            print("Error when requesting products")
        }
        
        self.skins = skins
        
    }
    
    private func updateProducts() async {
        
        let purchasedProducts = Transaction.currentEntitlements
        
        var purchasedSkins: [Product] = []
        
        for await product in purchasedProducts {
            do {
                let transaction = try checkVerified(product)
                
                switch transaction.productType {
                    case .nonConsumable:
                        if let purchasedSkin = skins.first(where: { $0.id == transaction.productID }) {
                            purchasedSkins.append(purchasedSkin)
                        }
                    default:
                        continue
                }
            } catch  {
                
            }
        }
        
        self.purchasedSkins = purchasedSkins
    }
}
