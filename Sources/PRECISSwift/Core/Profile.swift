//
//  Profile.swift
//  PRECISSwift
//
//  Copyright (C) 2017 Alexander Tovstonozhenko
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import protocol Foundation.LocalizedError

public enum ProfileError: LocalizedError {

	case invalidCodePointAtIndex(UnicodeScalar, Int)

	public var errorDescription: String? {
		switch self {
		case let .invalidCodePointAtIndex(scalar, index):
			return "Invalid code point \(scalar) at \(index)."
		}
	}

}

public enum ProfileClass {
	case identifierClass
	case freeformClass
}

public protocol Profile {
	var baseClass: ProfileClass { get }
	func prepareString(_ string: String) throws
	func enforceString(_ string: String) throws -> String
	func applyWidthMappingRule(toString string: String) -> String
	func applyAdditionalMappingRule(toString string: String) -> String
	func applyCaseMappingRule(toString string: String) -> String
	func applyNormalizationRule(toString string: String) -> String
	func applyDirectionalityRule(toString string: String) -> String
}

public extension Profile {

	/// Ensures that the characters in a given string are allowed by the underlying
	/// PRECIS string class.
	///
	/// - Parameter string: string for evaluation
	/// - Throws: `ProfileError.invalidCodePointAtIndex` if a disallowed character is found
	/// in the string.
	public func prepareString(_ string: String) throws { // swiftlint:disable:this cyclomatic_complexity
		let isIdentifierClass = baseClass == .identifierClass

		try string.unicodeScalars.enumerated().forEach { index, scalar in
			// swiftlint:disable todo
			let isValid: Bool
			if scalar.isException {
				// TODO: add handling of contextual rules
				isValid = scalar.isExceptionallyAllowed
			} else if scalar.hasBackwardCompatibility {
				isValid = scalar.isBackwardCompatible
			} else if scalar.isUnassigned {
				isValid = false
			} else if scalar.isASCII7 {
				isValid = true
			} else if scalar.isJoinControl {
				// TODO: add handling of contextual rules
				isValid = false
			} else if scalar.isOldHangulJamo {
				isValid = false
			} else if scalar.isPrecisIgnorableProperty {
				isValid = false
			} else if scalar.isControl {
				isValid = false
			} else if scalar.hasCompat && isIdentifierClass {
				isValid = !isIdentifierClass
			} else if scalar.isLetterDigit {
				isValid = true
			} else if scalar.isOtherLetterDigit && isIdentifierClass {
				isValid = !isIdentifierClass
			} else if scalar.isSpace && isIdentifierClass {
				isValid = !isIdentifierClass
			} else if scalar.isSymbol && isIdentifierClass {
				isValid = !isIdentifierClass
			} else if scalar.isPunctuation && isIdentifierClass {
				isValid = !isIdentifierClass
			} else {
				isValid = false
			}
			// swiftlint:enable todo

			guard isValid else {
				throw ProfileError.invalidCodePointAtIndex(scalar, index)
			}
		}
	}

	public func enforceString(_ string: String) throws -> String {
		let rules = [
			applyWidthMappingRule,
			applyAdditionalMappingRule,
			applyCaseMappingRule,
			applyNormalizationRule,
			applyDirectionalityRule
		]
		let string = rules.reduce(string) { $1($0) }
		try prepareString(string)
		return string
	}

}
