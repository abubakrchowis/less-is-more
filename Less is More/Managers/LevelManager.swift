import Foundation

class LevelManager {
    static let shared = LevelManager()
    
    private let defaults = UserDefaults.standard
    private let lastSocialMediaUseKey = "lastSocialMediaUse"
    private let currentLevelKey = "currentLevel"
    private let progressLogsKey = "progressLogs"
    private let levelUnlockTimeKey = "levelUnlockTime"
    
    private init() {}
    
    var lastSocialMediaUse: Date? {
        get { defaults.object(forKey: lastSocialMediaUseKey) as? Date }
        set { defaults.set(newValue, forKey: lastSocialMediaUseKey) }
    }
    
    var currentLevel: Int {
        get { defaults.integer(forKey: currentLevelKey) }
        set { defaults.set(newValue, forKey: currentLevelKey) }
    }
    
    var levelUnlockTime: Date? {
        get { defaults.object(forKey: levelUnlockTimeKey) as? Date }
        set { defaults.set(newValue, forKey: levelUnlockTimeKey) }
    }
    
    var progressLogs: [ProgressLog] {
        get {
            guard let data = defaults.data(forKey: progressLogsKey),
                  let logs = try? JSONDecoder().decode([ProgressLog].self, from: data) else {
                return []
            }
            return logs
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                defaults.set(data, forKey: progressLogsKey)
            }
        }
    }
    
    func timeSinceLastUse() -> TimeInterval? {
        guard let lastUse = lastSocialMediaUse else { return nil }
        return Date().timeIntervalSince(lastUse)
    }
    
    func timeSinceLevelUnlock() -> TimeInterval? {
        guard let unlockTime = levelUnlockTime else { return nil }
        return Date().timeIntervalSince(unlockTime)
    }
    
    func shouldUnlockNextLevel() -> Bool {
        guard let timeSinceLastUse = timeSinceLastUse() else { return false }
        
        // For the first level (currentLevel = 0), we need to check against the first level's duration
        let levelToCheck = currentLevel == 0 ? 0 : currentLevel
        guard levelToCheck < Level.levels.count else { return false }
        
        let level = Level.levels[levelToCheck]
        return timeSinceLastUse >= level.duration
    }
    
    func unlockNextLevel() {
        // If we're at level 0, move to level 1
        if currentLevel == 0 {
            currentLevel = 1
            levelUnlockTime = Date()
            let log = ProgressLog.createLog(levelId: currentLevel)
            progressLogs.append(log)
            return
        }
        
        // For subsequent levels
        guard currentLevel < Level.levels.count - 1 else { return }
        currentLevel += 1
        levelUnlockTime = Date()
        let log = ProgressLog.createLog(levelId: currentLevel)
        progressLogs.append(log)
    }
    
    func resetProgress() {
        lastSocialMediaUse = nil
        currentLevel = 0
        levelUnlockTime = nil
        progressLogs = []
    }
    
    func getCurrentLevelInfo() -> Level? {
        // For level 0, return the first level
        if currentLevel == 0 {
            return Level.levels[0]
        }
        
        guard currentLevel < Level.levels.count else { return nil }
        return Level.levels[currentLevel]
    }
} 