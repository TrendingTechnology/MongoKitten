import MongoKitten
import NIO
import XCTest

#if canImport(NIOTransportServices)
import NIOTransportServices
let loop = NIOTSEventLoopGroup(loopCount: 1, defaultQoS: .default).next()
#else
let loop = MultiThreadedEventLoopGroup(numberOfThreads: 1).next()
#endif

class CRUDTests : XCTestCase {
    let settings = try! ConnectionSettings("mongodb://localhost:27017")
    var db: MongoCluster!

    override func setUp() {
        db = try! MongoCluster.connect(on: loop, settings: settings)
    }
    
    func testListDatabases() throws {
        try XCTAssertTrue(db.listDatabases().wait().contains { $0.name == "admin" })
    }

    func testInsert() {
        
    }
}
