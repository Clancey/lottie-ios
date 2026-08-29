// Created by Cal Stephens on 8/29/26.
// Copyright © 2026 Airbnb Inc. All rights reserved.

import CoreGraphics
import Foundation

// MARK: - CGFloat + AnyInitializable

extension CGFloat: AnyInitializable {

  /// Reads a `CGFloat` out of a JSON value.
  ///
  /// This exists because of a 32-bit trap. On watchOS - and any other
  /// `arm64_32` target - `CGFloat` is `Float`, not `Double`, and Swift's
  /// conditional casts from `NSNumber` are *exact*: `0.8333333333333334 as?
  /// Float` is `nil`, because the value cannot be represented without loss.
  /// The dictionary decoder reaches keyframe times through `as? CGFloat`, so
  /// on a 32-bit device every animation whose keyframes are not round numbers
  /// failed to decode, while the same file parsed on a 64-bit one - where
  /// `CGFloat` is `Double` and the cast is exact by definition.
  ///
  /// Going through `Double` first, then narrowing, is lossy in the last bits
  /// and completely correct for animation data.
  init(value: Any) throws {
    if let double = value as? Double {
      self.init(double)
    } else if let number = value as? NSNumber {
      self.init(number.doubleValue)
    } else if let array = value as? [Double], let first = array.first {
      self.init(first)
    } else {
      throw InitializableError.invalidInput()
    }
  }

}

extension [CGFloat] {

  /// The same narrowing, for the array case.
  init(anyValue: Any) throws {
    if let doubles = anyValue as? [Double] {
      self = doubles.map { CGFloat($0) }
    } else if let numbers = anyValue as? [NSNumber] {
      self = numbers.map { CGFloat($0.doubleValue) }
    } else {
      throw InitializableError.invalidInput()
    }
  }

}
