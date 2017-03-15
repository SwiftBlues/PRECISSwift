//
//  CharacterSetExtensions.swift
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

extension CharacterSet {

	static var exceptionallyAllowedCharacters: CharacterSet {
		return _exceptionallyAllowedCharacters
	}

	static var exceptionallyDisallowedCharacters: CharacterSet {
		return _exceptionallyDisallowedCharacters
	}

	static var backwardCompatibleCharacters: CharacterSet {
		return _backwardCompatibleCharacters
	}

	static var nonBackwardCompatibleCharacters: CharacterSet {
		return _nonBackwardCompatibleCharacters
	}

	static var ascii7Characters: CharacterSet {
		return _ascii7Characters
	}

	static var joinControls: CharacterSet {
		return _joinControls
	}

	static var oldHangulJamoCharacters: CharacterSet {
		return _oldHangulJamoCharacters
	}

	static var defaultIgnorableCharacters: CharacterSet {
		return _defaultIgnorableCharacters
	}

	static var noncharacters: CharacterSet {
		return _noncharacters
	}

	static var precisControlCharacters: CharacterSet {
		return _controlCharacters
	}

}

fileprivate extension CharacterSet {

	static fileprivate func += (lhs: inout CharacterSet, rhs: UInt32) {
		guard let character = UnicodeScalar(rhs) else { return }

		lhs.insert(character)
	}

	static fileprivate func += (lhs: inout CharacterSet, rhs: ClosedRange<UInt32>) {
		guard
			let lower = UnicodeScalar(rhs.lowerBound),
			let upper = UnicodeScalar(rhs.upperBound)
			else { return }

		let range = ClosedRange(uncheckedBounds: (lower, upper))
		lhs.insert(charactersIn: range)
	}

}

private let _exceptionallyAllowedCharacters: CharacterSet = {
	var s = CharacterSet()
	s += 0x00DF
	s += 0x03C2
	s += 0x06FD
	s += 0x06FE
	s += 0x0F0B
	s += 0x3007
	return s
}()

private let _exceptionallyDisallowedCharacters: CharacterSet = {
	var s = CharacterSet()
	s += 0x00B7
	s += 0x0375
	s += 0x05F3
	s += 0x05F4
	s += 0x30FB
	s += 0x0660
	s += 0x0661
	s += 0x0662
	s += 0x0663
	s += 0x0664
	s += 0x0665
	s += 0x0666
	s += 0x0667
	s += 0x0668
	s += 0x0669
	s += 0x06F0
	s += 0x06F1
	s += 0x06F2
	s += 0x06F3
	s += 0x06F4
	s += 0x06F5
	s += 0x06F6
	s += 0x06F7
	s += 0x06F8
	s += 0x06F9
	s += 0x0640
	s += 0x07FA
	s += 0x302E
	s += 0x302F
	s += 0x3031
	s += 0x3032
	s += 0x3033
	s += 0x3034
	s += 0x3035
	s += 0x303B
	return s
}()

private let _backwardCompatibleCharacters: CharacterSet = {
	return CharacterSet()
}()

private let _nonBackwardCompatibleCharacters: CharacterSet = {
	return CharacterSet()
}()

private let _ascii7Characters: CharacterSet = {
	var s = CharacterSet()
	s += 0x0021...0x007E
	return s
}()

// Total code points: 2
private let _joinControls: CharacterSet = {
	var s = CharacterSet()
	s += 0x200C...0x200D
	return s
}()

// Total code points: 125 + 95 + 137 = 357
private let _oldHangulJamoCharacters: CharacterSet = {
	var s = CharacterSet()
	s += 0x1100...0x115F
	s += 0xA960...0xA97C
	s += 0x1160...0x11A7
	s += 0xD7B0...0xD7C6
	s += 0x11A8...0x11FF
	s += 0xD7CB...0xD7FB
	return s
}()

// Total code points: 4173
private let _defaultIgnorableCharacters: CharacterSet = {
	var s = CharacterSet()
	s += 0x00AD
	s += 0x034F
	s += 0x061C
	s += 0x115F...0x1160
	s += 0x17B4...0x17B5
	s += 0x180B...0x180D
	s += 0x180E
	s += 0x200B...0x200F
	s += 0x202A...0x202E
	s += 0x2060...0x2064
	s += 0x2065
	s += 0x2066...0x206F
	s += 0x3164
	s += 0xFE00...0xFE0F
	s += 0xFEFF
	s += 0xFFA0
	s += 0xFFF0...0xFFF8
	s += 0x1BCA0...0x1BCA3
	s += 0x1D173...0x1D17A
	s += 0xE0000
	s += 0xE0001
	s += 0xE0002...0xE001F
	s += 0xE0020...0xE007F
	s += 0xE0080...0xE00FF
	s += 0xE0100...0xE01EF
	s += 0xE01F0...0xE0FFF
	return s
}()

// Total code points: 66
private let _noncharacters: CharacterSet = {
	var s = CharacterSet()
	s += 0xFDD0...0xFDEF
	s += 0xFFFE...0xFFFF
	s += 0x1FFFE...0x1FFFF
	s += 0x2FFFE...0x2FFFF
	s += 0x3FFFE...0x3FFFF
	s += 0x4FFFE...0x4FFFF
	s += 0x5FFFE...0x5FFFF
	s += 0x6FFFE...0x6FFFF
	s += 0x7FFFE...0x7FFFF
	s += 0x8FFFE...0x8FFFF
	s += 0x9FFFE...0x9FFFF
	s += 0xAFFFE...0xAFFFF
	s += 0xBFFFE...0xBFFFF
	s += 0xCFFFE...0xCFFFF
	s += 0xDFFFE...0xDFFFF
	s += 0xEFFFE...0xEFFFF
	s += 0xFFFFE...0xFFFFF
	s += 0x10FFFE...0x10FFFF
	return s
}()

private let _controlCharacters: CharacterSet = {
	var s = CharacterSet()
	s += 0x0000...0x001F
	s += 0x007F...0x009F
	return s
}()
