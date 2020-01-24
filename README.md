# Shinjuku

A Dispatch Extension for Swift

## Requirements

- Swift 5+

## Usage

```swift
.package(url: "https://github.com/sinoru/Shinjuku.git", .upToNextMajor(from: "0.0.1"))
```

```swift
import Shinjuku 

DispatchQueue.main.safeSync {
    // This block will run as sync
    // But even same queue, this will not dead locked.
}
```
