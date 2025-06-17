import UIKit

class HomeViewController: UIViewController {
    private let levelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progressTintColor = .systemBlue
        progress.trackTintColor = .systemGray5
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset Progress", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTimer()
        checkFirstLaunch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(levelLabel)
        view.addSubview(timeLabel)
        view.addSubview(progressView)
        view.addSubview(progressLabel)
        view.addSubview(messageLabel)
        view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            levelLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            levelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            levelLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            timeLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 32),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            progressView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 24),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            progressLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 8),
            progressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            messageLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 32),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 32),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateUI()
        }
    }
    
    private func checkFirstLaunch() {
        if LevelManager.shared.lastSocialMediaUse == nil {
            showWelcomeScreen()
        }
    }
    
    private func showWelcomeScreen() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .overFullScreen
        present(welcomeVC, animated: true)
    }
    
    private func updateUI() {
        guard let timeSinceLastUse = LevelManager.shared.timeSinceLastUse() else {
            timeLabel.text = "Not Started"
            levelLabel.text = "Level 0"
            messageLabel.text = "Tap 'Begin Journey' to start"
            progressView.progress = 0
            progressLabel.text = ""
            showWelcomeScreen()
            return
        }
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        timeLabel.text = formatter.string(from: timeSinceLastUse)
        
        if let currentLevel = LevelManager.shared.getCurrentLevelInfo() {
            levelLabel.text = "Level \(currentLevel.id): \(currentLevel.name)"
            messageLabel.text = currentLevel.milestoneMessage
            
            // Calculate progress towards next level using level unlock time
            if let timeSinceLevelUnlock = LevelManager.shared.timeSinceLevelUnlock() {
                let progress = Float(timeSinceLevelUnlock / currentLevel.duration)
                progressView.progress = min(progress, 1.0)
                
                // Calculate remaining time
                let remainingTime = max(0, currentLevel.duration - timeSinceLevelUnlock)
                let remainingFormatter = DateComponentsFormatter()
                remainingFormatter.allowedUnits = [.day, .hour, .minute]
                remainingFormatter.unitsStyle = .abbreviated
                if let remainingString = remainingFormatter.string(from: remainingTime) {
                    progressLabel.text = "\(Int(progress * 100))% complete • \(remainingString) until next level"
                }
            } else {
                // If no level unlock time, use total time
                let progress = Float(timeSinceLastUse / currentLevel.duration)
                progressView.progress = min(progress, 1.0)
                
                let remainingTime = max(0, currentLevel.duration - timeSinceLastUse)
                let remainingFormatter = DateComponentsFormatter()
                remainingFormatter.allowedUnits = [.day, .hour, .minute]
                remainingFormatter.unitsStyle = .abbreviated
                if let remainingString = remainingFormatter.string(from: remainingTime) {
                    progressLabel.text = "\(Int(progress * 100))% complete • \(remainingString) until next level"
                }
            }
            
            if LevelManager.shared.shouldUnlockNextLevel() {
                LevelManager.shared.unlockNextLevel()
                if let nextLevel = LevelManager.shared.getCurrentLevelInfo() {
                    NotificationManager.shared.scheduleLevelCompletionNotification(for: nextLevel)
                }
            }
        }
    }
    
    @objc private func resetTapped() {
        let alert = UIAlertController(
            title: "Reset Progress",
            message: "Are you sure you want to reset your progress?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Reset", style: .destructive) { [weak self] _ in
            LevelManager.shared.resetProgress()
            NotificationManager.shared.removeAllNotifications()
            self?.updateUI()
        })
        
        present(alert, animated: true)
    }
    
    deinit {
        timer?.invalidate()
    }
} 