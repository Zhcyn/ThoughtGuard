import Foundation
struct DateCount: Codable {
    var dateString: String
    var count: Int
    var date: Date  {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            return dateFormatter.date(from: dateString) ?? Date()
        }
    }
}
