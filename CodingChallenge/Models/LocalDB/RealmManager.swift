//
//  RealmManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation
import RealmSwift

let uiRealm = try! Realm()

class RealmManager: NSObject {
    static let sharedInstance = RealmManager()
    
    func getAllDataForObject(_ T : Object.Type, query :String) -> [Object] {
        var objects = [Object]()
        
        for result in uiRealm.objects(T).filter(query) {
            objects.append(result)
        }
        return objects
       
    }
    
    func add(_ object : Object, completion : @escaping() -> ()) {
        try! uiRealm.write{
            
            uiRealm.add(object)
            completion()
        }
    }
    
    func delete(_ object : Object, completion : @escaping() -> ()) {
        try! uiRealm.write{
            uiRealm.delete(object)
            completion()
        }
    }
    
    func configureMigration() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you’ve never set a schema version before, the version is 0).
            schemaVersion: 0,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        
        Realm.Configuration.defaultConfiguration = config
    }
}
