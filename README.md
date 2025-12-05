<div align="center">

# 🍎 Accessible Writer
### A Gold-Standard Reference for Modern macOS Accessibility

**Proof of Concept · Semantic Architecture · WWDC25 Inspired**

<br>

[![Swift 6](https://img.shields.io/badge/Swift-6-F05138?logo=swift)](https://swift.org)
[![Platform](https://img.shields.io/badge/macOS-15+-000000?logo=apple)](https://developer.apple.com/macos/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Xcode 16+](https://img.shields.io/badge/Xcode-16+-147EFB?logo=xcode)](https://developer.apple.com/xcode/)

</div>

---

## 🧠 Project Philosophy

> **Code can be compassionate.** Accessible Writer demonstrates how semantic architecture—rather than visual approximation—can create superior experiences for everyone.

Recreated from the WWDC25 session **"Make your Mac app more accessible to everyone,"** this project transforms navigation hierarchies into a frictionless document editing experience that is:

- **Robust** for VoiceOver users
- **Intuitive** for everyone else
- **Semantically precise** by design

---

## 🏗️ Clean Architecture

<div class="architecture-tree">

```bash
AccessibleWriter/
│
├── App/ # 🚀 Application Entry
│ └── AccessibleWriterApp.swift
│
├── Models/ # 📊 Domain Models
│ └── DocumentPage.swift # Value types (Identifiable, Hashable)
│
├── State/ # 🧠 State Management
│ └── DocumentStore.swift # @Observable source of truth
│
├── Views/ # 🎨 UI Layer
│ ├── ContentView.swift # NavigationSplitView Shell
│ ├── SidebarView.swift # List + Rotors + Actions
│ ├── EditorView.swift # TextEditor + Traits
│ └── Inspector/
│ └── FormattingView.swift # Containers + Combined Elements
│
└── Resources/
└── Assets.xcassets
```


</div>

---

## ✨ Innovations

### **The "Invisible" Container Architecture**

| Problem | Solution | Result |
|---------|----------|--------|
| Inspectors with dozens of buttons trap VoiceOver users | `.accessibilityElement(children: .contain)` grouping | "Style Presets, group" announced—skip or dive in one step |

### **Advanced Rotor Integration**

| Problem | Solution | Result |
|---------|----------|--------|
| Linear navigation through hundreds of pages is tedious | Custom Bookmarks Rotor | Rotate two fingers → "Bookmarks" → flick up/down to jump |

### **Hidden Interaction Exposure**

| Problem | Solution | Result |
|---------|----------|--------|
| Hover-only buttons are invisible to VoiceOver | `.accessibilityAction(named:)` | "Bookmark" available via Actions menu or Voice Control |

---

## 🎯 Technical Highlights

<div class="highlight-card">

### **1. Modern State Observation**
```swift
@Observable
class DocumentStore {
    var pages: [DocumentPage]
    var selection: DocumentPage.ID?
    // Updates UI automatically without @Published
}
```

### **2. Semantic Grouping**
```swift
VStack {
    Text("Style Presets").accessibilityHidden(true)
    StyleRow(label: "Title")
    StyleRow(label: "Body")
}
.accessibilityElement(children: .contain)
.accessibilityLabel("Style Presets")
```

### **3. Custom Rotors**
```swift
.accessibilityRotor("Bookmarks") {
    ForEach(store.pages) { page in
        if page.isBookmarked {
            AccessibilityRotorEntry("Page \(page.number)", id: page.id)
        }
    }
}
```

## Technologies Used 💻

This project leverages deep integration with the iOS Accessibility stack and Audio frameworks.

- [x] Swift 6: Concurrency and strict typing.
- [x] SwiftUI 6.0: NavigationSplitView, .inspector, and declarative layout.
- [x] Observation: @Observable, @Bindable (Replacing ObservableObject).
- [x] Accessibility APIs: UIAccessibility, Custom Rotors, Traits, Actions.
- [x] AppKit: Window management and frame sizing.
- [x] Foundation: Data modeling and hashing.

## Skills Demonstrated 🥋

This project demonstrates the technical competencies required for professional Accessibility Engineering:

- [x] **Universal Design Architecture** – Accessibility Tree as primary navigation source
- [x] **Advanced VoiceOver APIs** – Custom rotors, container grouping, actions
- [x] **Focus Hierarchy Control** – Programmatic grouping to reduce "swipe fatigue"
- [x] **Interaction Modeling** – Decoupling logic from visual triggers
- [x] **State Synchronization** – Complex sidebar-editor-inspector coordination

## Contributing ⚙️

We welcome contributions from engineers interested in **Assistive Technologies**. If you have ideas for improving the semantic tagging or haptic patterns, please fork the repo and submit a PR.

## License 🪪

This project is licensed under the MIT License.

</div>
