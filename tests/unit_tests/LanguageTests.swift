import Foundation
import XCTest

final class LanguageTests: XCTestCase {
    func test_preferredLanguage() {
        let lang = Locale.preferredLanguages.first!
        XCTAssertEqual(lang, "es", "expected the 'es' lang")
    }

    func test_localizedMessage() {
        let message = loadLocalizedText()
        XCTAssertEqual(message, "Hola Mundo de los Testes! (es)", "expected message in Spanish")
    }
   
    func test_systemText() throws {
        let jsonString = "{}"
        let jsonData = try XCTUnwrap(jsonString.data(using: .utf8))
        let decoder = JSONDecoder()

        // This test check the language of localized text created by the system.
        XCTAssertThrowsError(try decoder.decode(TestObject.self, from: jsonData)) { error in
            XCTAssertEqual(error.localizedDescription, "No se han podido leer los datos porque no se encuentran.", "expected fail message in Spanish")
        }
    }
}

private func loadLocalizedText() -> String {
    let bundle = Bundle(for: LanguageTests.self)
    let format = bundle.localizedString(forKey: "Unit.Test.Message", value: "fallback - no text in bundle", table: "test")
    return String(format: format, locale: Locale.current)
}

struct TestObject: Decodable {
    let message: String
}
