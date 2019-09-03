import Foundation
import DefaultsKit
let defaults = Defaults(userDefaults: UserDefaults.standard)
extension DefaultsKey {
    static let thoughtsKey = Key<[Thought]>("thoughtsKey")
}
