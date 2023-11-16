//
//  CloudUtility.swift
//  SKnano
//
//  Created by Daniel Ishida on 08/11/23.
//

import Foundation

import Foundation
import CloudKit

class CloudKitUtility {

    // Function gets the icloud account status
    func getIcloudStatus() async throws -> CKAccountStatus{
        let accountStatus = try await CKContainer.default().accountStatus()
        switch accountStatus{
        case .available:
            return CKAccountStatus.available
        case .noAccount:
            throw CloudKitError.accountNotfound
        case .couldNotDetermine:
            throw CloudKitError.accountNotDetermined
        case .restricted:
            throw  CloudKitError.accountRestricted
        default:
            throw CloudKitError.accountUnknow
        }
    }
    
    //Function requests permission for user discoverability
    func getPermission() async throws -> CKContainer.ApplicationPermissionStatus{
        
        let permission = try await CKContainer.default().requestApplicationPermission([.userDiscoverability])
        
        switch permission{
        case .granted:
            print("Access Granted")
            return CKContainer.ApplicationPermissionStatus.granted
        case .couldNotComplete:
            print("Could not complete the operation")
            throw CKError(.internalError)
        case .denied:
            print("Access denied permission failed")
            throw CKError(.permissionFailure)
        case .initialState:
            print("Grant permission and try again")
            return CKContainer.ApplicationPermissionStatus.denied
        default:
            fatalError("UNKNOW ERROR")
        }
    }
    
    
     
}
