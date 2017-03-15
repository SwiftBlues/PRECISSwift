//
//  UnicodeScalarExtensions.swift
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

import Foundation

extension UnicodeScalar {

	var isException: Bool {
		return isExceptionallyAllowed || isExceptionallyDisallowed
	}

	var isExceptionallyAllowed: Bool {
		return CharacterSet.exceptionallyAllowedCharacters.contains(self)
	}

	var isExceptionallyDisallowed: Bool {
		return CharacterSet.exceptionallyDisallowedCharacters.contains(self)
	}

	var hasBackwardCompatibility: Bool {
		return isBackwardCompatible || isNonBackwardCompatible
	}

	var isBackwardCompatible: Bool {
		return CharacterSet.backwardCompatibleCharacters.contains(self)
	}

	var isNonBackwardCompatible: Bool {
		return CharacterSet.nonBackwardCompatibleCharacters.contains(self)
	}

	var isUnassigned: Bool {
		return CharacterSet.illegalCharacters.contains(self)
	}

	var isASCII7: Bool {
		return CharacterSet.ascii7Characters.contains(self)
	}

	var isJoinControl: Bool {
		return CharacterSet.joinControls.contains(self)
	}

	var isOldHangulJamo: Bool {
		return CharacterSet.oldHangulJamoCharacters.contains(self)
	}

	var isPrecisIgnorableProperty: Bool {
		return CharacterSet.defaultIgnorableCharacters.contains(self)
			|| CharacterSet.noncharacters.contains(self)
	}

	var isControl: Bool {
		return CharacterSet.precisControlCharacters.contains(self)
	}

	var hasCompat: Bool {
		let normalized = String(Character(self)).precomposedStringWithCompatibilityMapping
		// I'm not sure if NFKC can produce more than one code point so I added this first
		// condition just to be safe.
		return normalized.unicodeScalars.count != 1
			|| normalized.unicodeScalars.first != self
	}

	var isLetterDigit: Bool {
		fatalError()
	}

	var isOtherLetterDigit: Bool {
		fatalError()
	}

	var isSpace: Bool {
		return CharacterSet.whitespaces.contains(self)
	}

	var isSymbol: Bool {
		return CharacterSet.symbols.contains(self)
	}

	var isPunctuation: Bool {
		return CharacterSet.punctuationCharacters.contains(self)
	}

}
