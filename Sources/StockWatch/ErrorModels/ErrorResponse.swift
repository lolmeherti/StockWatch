//
//  File.swift
//  
//
//  Created by Alex H. on 30.12.22.
//

import Foundation

public struct ErrorResponse: Codable
{
    public let errorCode: String
    public let errorDescription: String
    
    init(errorCode:String, errorDescription:String){
        self.errorCode = errorCode
        self.errorDescription = errorDescription
    }
    
}
