import Foundation

struct Level: Codable {
    let id: Int
    let name: String
    let duration: TimeInterval
    let milestoneMessage: String
    
    static let levels: [Level] = [
        Level(id: 1, name: "Level 1", duration: 3600 * 1, milestoneMessage: "1 hour clean! Great start!"),
        Level(id: 2, name: "Level 2", duration: 3600 * 2, milestoneMessage: "2 hours clean! Keep going!"),
        Level(id: 3, name: "Level 3", duration: 3600 * 3, milestoneMessage: "3 hours clean! Nice progress!"),
        Level(id: 4, name: "Level 4", duration: 3600 * 4, milestoneMessage: "4 hours clean! You're on a roll!"),
        Level(id: 5, name: "Level 5", duration: 3600 * 5, milestoneMessage: "5 hours clean! Stay focused!"),
        Level(id: 6, name: "Level 6", duration: 3600 * 6, milestoneMessage: "6 hours clean! Impressive!"),
        Level(id: 7, name: "Level 7", duration: 3600 * 7, milestoneMessage: "7 hours clean! Keep it up!"),
        Level(id: 8, name: "Level 8", duration: 3600 * 8, milestoneMessage: "8 hours clean! You're doing great!"),
        Level(id: 9, name: "Level 9", duration: 3600 * 9, milestoneMessage: "9 hours clean! Almost to double digits!"),
        Level(id: 10, name: "Level 10", duration: 3600 * 10, milestoneMessage: "10 hours clean! Double digits!"),
        Level(id: 11, name: "Level 11", duration: 3600 * 11, milestoneMessage: "11 hours clean! Keep pushing!"),
        Level(id: 12, name: "Level 12", duration: 3600 * 12, milestoneMessage: "12 hours clean! Half a day!"),
        Level(id: 13, name: "Level 13", duration: 3600 * 13, milestoneMessage: "13 hours clean! Lucky number!"),
        Level(id: 14, name: "Level 14", duration: 3600 * 14, milestoneMessage: "14 hours clean! You're doing awesome!"),
        Level(id: 15, name: "Level 15", duration: 3600 * 15, milestoneMessage: "15 hours clean! Keep the streak!"),
        Level(id: 16, name: "Level 16", duration: 3600 * 16, milestoneMessage: "16 hours clean! Stay strong!"),
        Level(id: 17, name: "Level 17", duration: 3600 * 17, milestoneMessage: "17 hours clean! Almost a day!"),
        Level(id: 18, name: "Level 18", duration: 3600 * 18, milestoneMessage: "18 hours clean! Great discipline!"),
        Level(id: 19, name: "Level 19", duration: 3600 * 19, milestoneMessage: "19 hours clean! Keep going!"),
        Level(id: 20, name: "Level 20", duration: 3600 * 20, milestoneMessage: "20 hours clean! Halfway to 40!"),
        Level(id: 21, name: "Level 21", duration: 3600 * 21, milestoneMessage: "21 hours clean! Almost a full day!"),
        Level(id: 22, name: "Level 22", duration: 3600 * 22, milestoneMessage: "22 hours clean! Stay focused!"),
        Level(id: 23, name: "Level 23", duration: 3600 * 23, milestoneMessage: "23 hours clean! One more to a day!"),
        Level(id: 24, name: "Level 24", duration: 3600 * 24, milestoneMessage: "24 hours clean! One day!"),
        Level(id: 25, name: "Level 25", duration: 3600 * 25, milestoneMessage: "25 hours clean! Keep it up!"),
        Level(id: 26, name: "Level 26", duration: 3600 * 26, milestoneMessage: "26 hours clean! You're doing great!"),
        Level(id: 27, name: "Level 27", duration: 3600 * 27, milestoneMessage: "27 hours clean! Stay strong!"),
        Level(id: 28, name: "Level 28", duration: 3600 * 28, milestoneMessage: "28 hours clean! Keep pushing!"),
        Level(id: 29, name: "Level 29", duration: 3600 * 29, milestoneMessage: "29 hours clean! Almost 30!"),
        Level(id: 30, name: "Level 30", duration: 3600 * 30, milestoneMessage: "30 hours clean! 10 to go!"),
        Level(id: 31, name: "Level 31", duration: 3600 * 31, milestoneMessage: "31 hours clean! Keep going!"),
        Level(id: 32, name: "Level 32", duration: 3600 * 32, milestoneMessage: "32 hours clean! You're doing awesome!"),
        Level(id: 33, name: "Level 33", duration: 3600 * 33, milestoneMessage: "33 hours clean! Almost there!"),
        Level(id: 34, name: "Level 34", duration: 3600 * 34, milestoneMessage: "34 hours clean! Stay focused!"),
        Level(id: 35, name: "Level 35", duration: 3600 * 35, milestoneMessage: "35 hours clean! Five left!"),
        Level(id: 36, name: "Level 36", duration: 3600 * 36, milestoneMessage: "36 hours clean! Almost done!"),
        Level(id: 37, name: "Level 37", duration: 3600 * 37, milestoneMessage: "37 hours clean! Keep it up!"),
        Level(id: 38, name: "Level 38", duration: 3600 * 38, milestoneMessage: "38 hours clean! Nearly there!"),
        Level(id: 39, name: "Level 39", duration: 3600 * 39, milestoneMessage: "39 hours clean! One more to go!"),
        Level(id: 40, name: "Digital Freedom", duration: 3600 * 40, milestoneMessage: "40 days clean! You've achieved digital freedom!")
    ]
} 
