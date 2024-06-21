# Array of service names to be stopped and disabled

function Get-NonNeededservices {
    return @(
        "WpcMonSvc", "SharedRealitySvc", "Fax", "autotimesvc", "wisvc", "SDRSVC",
        "MixedRealityOpenXRSvc", "WalletService", "SmsRouter", "SharedAccess", "MapsBroker",
		"PhoneSvc","ScDeviceEnum", "TabletInputService", "icssvc", "edgeupdatem", "edgeupdate",
		"MicrosoftEdgeElevationService", "RetailDemo", "MessagingService", "PimIndexMaintenanceSvc",
		"OneSyncSvc", "UnistoreSvc", "DiagTrack", "dmwappushservice", "diagsvc", "WerSvc", 
		"wercplsupport", "diagnosticshub.standardcollector.service", "SCardSvr", "SEMgrSvc"
    )
}
