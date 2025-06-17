# Less is More: A Gamified Social Media Detox App

## Overview

**Less is More** is a minimalist iOS application designed to help users reduce their social media usage through a 40-day gamified challenge. The app promotes digital well-being by guiding users through progressive levels of abstaining from social media, using structured time intervals and motivational feedback.

This project was developed as part of a final course assignment to demonstrate the use of programming languages and its concepts.

---

## Use Case

In today's hyper-connected world, excessive social media use has been linked to distraction, stress, and decreased productivity. **Less is More** offers a practical tool for individuals who want to regain control over their time and attention.

By introducing game mechanics and milestone-based rewards, the app helps users build a long-term habit of reduced screen time and encourages mindful tech usage.

---

## Features

- **Gamified Progression System**  
  A structured 40-day challenge with increasing time intervals (e.g., 1 hour, 2 hours, 3 hours, up to 49 hours).

- **Motivational Welcome Screen**  
  On first launch (or daily), users receive a motivational message and practical tips for staying off social media.

- **Local Notifications**  
  Encouraging messages are triggered upon reaching new levels or hitting major milestones.

- **Minimalist Interface**  
  Clean UI showing the current level, time remaining, and inspirational quotes.

- **Progress Tracking**  
  Displays completed levels and time intervals, saved locally for user continuity.

---

## Technologies & Tools Used

- **Swift & UIKit**  
   Core programming language and UI framework for building the iOS app.

- **Xcode 16**  
   Integrated development environment for coding, debugging, and interface design.

- **UserNotifications Framework**  
   For scheduling and managing local notifications.

- **UserDefaults**  
   Used for local persistence of user progress and app state.

- **SF Symbols**  
   For clean, native iconography within the app interface.

  - **Queues & Arrays**  
     Arrays are used to manage the sequence of challenge intervals and store motivational messages. Queues help handle notification scheduling and ensure messages are delivered in the correct order as users progress through levels.

## How to Run the Project

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/less-is-more.git
   cd less-is-more
   ```

2. **Open the Project in Xcode 16**

   - Launch Xcode 16.
   - Open the `.xcodeproj` file.

3. **Build and Run**
   - Select a simulator or connect your iOS device.
   - Click the **Run** button (▶️) in Xcode to build and launch the app.
