#if canImport(UIKit)

import UIKit

/// A feedback generator that creates haptics to simulate physical impacts.
///
/// Should obtain instance using `shared` property.
///
/// Internally, this class uses concrete classes that are subclasses of `UIFeedbackGenerator` abstract superclass.
@available(iOS 10.0, macOS 13.1, *)
public final class HapticGenerator {
    
    /// A shared instance.
    public static let shared: HapticGenerator = .init()
    
    /// A Boolean value that indicates whether the generator create haptics.
    ///
    /// If this value is false, ignore all calls to this object.
    public var isOn: Bool = true
    
    /// 내부적으로 Generator 의 참조를 유지하기 위한 프로퍼티
    ///
    /// 명시적으로 준비 상태가 되는 함수를 호출하지 않는 한 이 프로퍼티는 Haptics 을 발생시킨 후 항상 nil 이 됩니다.
    private var feedbackGenerator: UIFeedbackGenerator?
    
    /// `UIImpactFeedbackGenerator` 를 사용하기 위해 인스턴스를 생성할 때 지정된 style 입니다.
    ///
    /// `UIImpactFeedbackGenerator` 인스턴스를 생성하고 나면 style 값에 접근할 수 없기때문에 임시로 style 값을 저장하기 위해 존재합니다.
    /// 따라서, 이 값은 마지막으로 생성한 `UIImpactFeedbackGenerator` 인스턴스의 style 값과 동일합니다.
    ///
    /// `UIImpactFeedbackGenerator` 이 아닌 다른 FeedbackGenerator 가 준비 중일 때도 값을 가질 순 있지만 영향을 미치진 않습니다.
    private var preparedImpactStyle: UIImpactFeedbackGenerator.FeedbackStyle?
    
    private init() {}
    
    /// Prepares the generator to trigger feedback.
    ///
    /// When you want occur impact after calling this method, you should call methods with the same `style` value to take low latency.
    public func impactPrepare(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        guard isOn else { return }
        
        if !(feedbackGenerator is UIImpactFeedbackGenerator) || (preparedImpactStyle != style) {
            feedbackGenerator = UIImpactFeedbackGenerator(style: style)
            preparedImpactStyle = style
        }
        
        feedbackGenerator?.prepare()
    }
    
    /// Triggers impact feedback with a specific style.
    public func impactOccurred(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        guard isOn else { return }
        
        defer {
            preparedImpactStyle = nil
            feedbackGenerator = nil
        }
        
        if !(feedbackGenerator is UIImpactFeedbackGenerator) || (preparedImpactStyle != style) {
            feedbackGenerator = UIImpactFeedbackGenerator(style: style)
        }
        
        (feedbackGenerator as? UIImpactFeedbackGenerator)?.impactOccurred()
    }
    
    /// Triggers impact feedback with a specific style and specific intensity.
    @available(iOS 13.0, *)
    public func impactOccurred(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat = 1.0) {
        guard isOn else { return }
        
        defer {
            preparedImpactStyle = nil
            feedbackGenerator = nil
        }
        
        if !(feedbackGenerator is UIImpactFeedbackGenerator) || (preparedImpactStyle != style) {
            feedbackGenerator = UIImpactFeedbackGenerator(style: style)
        }
        
        (feedbackGenerator as? UIImpactFeedbackGenerator)?.impactOccurred(intensity: intensity)
    }
    
    /// Triggers impact feedback with a specific style, and then keep preparing.
    ///
    /// When you want occur impact after calling this method, you should call methods with the same `style` value to take low latency.
    public func impactOccurredKeepPreparing(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        guard isOn else { return }
        
        if !(feedbackGenerator is UIImpactFeedbackGenerator) || (preparedImpactStyle != style) {
            feedbackGenerator = UIImpactFeedbackGenerator(style: style)
            preparedImpactStyle = style
        }
        
        (feedbackGenerator as? UIImpactFeedbackGenerator)?.impactOccurred()
        feedbackGenerator?.prepare()
    }
    
    /// Triggers impact feedback with a specific style and specific intensity, and then keep preparing.
    ///
    /// When you want occur impact after calling this method, you should call methods with the same `style` value to take low latency.
    @available(iOS 13.0, *)
    public func impactOccurredKeepPreparing(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat = 1.0) {
        guard isOn else { return }
        
        if !(feedbackGenerator is UIImpactFeedbackGenerator) || (preparedImpactStyle != style) {
            feedbackGenerator = UIImpactFeedbackGenerator(style: style)
            preparedImpactStyle = style
        }
        
        (feedbackGenerator as? UIImpactFeedbackGenerator)?.impactOccurred(intensity: intensity)
        feedbackGenerator?.prepare()
    }
    
    /// Prepares the generator to trigger feedback.
    public func selectionPrepare() {
        guard isOn else { return }
        
        if !(feedbackGenerator is UISelectionFeedbackGenerator) {
            feedbackGenerator = UISelectionFeedbackGenerator()
        }
        
        feedbackGenerator?.prepare()
    }
    
    /// Triggers selection feedback.
    public func selectionChanged() {
        guard isOn else { return }
        
        defer {
            feedbackGenerator = nil
        }
        
        if !(feedbackGenerator is UISelectionFeedbackGenerator) {
            feedbackGenerator = UISelectionFeedbackGenerator()
        }
        
        (feedbackGenerator as? UISelectionFeedbackGenerator)?.selectionChanged()
    }
    
    /// Triggers selection feedback, and then keep preparing.
    public func selectionChangedKeepPreparing() {
        guard isOn else { return }
        
        if !(feedbackGenerator is UISelectionFeedbackGenerator) {
            feedbackGenerator = UISelectionFeedbackGenerator()
        }
        
        (feedbackGenerator as? UISelectionFeedbackGenerator)?.selectionChanged()
        feedbackGenerator?.prepare()
    }
    
    /// Prepares the generator to trigger feedback.
    public func notificationPrepare() {
        guard isOn else { return }
        
        if !(feedbackGenerator is UINotificationFeedbackGenerator) {
            feedbackGenerator = UINotificationFeedbackGenerator()
        }
        
        feedbackGenerator?.prepare()
    }
    
    /// Triggers notification feedback.
    public func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        guard isOn else { return }
        
        defer {
            feedbackGenerator = nil
        }
        
        if !(feedbackGenerator is UINotificationFeedbackGenerator) {
            feedbackGenerator = UINotificationFeedbackGenerator()
        }
        
        (feedbackGenerator as? UINotificationFeedbackGenerator)?.notificationOccurred(notificationType)
    }
    
    /// Triggers notification feedback, and then keep preparing.
    public func notificationOccurredKeepPreparing(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        guard isOn else { return }
        
        if !(feedbackGenerator is UINotificationFeedbackGenerator) {
            feedbackGenerator = UINotificationFeedbackGenerator()
        }
        
        (feedbackGenerator as? UINotificationFeedbackGenerator)?.notificationOccurred(notificationType)
        feedbackGenerator?.prepare()
    }
}

#endif
