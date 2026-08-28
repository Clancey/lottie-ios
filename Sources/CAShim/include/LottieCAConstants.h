#import "CALayer.h"
#import "CAMediaTiming.h"
#import "CAMediaTimingFunction.h"
#import "CAShapeLayer.h"
#import "CAAnimation.h"
#import "CATextLayer.h"

NS_ASSUME_NONNULL_BEGIN

/// Plain accessors for Core Animation's string-enum constants.
///
/// Swift renames the `kCA…` globals when it imports them, and what it renames
/// them TO depends on whether the real QuartzCore's API notes happen to be in
/// scope - `.resize` in the Xcode framework targets, `.gravityResize` under
/// SwiftPM. Reading them through functions sidesteps the renaming entirely, so
/// the Swift shim that restores the shorthands can be written once and mean
/// the same thing in both.
static inline CALayerContentsGravity LottieCAGravityResize(void) { return kCAGravityResize; }
static inline CALayerContentsGravity LottieCAGravityResizeAspect(void) { return kCAGravityResizeAspect; }
static inline CALayerContentsGravity LottieCAGravityResizeAspectFill(void) { return kCAGravityResizeAspectFill; }
static inline CALayerContentsGravity LottieCAGravityCenter(void) { return kCAGravityCenter; }
static inline CALayerContentsGravity LottieCAGravityTop(void) { return kCAGravityTop; }
static inline CALayerContentsGravity LottieCAGravityBottom(void) { return kCAGravityBottom; }
static inline CALayerContentsGravity LottieCAGravityLeft(void) { return kCAGravityLeft; }
static inline CALayerContentsGravity LottieCAGravityRight(void) { return kCAGravityRight; }

static inline CAMediaTimingFillMode LottieCAFillModeForwards(void) { return kCAFillModeForwards; }
static inline CAMediaTimingFillMode LottieCAFillModeBackwards(void) { return kCAFillModeBackwards; }
static inline CAMediaTimingFillMode LottieCAFillModeBoth(void) { return kCAFillModeBoth; }
static inline CAMediaTimingFillMode LottieCAFillModeRemoved(void) { return kCAFillModeRemoved; }

static inline CAShapeLayerFillRule LottieCAFillRuleNonZero(void) { return kCAFillRuleNonZero; }
static inline CAShapeLayerFillRule LottieCAFillRuleEvenOdd(void) { return kCAFillRuleEvenOdd; }

static inline CAShapeLayerLineCap LottieCALineCapButt(void) { return kCALineCapButt; }
static inline CAShapeLayerLineCap LottieCALineCapRound(void) { return kCALineCapRound; }
static inline CAShapeLayerLineCap LottieCALineCapSquare(void) { return kCALineCapSquare; }

static inline CAShapeLayerLineJoin LottieCALineJoinMiter(void) { return kCALineJoinMiter; }
static inline CAShapeLayerLineJoin LottieCALineJoinRound(void) { return kCALineJoinRound; }
static inline CAShapeLayerLineJoin LottieCALineJoinBevel(void) { return kCALineJoinBevel; }

static inline CAAnimationCalculationMode LottieCAAnimationLinear(void) { return kCAAnimationLinear; }
static inline CAAnimationCalculationMode LottieCAAnimationDiscrete(void) { return kCAAnimationDiscrete; }
static inline CAAnimationCalculationMode LottieCAAnimationPaced(void) { return kCAAnimationPaced; }
static inline CAAnimationCalculationMode LottieCAAnimationCubic(void) { return kCAAnimationCubic; }
static inline CAAnimationCalculationMode LottieCAAnimationCubicPaced(void) { return kCAAnimationCubicPaced; }

static inline CATextLayerAlignmentMode LottieCAAlignmentNatural(void) { return kCAAlignmentNatural; }
static inline CATextLayerAlignmentMode LottieCAAlignmentLeft(void) { return kCAAlignmentLeft; }
static inline CATextLayerAlignmentMode LottieCAAlignmentRight(void) { return kCAAlignmentRight; }
static inline CATextLayerAlignmentMode LottieCAAlignmentCenter(void) { return kCAAlignmentCenter; }
static inline CATextLayerAlignmentMode LottieCAAlignmentJustified(void) { return kCAAlignmentJustified; }

static inline CAMediaTimingFunctionName LottieCATimingLinear(void) { return kCAMediaTimingFunctionLinear; }
static inline CAMediaTimingFunctionName LottieCATimingEaseIn(void) { return kCAMediaTimingFunctionEaseIn; }
static inline CAMediaTimingFunctionName LottieCATimingEaseOut(void) { return kCAMediaTimingFunctionEaseOut; }
static inline CAMediaTimingFunctionName LottieCATimingEaseInEaseOut(void) { return kCAMediaTimingFunctionEaseInEaseOut; }
static inline CAMediaTimingFunctionName LottieCATimingDefault(void) { return kCAMediaTimingFunctionDefault; }

NS_ASSUME_NONNULL_END
