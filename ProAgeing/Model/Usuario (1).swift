//
//  Usuario.swift
//  ProAgeing
//
//  Created by Luis Luna on 9/5/17.
//  Copyright © 2017 Luis Luna. All rights reserved.
//

import Foundation
import UIKit
class Usuario: NSObject, NSCoding {

    let id: Int!
    var email: String!
    let nombre: String!
    var pass: String!
    let fNacimiento: String!
    //private var edad: Int!
    var imagen: UIImage! = UIImage(named: "defaultUser")
    let sexo: String!
    var contacts = [Contacto]()
    var favContacts = [Contacto]()
    var padecimientos: String!
    let sangre: String!
    let altura: Double!
    let peso: Double!
    var heartRate = [Double]()
    private var lastCalled: Contacto?
    
    var medicamentos = [Medicamento]()
    
    

    init (id: Int, email: String, pass: String, padecimientos: String, name: String, fNacimiento: String, sex: String, image: String, medicamento: String, tipoSangre: String, altura: Double, peso: Double) {
        
        //IMPLEMENTAR PADECIMIENTOS EN ARREGLO
        //IMPLEMENTAR FNACIMIENTO EN DATE
        self.id = id
        self.pass = pass
        self.email = email
        self.nombre = name
        self.fNacimiento = fNacimiento
        self.sexo = sex
        if image != "default" || image != "" || image != "/profile" {
            //VERIFICAR QUE EXISTA la imagen local
            //self.imagen = UIImage(named: image)
        }
        self.padecimientos = padecimientos
        Usuario.getMedicamento(from: medicamento)
        self.sangre = tipoSangre
        self.altura = altura
        self.peso = peso
        
    }
    
    required init(coder aDecoder: NSCoder) { //Decodificar datos
        self.id = aDecoder.decodeObject(forKey: "id") as? Int ?? 0
        self.email = aDecoder.decodeObject(forKey: "email") as? String
        self.nombre = aDecoder.decodeObject(forKey: "nombre") as? String
        self.pass = aDecoder.decodeObject(forKey: "pass") as? String
        self.fNacimiento = aDecoder.decodeObject(forKey: "fNacimiento") as? String
        self.sexo = aDecoder.decodeObject(forKey: "sexo") as! String
        self.contacts = aDecoder.decodeObject(forKey: "contacts") as! Array<Contacto>
        self.favContacts = aDecoder.decodeObject(forKey: "favContacts") as! Array<Contacto>
        self.padecimientos = aDecoder.decodeObject(forKey: "padecimientos") as! String
        self.sangre = aDecoder.decodeObject(forKey: "sangre") as! String
        self.altura = aDecoder.decodeObject(forKey: "altura") as! Double
        self.peso = aDecoder.decodeObject(forKey: "peso") as! Double
        self.heartRate = aDecoder.decodeObject(forKey: "email") as? Array<Double> ?? Array<Double>()
        self.lastCalled = aDecoder.decodeObject(forKey: "lastCalled_Con") as? Contacto ?? nil
        
    }
    
    
    
    func encode(with aCoder: NSCoder) { //Guardar datos
        aCoder.encode(self.id, forKey:"id")
        aCoder.encode(self.email, forKey:"email")
        aCoder.encode(self.nombre, forKey:"nombre")
        aCoder.encode(self.pass, forKey:"pass")
        aCoder.encode(self.fNacimiento, forKey:"fNacimiento")
        aCoder.encode(self.sexo, forKey:"sexo")
        aCoder.encode(self.contacts, forKey:"contacts")
        aCoder.encode(self.favContacts, forKey:"favContacts")
        aCoder.encode(self.padecimientos, forKey:"padecimientos")
        aCoder.encode(self.imagen, forKey:"imagen")
        aCoder.encode(self.sangre, forKey:"sangre")
        aCoder.encode(self.altura, forKey: "altura")
        aCoder.encode(self.peso, forKey:"peso")
        aCoder.encode(self.heartRate, forKey:"heartRate")
        aCoder.encode(self.lastCalled, forKey:"lastCalled_Con")
    }
    
    class private func getMedicamento(from: String) {
        let meds = Array<Medicamento>()
        //from.split(separator: '')
        
        
        
    }
    
   
    func edadAnios() -> Int {
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        let date = formatter.date(from: self.fNacimiento)!
        let calendar = Calendar.current
        let componentes = calendar.dateComponents([.year, .month, .day], from: date)
        
        let nacimiento = calendar.date(from: componentes)
        
        let difference = today.timeIntervalSince(nacimiento!)
        
        print("DIFFERENCE ::::::::: -> \(difference)")
        
        let differenceDays = Int(difference/(60 * 60 * 24))
        
    
        
        return differenceDays/365
        
    }
    
    func toString() -> String {
        let user: String = "id: \(self.id), nombre: \(self.nombre), email: \(self.email), pass: \(self.pass), nacimiento: \(self.fNacimiento), Edad: \(self.edadAnios())"
        return user
    }
    
    func getLastCalled() -> Contacto? {
       /* var contacto: Contacto?
        for con in self.contacts {
            if con.lastCalled {
                contacto = con
            }
        }
        self.lastCalled = contacto*/
        return self.lastCalled
    }
    
    func setLastCalled(_ contact: Contacto) {
        self.lastCalled = contact
    }
 
}
