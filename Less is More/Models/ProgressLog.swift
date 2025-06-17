import Foundation

struct ProgressLog: Codable {
    let date: Date
    let levelId: Int
    let notes: String?
    
    static func createLog(levelId: Int, notes: String? = nil) -> ProgressLog {
        return ProgressLog(date: Date(), levelId: levelId, notes: notes)
    }
} 