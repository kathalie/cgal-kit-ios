import XCTest
@testable import CGALKitSwift

final class CGALKitTests: XCTestCase {
    func testCubeVolume() throws {
        let cube = [
            Point3(x: 0.0, y: 0.0, z: 0.0),
            Point3(x: 1.0, y: 0.0, z: 0.0),
            Point3(x: 0.0, y: 1.0, z: 0.0),
            Point3(x: 1.0, y: 1.0, z: 0.0),
            Point3(x: 0.0, y: 0.0, z: 1.0),
            Point3(x: 1.0, y: 0.0, z: 1.0),
            Point3(x: 0.0, y: 1.0, z: 1.0),
            Point3(x: 1.0, y: 1.0, z: 1.0)
        ]
        let expectedVolumeOfCube = 1.0
        let calculatedVolumeOfCube = ConvexHull(from: cube).volume()
        
        XCTAssertEqual(expectedVolumeOfCube, calculatedVolumeOfCube, accuracy: 0.0001)
    }
    
    func testTetrahedronVolume() throws {
        let tetrahedron = [
            Point3(x: 0.0, y: 0.0, z: 0.0),
            Point3(x: 1.0, y: 0.0, z: 0.0),
            Point3(x: 0.0, y: 1.0, z: 0.0),
            Point3(x: 0.0, y: 0.0, z: 1.0)
        ]
        let expectedVolumeOfTetrahedron = 1/6.0
        let calculatedVolumeOfTetrahedron = ConvexHull(from: tetrahedron).volume()
        
        XCTAssertEqual(expectedVolumeOfTetrahedron, calculatedVolumeOfTetrahedron, accuracy: 0.0001)
    }
}
