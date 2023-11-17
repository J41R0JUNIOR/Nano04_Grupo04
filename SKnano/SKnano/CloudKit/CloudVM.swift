//
//  CloudVM.swift
//  SKnano
//
//  Created by Daniel Ishida on 08/11/23.
//

import Foundation

class CloudKitVM: ObservableObject{
    var manager = CloudKitUtility()
    
    init(){
        fetchPermission()
        fetchStatus()
    }
    
    func fetchStatus(){
        Task{
            do{
             let response = try await manager.getIcloudStatus()
                DispatchQueue.main.async {
                    print("Status:\(response.rawValue.description)")
                }
            }catch{
                print(error)
            }
        }
    }
    
    func fetchPermission(){
        Task{
            do{
                let response = try await manager.getPermission()
            }catch{
                print(error)
            }
        }
    }

}
