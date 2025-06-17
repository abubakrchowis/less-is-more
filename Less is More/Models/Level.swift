import Foundation

struct Level: Codable {
    let id: Int
    let name: String
    let duration: TimeInterval
    let milestoneMessage: String
    
    static let levels: [Level] = [
        Level(id: 1, name: "First Steps", duration: 10, milestoneMessage: "1 hour clean! You're taking the first step towards digital freedom."),
        Level(id: 2, name: "Building Momentum", duration: 20, milestoneMessage: "2 hours clean! Your focus is growing stronger."),
        Level(id: 3, name: "Finding Flow", duration: 40, milestoneMessage: "4 hours clean! You're entering the flow state."),
        Level(id: 4, name: "Deep Work", duration: 80, milestoneMessage: "8 hours clean! You're mastering deep work."),
        Level(id: 5, name: "Day Champion", duration: 480, milestoneMessage: "24 hours clean! You've completed your first day!"),
        Level(id: 6, name: "Weekend Warrior", duration: 172800, milestoneMessage: "48 hours clean! You're conquering the weekend."),
        Level(id: 7, name: "Week Warrior", duration: 604800, milestoneMessage: "1 week clean! You're unstoppable!"),
        Level(id: 8, name: "Fortnight Master", duration: 1209600, milestoneMessage: "2 weeks clean! You're a digital minimalism master!"),
        Level(id: 9, name: "Month Champion", duration: 2592000, milestoneMessage: "1 month clean! You've transformed your digital habits!"),
        Level(id: 10, name: "Digital Freedom", duration: 3456000, milestoneMessage: "40 days clean! You've achieved digital freedom!")
    ]
} 
