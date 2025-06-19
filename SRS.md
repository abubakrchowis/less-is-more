# Software Requirements Specification (SRS)

## Project Title: Less is More – A Gamified Social Media Detox App

**Prepared by:** Abu-Bakr
**Date:** 19/06/2025
**Course:** Introduction to Software Engineering

---

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to define the requirements for "Less is More," an iOS mobile application that helps users reduce their social media usage by implementing a gamified 40-day detox system. The application is designed to guide users through gradually increasing time intervals away from social media while offering motivational messages and progress tracking.

### 1.2 Scope

"Less is More" provides users with a clean, distraction-free experience and motivates them through a level-based system that rewards consistent abstinence from social media. The app uses local notifications, minimalist design, and data persistence via UserDefaults. No internet connection or backend server is required.

### 1.3 Definitions, Acronyms, and Abbreviations

- **SDLC**: Software Development Life Cycle
- **OOP**: Object-Oriented Programming

### 1.4 References

- Apple Developer Documentation: [https://developer.apple.com/documentation](https://developer.apple.com/documentation)
- IEEE SRS Standard Template

---

## 2. Overall Description

### 2.1 Product Perspective

The app is a standalone iOS application developed using Swift and UIKit. It runs locally without needing an internet connection or user account. The target devices are iPhones running iOS 14 or higher.

### 2.2 Product Functions

- Present motivational content and detox tips at launch.
- Track user progress across 40 levels (1 hour to 40 hours).
- Schedule local notifications upon level completion.
- Visually display progress via timeline or progress bar.
- Save and restore progress using UserDefaults.

### 2.3 User Classes and Characteristics

- **Primary User**: Individuals aged 12–50 who wish to reduce their time spent on social media.
- Users are expected to have basic familiarity with mobile apps but no technical knowledge.

### 2.4 Operating Environment

- Platform: iOS 15+
- Development Tools: Xcode, Swift, UIKit
- No third-party dependencies required.

### 2.5 Design and Implementation Constraints

- Use only native iOS frameworks.
- Notifications must not rely on push services.
- Data must be stored locally and persist between sessions.

### 2.6 User Documentation

- README in GitHub repository
- In-app walkthrough and tips at launch

### 2.7 Assumptions and Dependencies

- The user will allow notification permissions.
- The device's local time is used to track progress.
- No network or external services are required.

---

## 3. Specific Requirements

### 3.1 Functional Requirements

#### FR1: Launch Motivation Screen

- On first launch or daily, display a screen with motivational message and tips.

#### FR2: Level System

- User progresses through levels: Level 1 (1h), Level 2 (2h), ..., Level 16 (16 hours).
- Each level requires staying off social media for a set time.

#### FR3: Progress Tracking

- Track and display current level and progress history.

#### FR4: Local Notifications

- Send motivational notifications when a level is completed or milestone is reached.

#### FR5: Restart Function

- Allow users to reset their progress and restart the detox challenge.

### 3.2 Non-Functional Requirements

#### NFR1: Usability

- Interface must be simple, clean, and intuitive.

#### NFR2: Performance

- App must launch in under 1 second.
- Notifications must fire without delay.

#### NFR3: Reliability

- Progress must persist across app launches and device restarts.

#### NFR4: Portability

- App must run on iPhones with iOS 15 or newer.

#### NFR5: Maintainability

- Code must follow most known MVC architecture and be well-documented.

---

## 4. External Interface Requirements

### 4.1 User Interfaces

- **Welcome Screen**: Displays motivation and detox tips.
- **Home Screen**: Shows current level, time remaining, and option to reset.
- **Progress Screen**: Timeline or list of completed levels.

### 4.2 Hardware Interfaces

- No external hardware required.

### 4.3 Software Interfaces

- Uses:
  - `UNUserNotificationCenter` for scheduling notifications
  - `UserDefaults` for local persistence
  - `UIKit` for user interface

### 4.4 Communications Interfaces

- No internet access or network communication is used.

---

## 5. Appendices

- A. Sample Level Timeline:

  - Level 1: 1h
  - Level 2: 2h
  - Level 3: 3h
  - ...
  - Level 40: 40h

- B. Notification Samples:

  - "You're now 4 hours clean. Keep going!"
  - "🎯 Day 1 complete. Time well spent!"

- C. Future Enhancements (Optional):
  - Add widgets to show current level
  - Support custom challenge durations
  - Export progress to PDF
  - Add integration with Screen Time API to detect detox breaks

---
