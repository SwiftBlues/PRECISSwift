//
//  OpaqueStringProfile.swift
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

public final class OpaqueStringProfile: Profile {

	public let baseClass = ProfileClass.freeformClass

	public func applyWidthMappingRule(toString string: String) -> String {
		return string
	}

	public func applyAdditionalMappingRule(toString string: String) -> String {
		fatalError()
	}

	public func applyCaseMappingRule(toString string: String) -> String {
		return string
	}

	public func applyNormalizationRule(toString string: String) -> String {
		return string.precomposedStringWithCanonicalMapping
	}

	public func applyDirectionalityRule(toString string: String) -> String {
		return string
	}

}
