//
//  CloudError.swift
//  SKnano
//
//  Created by Daniel Ishida on 07/11/23.
//

import Foundation

enum CloudKitError: String, Error{
    case accountNotfound
    case accountNotDetermined
    case accountRestricted
    case accountUnknow
    case nameNotFound
}
