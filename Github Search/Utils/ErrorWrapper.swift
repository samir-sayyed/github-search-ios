//
//  ErrorWrapper.swift
//  Github Search
//
//  Created by Samir Sayyed on 03/08/24.
//

import Foundation

enum ErrorWrapper: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}
