# CGALKit

**CGALKit** is a Swift framework that integrates powerful computational geometry algorithms of the C++ library CGAL (Computational Geometry Algorithms Library) with Swift. The framework allows users to compute the convex hull and volume of a set of 3D points, using the implementation of CGAL.

**Important:** This framework uses [Swift and C++ interoperability introduced by WWDC23](https://developer.apple.com/videos/play/wwdc2023/10172/?time=40).

## Features

- **Volume Computation**: Compute the volume of the convex hull formed by a set of 3D points.

## Installation

### Swift Package Manager (SPM)
1. In Xcode, in your destination target, It is important to enable [Swift and C++ interoperability](https://www.swift.org/documentation/cxx-interop/#enabling-c-interoperability). In **Build Settings > Swift Compiler - Language** set **C++ and Objective-C++ Interoperability** to **C++/Objective-C++**.
2. Go to **File > Add Packcage Dependencies...**
3. Insert `https://github.com/kathalie/cgal-kit-ios.git` to the field **Search or Enter Package URL**
4. Select `cgal-kit-ios` and make sure to add it to a correct target. **Important: ** set **Dependency Rule** to **Branch** - **main**, to enable unsafe linker flags, which allow access to the CGAL library.
5. Click **Add Package**.
6. `import CGALKitSwift` in files, where you wish to use the CGAL API.

## Usage

To compute the convex hull and its volume using the CGALKit, you need to create a list of `Point3` objects and pass it to the `ConvexHull` class.

### Example:

```swift
import CGALKitSwift

// Define points
let points: [Point3] = [
    Point3(x: 0.0, y: 0.0, z: 0.0),
    Point3(x: 1.0, y: 0.0, z: 0.0),
    Point3(x: 0.0, y: 1.0, z: 0.0),
    Point3(x: 0.0, y: 0.0, z: 1.0)
]

// Create ConvexHull instance
let convexHull = ConvexHull(from: points)

// Compute volume of the convex hull
let volume = convexHull.volume()

print("Volume of the convex hull: \(volume)")
```
