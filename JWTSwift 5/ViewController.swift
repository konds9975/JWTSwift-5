//
//  ViewController.swift
//  JWTSwift 5
//
//  Created by MacBook Pro on 21/08/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import SwiftyJWT
class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.encodeDataInJWT()
 
    }
    
    
    //MARK:- For encode the dictionary into JWT Token
    func encodeDataInJWT()
    {
        
        let alg = JWTAlgorithm.hs256("kBj92ySJaVshpJQYv8EQU1sPRXvaqa4jZfMHdjJVgAhQY7sn6elmr8bxQ1v6a5OP")
//        let headerWithKeyId = JWTHeader.init(keyId: "testKeyId")
        var payload = JWTPayload()
        payload.expiration = 515616187993
        payload.issuer = "yufu"
        payload.subject = "shuo"
        payload.customFields = ["email": EncodableValue(value: "chetan@user.com"),
                                "password": EncodableValue(value: "password")]

        let jwtWithKeyId = JWT.init(payload: payload, algorithm: alg)
        print(jwtWithKeyId?.rawString ?? "")
        
         guard let jwtString = jwtWithKeyId?.rawString else { return  }
        //let jwtString = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9sb2dpbiIsImlhdCI6MTU2NjM5MTM1NSwiZXhwIjoxNTY2Mzk0OTU1LCJuYmYiOjE1NjYzOTEzNTUsImp0aSI6IlFKUFVya0NBbFptcExPRlQiLCJzdWIiOjcsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.ojw-ATIX2A13UNCG8noe6W2Js5Qma2vHJ_bJoowoB28"
        
        let alg1 = JWTAlgorithm.hs256("kBj92ySJaVshpJQYv8EQU1sPRXvaqa4jZfMHdjJVgAhQY7sn6elmr8bxQ1v6a5OP")
        let jwt = try? JWT.init(algorithm: alg1, rawString: jwtString)
        let payload1 = jwt?.payload
        do {
            try payload1?.checkExpiration(allowNil: true)
            try payload1?.checkSubject(expected: "shuo")
            try payload1?.checkIssuer(expected: "yufu")
            if let enco = jwt?.payload.customFields?["email"]{
                print(enco.value)
            }
            if let enco = jwt?.payload.customFields?["password"]{
                print(enco.value)
            }
        }catch{
            print(error.localizedDescription)
        }
        
        
        
        
       
       
    }
    
    
    //MARK:- For decode the JWT token into Dictionary or ClaimSet
    
    //How to access ClaimSet as Any Type of data
    //let email =  claimset["email"] as? String
    
    func decodingDataInJWT(token:String!)
    {
        
        
    }
    
}
