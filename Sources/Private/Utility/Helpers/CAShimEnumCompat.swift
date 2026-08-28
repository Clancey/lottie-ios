// Created by Cal Stephens on 8/28/26.
// Copyright © 2026 Airbnb Inc. All rights reserved.

#if os(watchOS)
import CAShim

// MARK: - CoreAnimation string-enum shorthands

/// Spells out the shorthands for Core Animation's string-backed enums.
///
/// These types are `NS_TYPED_ENUM` typedefs over `NSString *`. When Swift
/// imports the real QuartzCore it synthesises `CALayerContentsGravity.resize`
/// and friends from the `kCA…` constants; for `CAShim` it does not do so
/// reliably, and what it produced varied between SwiftPM and the Xcode
/// framework targets - `.resize` in one, `.gravityResize` in the other,
/// nothing at all once the module gained a second header. Depending on any of
/// that would be building on sand, so the members are simply defined here,
/// read through plain accessor functions in `LottieCAConstants.h` that are
/// immune to the importer's renaming. Every call site in the library is left
/// untouched.
extension CALayerContentsGravity {
  static let resize = LottieCAGravityResize()
  static let resizeAspect = LottieCAGravityResizeAspect()
  static let resizeAspectFill = LottieCAGravityResizeAspectFill()
  static let center = LottieCAGravityCenter()
  static let top = LottieCAGravityTop()
  static let bottom = LottieCAGravityBottom()
  static let left = LottieCAGravityLeft()
  static let right = LottieCAGravityRight()
}

extension CAMediaTimingFillMode {
  static let forwards = LottieCAFillModeForwards()
  static let backwards = LottieCAFillModeBackwards()
  static let both = LottieCAFillModeBoth()
  static let removed = LottieCAFillModeRemoved()
}

extension CAShapeLayerFillRule {
  static let nonZero = LottieCAFillRuleNonZero()
  static let evenOdd = LottieCAFillRuleEvenOdd()
}

extension CAShapeLayerLineCap {
  static let butt = LottieCALineCapButt()
  static let round = LottieCALineCapRound()
  static let square = LottieCALineCapSquare()
}

extension CAShapeLayerLineJoin {
  static let miter = LottieCALineJoinMiter()
  static let round = LottieCALineJoinRound()
  static let bevel = LottieCALineJoinBevel()
}

extension CAAnimationCalculationMode {
  static let linear = LottieCAAnimationLinear()
  static let discrete = LottieCAAnimationDiscrete()
  static let paced = LottieCAAnimationPaced()
  static let cubic = LottieCAAnimationCubic()
  static let cubicPaced = LottieCAAnimationCubicPaced()
}

extension CATextLayerAlignmentMode {
  static let natural = LottieCAAlignmentNatural()
  static let left = LottieCAAlignmentLeft()
  static let right = LottieCAAlignmentRight()
  static let center = LottieCAAlignmentCenter()
  static let justified = LottieCAAlignmentJustified()
}

extension CAMediaTimingFunctionName {
  static let linear = LottieCATimingLinear()
  static let easeIn = LottieCATimingEaseIn()
  static let easeOut = LottieCATimingEaseOut()
  static let easeInEaseOut = LottieCATimingEaseInEaseOut()
  static let `default` = LottieCATimingDefault()
}
#endif
