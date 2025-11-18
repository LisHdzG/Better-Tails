# 🐾 Better Tails: Adopción Responsable, Simplificada.

## 💡 The Problem

The traditional pet adoption process is often a barrier:

* **Confusing:** Adopters are unsure of the commitment and logistics.
* **Inefficient:** Shelters lack the digital tools for effective matching and communication.
* **Uncertain:** The lack of support leads to higher rates of returned pets.

**Our Challenge:** Create a tech solution that simplifies the adoption journey while enforcing responsibility, building lasting connections between pets and their future families.

---

## ✨ The Better Tails Solution

Better Tails is the end-to-end digital platform designed for both the adopter and the shelter, focusing on three core pillars:

### 1. Smart Matching & Discovery (Swipe for Love)

We use an intuitive interface to help users quickly browse and save pets near them that match their lifestyle. Our platform promotes **"best fit"** adoption based on detailed pet profiles and location data.

<img width="350" alt="Home Screen & Finder" src="https://github.com/user-attachments/assets/a4aa90f2-af5e-40d3-ac93-671911861c23" />

#### Key Discovery Features:
* **Pet Finder:** Swipe-based interface for fast, engaging discovery.
* **Location Mapping:** See pets available for adoption on a map (`PetMapAnnotationView`).
* **Favorites List:** Easily save and track potential adoptees.

### 2. Comprehensive Educational Services

We provide immediate access to essential knowledge and a clear guide to responsible pet ownership, addressing the fear of not being ready.

<img src="https://github.com/user-attachments/assets/e2b7354a-3599-4564-9668-2728712ec90e" alt="Care Tips & Readiness Check" width="350"/>

#### Key Education Features:
* **Readiness Check:** A crucial step to confirm long-term commitment and home preparation.
* **Care Tips & Guides:** Detailed sections on diet, health, and training.
* **Emergency Protocol:** Quick access to critical pet emergency information.

### 3. Post-Adoption Support & Tracking

The process is transparent from start to finish. We provide real-time updates and direct communication tools to strengthen the bond between the new pet family and the shelter.

<img src="https://github.com/user-attachments/assets/ae7813b9-6965-4143-9007-6aa337ad588e" alt="Adoption Status & Services" width="350"/>

#### Key Support Features:
* **Adoption Tracker:** Real-time progress monitoring of the application (`PawProgressView`).
* **Direct Contact:** Easy access to the shelter via phone or WhatsApp.
* **Community Support:** Options to volunteer, donate, or foster for animals in need.

---

## 🛠️ Tech Stack & Architecture

| Category | Details |
| :--- | :--- |
| **Language** | Swift 5.9+ |
| **Frameworks** | **SwiftUI** (Declarative UI), MapKit (Location) |
| **Architecture** | MVVM (Model-View-ViewModel) |
| **Development** | iOS 17.0+ |

**Key Structure Insight:** The modular use of `ViewModels` (`PetsViewModel`, `ServicesViewModel`) ensures clear separation of business logic and UI, making the app highly scalable and testable.
