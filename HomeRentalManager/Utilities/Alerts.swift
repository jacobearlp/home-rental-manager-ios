//
//  Alerts.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/14/23.
//

import SwiftUI

public enum AlertType {
    case badLink
    case notImplemented
    case nonValidEmail
    case nonValidPasswordByPolicy
    case unexpectedServerResponse
    case unableToLogin
    case unableToSignUp
    case resetPassword
    case unableResetPassword
    case somethingWrong
    case subscriptionLogout
    case noSubscription
    case failedVerification
    case paymentInvalid
    case restorePurchase
    case restoreFailed
    case noReceiptFound
    case refreshReceiptFailed
    case subscriptionReminderOnDeleteAccount
    case confirmChangeProgram
    case confirmCurrentPrograRestartFromBeginning
    case confirmDeleteElectricityBill
}

class Alerts {

    typealias AlertAction = (() -> Void)?

    // swiftlint:disable function_body_length
    static func alert(type: AlertType, action: AlertAction = nil) -> Alert {
        var alert: Alert
        switch type {
        case .badLink:
            alert =  Alerts.badLinkAlert()
        case .notImplemented:
            alert =  Alerts.notImplementedAlert()
        case .nonValidEmail:
            alert = Alerts.nonValidEmailAlert()
        case .nonValidPasswordByPolicy:
            alert = Alerts.nonValidPasswordByPolicy()
        case .unexpectedServerResponse:
            alert = Alerts.unexpectedServerResponse()
        case .unableToLogin:
            alert = Alerts.unableToLogin()
        case .unableToSignUp:
            alert = Alerts.unableToSignUp()
        case .resetPassword:
            alert = Alerts.resetPassword()
        case .unableResetPassword:
            alert = Alerts.unableResetPassword()
        case .somethingWrong:
            alert = Alerts.somethingWrong()
        case .subscriptionLogout:
            alert = Alerts.subscriptionLogout(action: action)
        case .noSubscription:
            alert = Alerts.noSubscriptionFound()
        case .restorePurchase:
            alert = Alerts.restorePurchase(action: action)
        case .restoreFailed:
            alert = Alerts.restoreFailed()
        case .failedVerification:
            alert = Alerts.failedVerification()
        case .paymentInvalid:
            alert = Alerts.paymentInvalid()
        case .noReceiptFound:
            alert = Alerts.noReceiptFound()
        case .refreshReceiptFailed:
            alert = Alerts.receiptRefreshFailed()
        case .subscriptionReminderOnDeleteAccount:
            alert = Alerts.subscriptionReminderOnDeleteAccount()
        case .confirmChangeProgram:
            alert = Alerts.confirmChangeProgram(action: action)
        case .confirmCurrentPrograRestartFromBeginning:
            alert = Alerts.confirmRestartEnrolledProgramFromBeginning(action: action)
        case .confirmDeleteElectricityBill:
            alert = Alerts.confirmDeleteElectricityBill(action: action)
        }
        return alert
    }

    static func badLinkAlert() -> Alert {
        Alert(title: Text("Oops"),
              message: Text("Sorry, we can’t load that content at this time."),
              dismissButton: .default(Text("OK")))
    }

    static func notImplementedAlert() -> Alert {
        Alert(title: Text("Not implemented"),
              message: Text("Sorry, it has not been implemented yet"),
              dismissButton: .default(Text("OK")))
    }

    static func nonValidEmailAlert() -> Alert {
        Alert(title: Text("Please enter a valid email address"),
              message: Text(""),
              dismissButton: .default(Text("OK")))
    }

    static func nonValidPasswordByPolicy() -> Alert {
        Alert(title: Text("Password Requirement"),
              message: Text("Password should have at least 8 characters including:\n• an uppercase letter\n" +
                            "• a lowercase letter\n• a special character\n• a number"),
              dismissButton: .default(Text("OK")))
    }

    static func unexpectedServerResponse() -> Alert {
        Alert(title: Text("Unexpected server response"),
              message: Text(""),
              dismissButton: .default(Text("OK")))
    }

    static func unableToLogin() -> Alert {
        Alert(title: Text("Email log-in failed"),
              message: Text("Please check your details and try again."),
              dismissButton: .default(Text("OK")))
    }

    static func unableToSignUp() -> Alert {
        Alert(title: Text("Email sign-up failed"),
              message: Text("Please check your details and try again."),
              dismissButton: .default(Text("OK")))
    }

    static func resetPassword() -> Alert {
        Alert(title: Text("Reset Password"),
              message: Text("We have sent you an email with a link to reset your password."),
              dismissButton: .default(Text("OK")))
    }

    static func unableResetPassword() -> Alert {
        Alert(title: Text("Unable to Reset Password"),
              message: Text("We are unable to reset your password"),
              dismissButton: .default(Text("OK")))
    }

    static func somethingWrong() -> Alert {
        Alert(title: Text("Something went wrong"),
              message: Text(""),
              dismissButton: .default(Text("OK")))
    }

    static func noEquipmentSelection() -> Alert {
        Alert(title: Text("Please, make an equipment selection."),
              message: Text(""),
              dismissButton: .default(Text("OK")))
    }

    static func subscriptionLogout(action: AlertAction = nil) -> Alert {
        Alert(title: Text("Are you sure you want to logout?"),
              primaryButton: .cancel(Text("Cancel")),
              secondaryButton: .destructive(Text("Logout"), action: action))
    }

    static func noSubscriptionFound() -> Alert {
        Alert(title: Text("No Subscription Found"),
              message: Text("Please choose an option from this screen."),
              dismissButton: .default(Text("OK")))
    }

    static func restorePurchase(action: AlertAction = nil) -> Alert {
        Alert(title: Text("Are you sure?"),
              primaryButton: .cancel(Text("No")),
              secondaryButton: .default(Text("Yes"), action: action))
    }

    static func restoreFailed() -> Alert {
        Alert(title: Text("Subscription failed"),
              message: Text("Unable to restore purchase. Please try again later."),
              dismissButton: .default(Text("OK")))
    }

    static func failedVerification() -> Alert {
        Alert(title: Text("Subscription failed"),
              message: Text("Failed to verify subscription. Please try again later."),
              dismissButton: .default(Text("OK")))
    }

    static func paymentInvalid() -> Alert {
        Alert(title: Text("Subscription failed"),
              message: Text("Your Apple ID may not be set up correctly. Please check and try again."),
              dismissButton: .default(Text("OK")))
    }

    static func noReceiptFound() -> Alert {
        Alert(title: Text("Subscription failed"),
              message: Text("Unable to load receipt. Please try restoring your purchase."),
              dismissButton: .default(Text("OK")))
    }

    static func receiptRefreshFailed() -> Alert {
        Alert(title: Text("Subscription failed"),
              message: Text("Unable to fetch receipt. Please try restoring your purchase."),
              dismissButton: .default(Text("OK")))
    }

    static func subscriptionReminderOnDeleteAccount() -> Alert {
        Alert(title: Text("Account Deleted"),
              message: Text("Remember to cancel your subscription via AppStore."),
              dismissButton: .default(Text("OK")))
    }

    static func confirmChangeProgram(action: AlertAction = nil) -> Alert {
        Alert(title: Text("Are you sure you want to change program?"),
              primaryButton: .cancel(Text("Cancel")),
              secondaryButton: .default(Text("Continue"), action: action))
    }

    static func confirmRestartEnrolledProgramFromBeginning(action: AlertAction = nil) -> Alert {
        Alert(title: Text("You’re enrolled in this program, do you want to restart from the beginning?"),
              primaryButton: .cancel(Text("Cancel")),
              secondaryButton: .default(Text("Continue"), action: action))
    }

    static func confirmDeleteElectricityBill(action: AlertAction = nil) -> Alert {
        Alert(title: Text("Are you sure you want to delete this bill?"),
              primaryButton: .cancel(Text("Cancel")),
              secondaryButton: .destructive(Text("Delete"), action: action))
    }
}
