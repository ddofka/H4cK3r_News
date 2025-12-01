# H4cK3r News (SwiftUI + SwiftData)

H4cK3r News is a simple Hacker News reader built with SwiftUI and SwiftData.  
It fetches the top stories from the Hacker News API, displays them in a list, and allows the user to save (“stash”) articles for later reading. Saved articles persist locally using SwiftData.

---

<img width="311" height="606" alt="image" src="https://github.com/user-attachments/assets/8bc8e4eb-c323-4264-81a3-cf769a8ea294" />

---
## Features

### • Fetch Top Hacker News Stories  
The app loads the current top stories using the public Hacker News Algolia API:
`https://hn.algolia.com/api/v1/search?tags=front_page`

### • Full SwiftUI Interface  
- Modern `NavigationStack`-based navigation  
- Custom row interactions  
- Smooth animations  
- Bottom toolbar button for quick access to the stashed list  

### • Long-Press to Stash Articles  
- Long-press on any story in the list to save it  
- Haptic feedback on long-press  
- Small pop animation for visual confirmation  

### • Persistent Storage (SwiftData)  
Saved stories are stored using Apple’s SwiftData framework.  
The data persists across app launches and can be deleted with a swipe.

### • Stashed List  
A dedicated screen that shows all saved stories using `@Query` with SwiftData.  
Supports:
- Swipe-to-delete  
- Navigation to full article view  

---

## Requirements

- **iOS 17+**
- **Xcode 15+**
- SwiftUI  
- SwiftData  
- Internet connection for fetching stories  

---

## API Reference

The app uses the Hacker News Algolia index:
GET https://hn.algolia.com/api/v1/search?tags=front_page
This returns JSON containing:
- title
- points
- url
- objectID
- …and more, mapped into the local Post struct.
