# Array of AppxPackage names that are considered removable

function Get-RemovableApps {
    return @(
        "Microsoft.BingWeather", "Microsoft.DesktopAppInstaller", "Microsoft.GetHelp",
        "Microsoft.Getstarted", "Microsoft.Messaging", "Microsoft.Microsoft3DViewer",
        "Microsoft.MicrosoftOfficeHub", "Microsoft.MicrosoftSolitaireCollection",
        "Microsoft.MicrosoftStickyNotes", "Microsoft.MixedReality.Portal",
        "Microsoft.OneConnect", "Microsoft.Print3D", "Microsoft.SkypeApp", "Microsoft.Wallet",
        "Microsoft.WebMediaExtensions", "Microsoft.WebpImageExtension",
        "Microsoft.WindowsCamera", "microsoft.windowscommunicationsapps", "Microsoft.WindowsFeedbackHub",
        "Microsoft.WindowsMaps", "Microsoft.WindowsSoundRecorder", "Microsoft.Xbox.TCUI",
        "Microsoft.XboxApp", "Microsoft.XboxGameOverlay", "Microsoft.XboxGamingOverlay",
        "Microsoft.XboxIdentityProvider", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.YourPhone",
        "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.WindowsFeedback",
        "Windows.ContactSupport", "PandoraMedia", "AdobeSystemIncorporated.AdobePhotoshop",
        "Duolingo", "Microsoft.BingNews", "Microsoft.Office.Sway", "Microsoft.Advertising.Xaml",
        "Microsoft.NET.Native.Framework.1.*", "Microsoft.Services.Store.Engagement",
        "ActiproSoftware", "EclipseManager", "king.com.*"
    )
}
