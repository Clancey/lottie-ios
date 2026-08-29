//
//  CGPointExtension.swift
//  Lottie
//
//  Created by Marcelo Fabri on 5/5/22.
//

import CoreGraphics

extension CGPoint: AnyInitializable {

  // MARK: Lifecycle

  init(value: Any) throws {
    // `as? [String: CGFloat]` and `as? [CGFloat]` are exact casts from
    // NSNumber, and on a 32-bit target - watchOS, where CGFloat is Float -
    // they fail for any value that is not exactly representable. Reading the
    // numbers as Double and narrowing is correct everywhere.
    if let dictionary = value as? [String: Any] {
      guard
        let rawX = dictionary[CodingKeys.x.rawValue],
        let rawY = dictionary[CodingKeys.y.rawValue]
      else { throw InitializableError.invalidInput() }
      self.init(x: try CGFloat(value: rawX), y: try CGFloat(value: rawY))
    } else if
      let array = try? [CGFloat](anyValue: value),
      array.count > 1
    {
      self.init(x: array[0], y: array[1])
    } else {
      throw InitializableError.invalidInput()
    }
  }

  // MARK: Private

  private enum CodingKeys: String {
    case x
    case y
  }
}
