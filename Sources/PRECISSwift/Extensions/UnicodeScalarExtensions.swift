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
		fatalError()
	}

	var isBackwardsCompatible: Bool {
		fatalError()
	}

	var isUnassigned: Bool {
		fatalError()
	}

	var isASCII7: Bool {
		fatalError()
	}

	var isJoinControl: Bool {
		fatalError()
	}

	var isOldHangulJamo: Bool {
		fatalError()
	}

	var isPrecisIgnorableProperty: Bool {
		return isDefaultIgnorable || isNoncharacter
	}

	var isControl: Bool {
		fatalError()
	}

	var hasCompat: Bool {
		fatalError()
	}

	var isLetterDigit: Bool {
		return CharacterSet.alphanumerics.contains(self)
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

extension UnicodeScalar {

	fileprivate var isDefaultIgnorable: Bool {
		return value == 0x00AD
			|| value == 0x034F
			|| value == 0x061C
			|| value >= 0x115F && value <= 0x1160
			|| value >= 0x17B4 && value <= 0x17B5
			|| value >= 0x180B && value <= 0x180D
			|| value == 0x180E
			|| value >= 0x200B && value <= 0x200F
			|| value >= 0x202A && value <= 0x202E
			|| value >= 0x2060 && value <= 0x2064
			|| value == 0x2065
			|| value >= 0x2066 && value <= 0x206F
			|| value == 0x3164
			|| value >= 0xFE00 && value <= 0xFE0F
			|| value == 0xFEFF
			|| value == 0xFFA0
			|| value >= 0xFFF0 && value <= 0xFFF8
			|| value >= 0x1BCA0 && value <= 0x1BCA3
			|| value >= 0x1D173 && value <= 0x1D17A
			|| value == 0xE0000
			|| value == 0xE0001
			|| value >= 0xE0002 && value <= 0xE001F
			|| value >= 0xE0020 && value <= 0xE007F
			|| value >= 0xE0080 && value <= 0xE00FF
			|| value >= 0xE0100 && value <= 0xE01EF
			|| value >= 0xE01F0 && value <= 0xE0FF
	}

	fileprivate var isNoncharacter: Bool {
		return value >= 0xFDD0 && value <= 0xFDFD
			|| value >= 0xFFF9 && value <= 0xFFFF
			|| value >= 0x1FFFE && value <= 0x1FFFF
			|| value >= 0x2FFFE && value <= 0x2FFFF
			|| value >= 0x3FFFE && value <= 0x3FFFF
			|| value >= 0x4FFFE && value <= 0x4FFFF
			|| value >= 0x5FFFE && value <= 0x5FFFF
			|| value >= 0x6FFFE && value <= 0x6FFFF
			|| value >= 0x7FFFE && value <= 0x7FFFF
			|| value >= 0x8FFFE && value <= 0x8FFFF
			|| value >= 0x9FFFE && value <= 0x9FFFF
			|| value >= 0xAFFFE && value <= 0xAFFFF
			|| value >= 0xBFFFE && value <= 0xBFFFF
			|| value >= 0xCFFFE && value <= 0xCFFFF
			|| value >= 0xDFFFE && value <= 0xDFFFF
			|| value >= 0xEFFFE && value <= 0x10FFFF
	}

}
