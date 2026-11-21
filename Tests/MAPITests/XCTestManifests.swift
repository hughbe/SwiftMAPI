import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MAPITests.allTests),
        testCase(EntryIDWriteTests.allTests),
        testCase(EntryIDHardeningTests.allTests),
    ]
}
#endif
