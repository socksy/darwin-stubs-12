{
  description = "A flake for building yawsso";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        tbdOnlyFramework = name:
          { private ? true }:
          pkgs.stdenv.mkDerivation {
            name = "apple-framework-${name}";
            dontUnpack = true;
            installPhase = ''
              mkdir -p $out/Library/Frameworks/
              cp -r ${self}/stubs/12.1/System/Library/${
                pkgs.lib.optionalString private "Private"
              }Frameworks/${name}.framework \
                $out/Library/Frameworks

              cd $out/Library/Frameworks/${name}.framework

              versions=(./Versions/*)
              if [ "''${#versions[@]}" != 1 ]; then
                echo "Unable to determine current version of framework ${name}"
                exit 1
              fi
              current=$(basename ''${versions[0]})

              chmod u+w -R .
              ln -s "$current" Versions/Current
              ln -s Versions/Current/* .
            '';
          };
      in rec {

        packages = { } // pkgs.lib.genAttrs [
          "AAAFoundation"
          "AAAFoundationSwift"
          "AACCore"
          "ACDEClient"
          "AFKUser"
          "AGXCompilerCore"
          "AGXGPURawCounter"
          "AMPDesktopUI"
          "AMPDevices"
          "AMPLibrary"
          "AMPSharing"
          "ANECompiler"
          "ANEServices"
          "AOSAccounts"
          "AOSAccountsLite"
          "AOSKit"
          "AOSUI"
          "AOSUILite"
          "APFS"
          "APTransport"
          "ASEProcessing"
          "ASOctaneSupport"
          "AVConference"
          "AVFCapture"
          "AVFCore"
          "AVFoundationCF"
          "AVKitCore"
          "AVKitMacHelper"
          "AXAssetLoader"
          "AXCoreUtilities"
          "AXHearingCoreSupport"
          "AXHearingSupport"
          "AXMediaUtilities"
          "AXRuntime"
          "AccessibilityBundles"
          "AccessibilityPerformance"
          "AccessibilityPlatformTranslation"
          "AccessibilitySharedSupport"
          "AccessibilitySharedUISupport"
          "AccessibilitySupport"
          "AccessoryNowPlaying"
          "AccountPolicy"
          "AccountsDaemon"
          "AccountsUI"
          "AcousticMaterials"
          "ActionKit"
          "ActionKitUI"
          "AdCore"
          "AdID"
          "AdPlatforms"
          "AdPlatformsCommon"
          "AdPlatformsInternal"
          "AddressBookAutocomplete"
          "AddressBookCore"
          "Admin"
          "AggregateDictionary"
          "AggregateDictionaryHistory"
          "AirPlayReceiver"
          "AirPlayReceiverKit"
          "AirPlaySender"
          "AirPlaySupport"
          "AirPlaySync"
          "AlgosScoreFramework"
          "AmbientDisplay"
          "AnnotationKit"
          "AppAttestInternal"
          "AppContainer"
          "AppPredictionFoundation"
          "AppSSO"
          "AppSSOCore"
          "AppSSOKerberos"
          "AppSSOUI"
          "AppSandbox"
          "AppServerSupport"
          "AppState"
          "AppStoreComponents"
          "AppStoreDaemon"
          "AppStoreFoundation"
          "AppStoreKit"
          "AppStoreKitInternal"
          "AppStoreUI"
          "AppSupport"
          "AppSupportUI"
          "Apple80211"
          "AppleAccount"
          "AppleAppSupport"
          "AppleCVA"
          "AppleConvergedFirmwareUpdater"
          "AppleDepth"
          "AppleDisplayTCONControl"
          "AppleFSCompression"
          "AppleFirmwareUpdate"
          "AppleGVA"
          "AppleGVACore"
          "AppleHIDTransportSupport"
          "AppleIDAuthSupport"
          "AppleIDSSOAuthentication"
          "AppleISPEmulator"
          "AppleJPEG"
          "AppleLDAP"
          "AppleLOM"
          "AppleMediaServices"
          "AppleMediaServicesUI"
          "AppleMediaServicesUIDynamic"
          "AppleMobileFileIntegrity"
          "AppleNVMe"
          "AppleNeuralEngine"
          "ApplePDPHelper"
          "ApplePushService"
          "AppleSRP"
          "AppleSauce"
          "AppleScript"
          "AppleServiceToolkit"
          "AppleShareClientCore"
          "AppleSystemInfo"
          "AppleVA"
          "AppleVPA"
          "AskPermission"
          "AssertionServices"
          "AssetCacheServices"
          "AssetCacheServicesExtensions"
          "AssetViewer"
          "AssistantServices"
          "AssistiveControlSupport"
          "AttributeGraph"
          "AudioAnalytics"
          "AudioDSPManager"
          "AudioHistory"
          "AudioPasscode"
          "AudioResourceArbitration"
          "AudioServerApplication"
          "AudioServerDriver"
          "AudioSession"
          "AudioToolboxCore"
          "AudioTransportCommon"
          "AuthKit"
          "AuthKitUI"
          "AuthenticationServicesCore"
          "AutoBugCaptureCore"
          "AutoLoop"
          "AutomationMode"
          "AvailabilityKit"
          "AvatarKit"
          "AvatarKitContent"
          "AvatarPersistence"
          "BackBoardServices"
          "BackgroundTaskManagement"
          "Backup"
          "BagKit"
          "BaseBoard"
          "BatteryUIKit"
          "BehaviorMiner"
          "BezelServices"
          "BioKitAggD"
          "BiomeDSL"
          "BiomeFlexibleStorage"
          "BiomeFoundation"
          "BiomePubSub"
          "BiomeStorage"
          "BiomeStreams"
          "BiomeSync"
          "BiometricKit"
          "BiometricKitUI"
          "BiometricSupport"
          "BlastDoor"
          "BluetoothAudio"
          "BluetoothManager"
          "BluetoothServices"
          "BluetoothServicesUI"
          "BoardServices"
          "Bom"
          "BookCoverUtility"
          "BookDataStore"
          "BookKit"
          "BookKitFoundation"
          "BookLibraryCore"
          "BookUtility"
          "Bootability"
          "BridgeOSInstall"
          "BridgeOSInstallReporting"
          "BridgeOSObliteration"
          "BridgeOSSoftwareUpdate"
          "BridgeXPC"
          "BrightnessControl"
          "BulkSymbolication"
          "ByteRangeLocking"
          "C2"
          "CARPFoundation"
          "CBORLibrary"
          "CDDataAccess"
          "CDDataAccessExpress"
          "CHIPPlugin"
          "CMCapture"
          "CMCaptureCore"
          "CMImaging"
          "CMPhoto"
          "CPAnalytics"
          "CPMLBestShim"
          "CPMS"
          "CSCSupport"
          "CVNLP"
          "CacheDelete"
          "CalDAV"
          "Calculate"
          "CalendarAgent"
          "CalendarAgentLink"
          "CalendarDraw"
          "CalendarFoundation"
          "CalendarNotification"
          "CalendarPersistence"
          "CalendarUI"
          "CalendarUIKit"
          "CalendarWeatherKit"
          "CalendarWidget"
          "CallHistory"
          "CameraImagingFramework"
          "CaptiveNetwork"
          "CardKit"
          "CardServices"
          "Cards"
          "Catalyst"
          "Categories"
          "CharacterPicker"
          "ChronoKit"
          "ChronoServices"
          "ChunkingLibrary"
          "ClassKitUI"
          "ClassroomKit"
          "ClockMenuExtraPreferences"
          "CloudDocs"
          "CloudDocsDaemon"
          "CloudFamilyRestrictions"
          "CloudFamilyRestrictionsDaemon"
          "CloudKitCode"
          "CloudKitCodeProtobuf"
          "CloudKitDaemon"
          "CloudKitDistributedSync"
          "CloudPhotoLibrary"
          "CloudPhotoServices"
          "CloudPhotoServicesConfiguration"
          "CloudServices"
          "CloudSubscriptionFeatures"
          "Coherence"
          "CombineCocoa"
          "CommerceKit"
          "CommonAuth"
          "CommonUtilities"
          "CommunicationsFilter"
          "ConditionInducer"
          "ConfigProfileHelper"
          "ConfigurationEngineModel"
          "ConfigurationProfiles"
          "ConfigurationProfilesUI"
          "ConsoleKit"
          "ConstantClasses"
          "ContactsAssistantServices"
          "ContactsAutocomplete"
          "ContactsAutocompleteUI"
          "ContactsDonation"
          "ContactsDonationFeedback"
          "ContactsFoundation"
          "ContactsMetrics"
          "ContactsPersistence"
          "ContactsUICore"
          "ContactsUIMacHelper"
          "ContentKit"
          "ContextKit"
          "ContextKitCore"
          "ContextKitExtraction"
          "ContextualActionsClient"
          "ControlCenter"
          "ConversationKit"
          "CopresenceCore"
          "CoreADI"
          "CoreAUC"
          "CoreAVCHD"
          "CoreAccessories"
          "CoreAnalytics"
          "CoreAppleCVA"
          "CoreAutoLayout"
          "CoreBluetoothUI"
          "CoreBrightness"
          "CoreCDP"
          "CoreCDPInternal"
          "CoreCDPUI"
          "CoreCapture"
          "CoreCaptureControl"
          "CoreCaptureDaemon"
          "CoreChart"
          "CoreChartSwift"
          "CoreChineseEngine"
          "CoreDAV"
          "CoreDaemon"
          "CoreDuet"
          "CoreDuetContext"
          "CoreDuetDaemonProtocol"
          "CoreDuetDataModel"
          "CoreDuetDebugLogging"
          "CoreDuetStatistics"
          "CoreDuetSync"
          "CoreEmbeddedSpeechRecognition"
          "CoreEmoji"
          "CoreFP"
          "CoreFollowUp"
          "CoreFollowUpUI"
          "CoreGlyphs"
          "CoreHAP"
          "CoreHandwriting"
          "CoreHapticsTools"
          "CoreJapaneseEngine"
          "CoreKDL"
          "CoreKE"
          "CoreKnowledge"
          "CoreLSKD"
          "CoreLocationProtobuf"
          "CoreLocationReplay"
          "CoreMLTestFramework"
          "CoreMaterial"
          "CoreMediaStream"
          "CoreMotionAlgorithms"
          "CoreNLP"
          "CoreNameParser"
          "CoreNavigation"
          "CoreOptimization"
          "CorePDF"
          "CoreParsec"
          "CorePhoneNumbers"
          "CorePhotogrammetry"
          "CorePommes"
          "CorePrediction"
          "CoreRC"
          "CoreRE"
          "CoreRealityIO"
          "CoreRecents"
          "CoreRecognition"
          "CoreRoutine"
          "CoreSDB"
          "CoreSVG"
          "CoreServicesInternal"
          "CoreServicesStore"
          "CoreSpeech"
          "CoreSpeechFoundation"
          "CoreSpotlightImportDaemon"
          "CoreSuggestions"
          "CoreSuggestionsInternals"
          "CoreSuggestionsML"
          "CoreSuggestionsUI"
          "CoreSymbolication"
          "CoreThemeDefinition"
          "CoreTime"
          "CoreUARP"
          "CoreUI"
          "CoreUtils"
          "CoreUtilsExtras"
          "CoreUtilsSwift"
          "CoreUtilsUI"
          "CoreWLANKit"
          "CoreWiFi"
          "CrashReporterSupport"
          "CryptoKitCBridging"
          "CryptoKitPrivate"
          "DAAPKit"
          "DASDaemon"
          "DCERPC"
          "DFRBrightness"
          "DFRDisplay"
          "DFRFoundation"
          "DMCEnrollmentLibrary"
          "DMCUtilities"
          "DRMFoundation"
          "DSExternalDisplay"
          "DTXConnectionServices"
          "DVD"
          "Darwinup"
          "DataDeliveryServices"
          "DataDetectors"
          "DataDetectorsCore"
          "DataDetectorsNaturalLanguage"
          "DeauthorizationKit"
          "DebugSymbols"
          "DesktopServicesPriv"
          "DeviceCheckInternal"
          "DeviceIdentity"
          "DeviceManagement"
          "DeviceManagementTools"
          "DeviceToDeviceManager"
          "DiagnosticExtensions"
          "DiagnosticExtensionsDaemon"
          "DiagnosticLogCollection"
          "DiagnosticRequest"
          "DiagnosticRequestService"
          "DiagnosticsKit"
          "DialogEngine"
          "DifferentialPrivacy"
          "DigitalTouchShared"
          "DirectoryEditor"
          "DirectoryServer"
          "DiskImages"
          "DiskImages2"
          "DiskManagement"
          "DiskSpaceDiagnostics"
          "DisplayServices"
          "DisplayTransportServices"
          "DistributedEvaluation"
          "DistributedSensing"
          "DoNotDisturb"
          "DoNotDisturbKit"
          "DoNotDisturbServer"
          "DocumentCamera"
          "DrawingKit"
          "DuetActivityScheduler"
          "DuetRecommendation"
          "DynamicDesktop"
          "EAFirmwareUpdater"
          "EAP8021X"
          "EFILogin"
          "EasyConfig"
          "Email"
          "EmailAddressing"
          "EmailCore"
          "EmailDaemon"
          "EmailFoundation"
          "EmbeddedAcousticRecognition"
          "EmbeddedOSInstall"
          "EmbeddedOSSupportHost"
          "EmojiFoundation"
          "Engram"
          "Espresso"
          "ExchangeSync"
          "ExchangeWebServices"
          "ExpansionSlotSupport"
          "ExposureNotificationDaemon"
          "ExtensionFoundation"
          "ExtensionKit"
          "FMCore"
          "FMCoreLite"
          "FMCoreUI"
          "FMF"
          "FMFCore"
          "FMFUI"
          "FMIPCore"
          "FMNetworking"
          "FRC"
          "FTAWD"
          "FTClientServices"
          "FTServices"
          "FWAVC"
          "FaceCore"
          "FamilyCircle"
          "FamilyCircleUI"
          "FamilyControls"
          "FamilyControlsObjC"
          "FamilyNotification"
          "FeatureFlags"
          "FeatureFlagsSupport"
          "Feedback"
          "FeedbackCore"
          "FeedbackLogger"
          "FileProviderDaemon"
          "FilesActionsUI"
          "FindMyDevice"
          "FindMyDeviceUI"
          "FindMyMac"
          "FinderKit"
          "FinderSyncPriv"
          "FlightUtilities"
          "FlightUtilitiesCore"
          "FlowFrameKit"
          "Focus"
          "FocusSettingsUI"
          "FolderActionsKit"
          "FontServices"
          "FoundInAppsPlugins"
          "FoundationODR"
          "FrontBoardServices"
          "FuseBoardServices"
          "FusionPluginKit"
          "FusionPluginServices"
          "FusionTracker"
          "Futhark"
          "GPUCompiler"
          "GPUInfo"
          "GPURawCounter"
          "GPUWrangler"
          "GameCenterFoundation"
          "GameCenterUI"
          "GameCenterUICore"
          "GameKitServices"
          "GenerationalStorage"
          "GeoKit"
          "GeoServices"
          "GeoServicesCore"
          "Geode"
          "Geometry"
          "GraphKit"
          "GraphVisualizer"
          "GraphicsServices"
          "H10ISPServices"
          "H13ISPServices"
          "HDAInterface"
          "HDRProcessing"
          "HID"
          "HIDAnalytics"
          "HIDDisplay"
          "HIDPreferences"
          "HMFoundation"
          "HTTPServer"
          "HealthDomainsTools"
          "HearingCore"
          "HearingUtilities"
          "HeimODAdmin"
          "Heimdal"
          "Helium"
          "HelloWorldMacHelper"
          "HelpData"
          "HomeAI"
          "HomeAutomationInternal"
          "HomeKit"
          "HomeKitBackingStore"
          "HomeKitCore"
          "HomeKitDaemon"
          "HomeKitDaemonLegacy"
          "HomeKitEventRouter"
          "HomeKitMetrics"
          "Hydra"
          "IAP"
          "IASUtilities"
          "IDS"
          "IDSBlastDoorSupport"
          "IDSFoundation"
          "IDSHashPersistence"
          "IDSKVStore"
          "IDSSystemPreferencesSignIn"
          "IMAP"
          "IMAPBehavior"
          "IMAPCHelpers"
          "IMAPConnection"
          "IMAPConnectionControl"
          "IMAPHelpers"
          "IMAPPersistence"
          "IMAPProtocol"
          "IMAPTracing"
          "IMAVCore"
          "IMAssistantCore"
          "IMCore"
          "IMCorePipeline"
          "IMDMessageServices"
          "IMDPersistence"
          "IMDaemonCore"
          "IMFoundation"
          "IMSharedUI"
          "IMSharedUtilities"
          "IMTranscoderAgent"
          "IMTranscoding"
          "IMTransferAgent"
          "IMTransferServices"
          "IOAccelMemoryInfo"
          "IOAccelerator"
          "IOCEC"
          "IOGPU"
          "IOImageLoader"
          "IOKitten"
          "IOMobileFramebuffer"
          "IOPlatformPluginFamily"
          "IOPresentment"
          "IOSurfaceAccelerator"
          "ISSupport"
          "IconFoundation"
          "IconServices"
          "IdleTimerServices"
          "InAppMessages"
          "InAppMessagesCore"
          "IncomingCallFilter"
          "InertiaCam"
          "InputContext"
          "InputTranscoder"
          "Install"
          "InstallCoordination"
          "InstallerDiagnostics"
          "IntelligenceEngine"
          "IntentsCore"
          "IntentsFoundation"
          "IntentsServices"
          "IntentsUICardKitProviderSupport"
          "InternalSwiftProtobuf"
          "InternationalSupport"
          "InternationalTextSearch"
          "InternetAccounts"
          "IntlPreferences"
          "JavaLaunching"
          "JavaScriptAppleEvents"
          "JavaScriptOSA"
          "Jet"
          "JetEngine"
          "JetPack"
          "JetUI"
          "KRExperiments"
          "KerberosHelper"
          "KeyboardServices"
          "KeychainCircle"
          "KnowledgeGraphKit"
          "KnowledgeMonitor"
          "LanguageModeling"
          "Lexicon"
          "LibraryRepair"
          "LimitAdTracking"
          "LinguisticData"
          "LiveFS"
          "LiveTranscription"
          "LocalAuthenticationRecoveryUI"
          "LocalAuthenticationUI"
          "LocationSupport"
          "LockoutUI"
          "LoggingSupport"
          "LoginUIKit"
          "Lookup"
          "LowPowerMode"
          "MDMClientLibrary"
          "MDSChannel"
          "MFAAuthentication"
          "MFiAuthentication"
          "MIL"
          "MLAssetIO"
          "MLRuntime"
          "MMCS"
          "MMCSServices"
          "MSUDataAccessor"
          "MTLCompiler"
          "MTLSimImplementation"
          "MachineSettings"
          "Mail"
          "MailCore"
          "MailService"
          "MailSupport"
          "MailUI"
          "MailWebProcessSupport"
          "MallocStackLogging"
          "ManagedClient"
          "ManagedSettingsObjC"
          "ManagedSettingsSupport"
          "Mangrove"
          "MapsSuggestions"
          "MapsSupport"
          "MapsSync"
          "MapsUI"
          "Marco"
          "MarkupUI"
          "Marrs"
          "MaterialKit"
          "MediaAnalysis"
          "MediaAnalysisServices"
          "MediaControlSender"
          "MediaConversionService"
          "MediaExperience"
          "MediaFoundation"
          "MediaKit"
          "MediaMiningKit"
          "MediaRemote"
          "MediaServices"
          "MediaStream"
          "Memories"
          "MemoryDiagnostics"
          "Mercury"
          "MessageProtection"
          "MessageSecurity"
          "MessageUIMacHelper"
          "MessagesBlastDoorSupport"
          "MessagesHelperKit"
          "MessagesKit"
          "MetadataUtilities"
          "MetalSerializer"
          "MetalTools"
          "MetricKitCore"
          "MetricKitServices"
          "MetricKitSource"
          "MetricMeasurement"
          "MetricsKit"
          "MiniSoftwareUpdate"
          "MobileAccessoryUpdater"
          "MobileActivationMacOS"
          "MobileAsset"
          "MobileAssetUpdater"
          "MobileBluetooth"
          "MobileContainerManager"
          "MobileIcons"
          "MobileInstallation"
          "MobileKeyBag"
          "MobileObliteration"
          "MobileSoftwareUpdate"
          "MobileStorage"
          "MobileStoreDemoCore"
          "MobileSystemServices"
          "Mondrian"
          "MonitorPanel"
          "Montreal"
          "MorphunAssets"
          "MorphunSwift"
          "MultitouchSupport"
          "MultiverseSupport"
          "MusicLibrary"
          "MusicUI"
          "NIOIMAPCore"
          "NLP"
          "NPTKit"
          "Navigation"
          "NearField"
          "NetAppsUtilities"
          "NetAuth"
          "NetFSServer"
          "Netrb"
          "NetworkMenusCommon"
          "NetworkServiceProxy"
          "NetworkStatistics"
          "NeutrinoCore"
          "NeutrinoKit"
          "NewDeviceOutreach"
          "NewDeviceOutreachMacUI"
          "NewsAnalyticsUpload"
          "NewsCore"
          "NewsDaemon"
          "NewsFoundation"
          "NewsToday"
          "NewsTransport"
          "NewsURLBucket"
          "NewsURLResolution"
          "NotesHTML"
          "NotesPreviewKit"
          "NotesShared"
          "NotesSupport"
          "NotesUI"
          "Noticeboard"
          "NotificationCenterUI"
          "OAHSoftwareUpdate"
          "OAuth"
          "OSAServicesClient"
          "OSASubmissionClient"
          "OSASyncProxyClient"
          "OSAnalytics"
          "OSAnalyticsPrivate"
          "OSD"
          "OSInstaller"
          "OSIntelligence"
          "OSPersonalization"
          "OSUpdate"
          "OTSVG"
          "OctagonTrust"
          "OfficeImport"
          "OnBoardingKit"
          "OpenDirectoryConfig"
          "OpenDirectoryConfigUI"
          "OpticalFlowFramework"
          "Osprey"
          "PAImaging"
          "PAImagingCore"
          "PDS"
          "PDSAgent"
          "PIP"
          "PSNormalizer"
          "PackageKit"
          "PacketFilter"
          "PaperKit"
          "ParsecModel"
          "ParsecSubscriptionServiceSupport"
          "ParsecUI"
          "PassKitCore"
          "PassKitMacHelper"
          "PassKitServices"
          "PassKitUI"
          "PassKitUIFoundation"
          "PasswordServer"
          "PegasusAPI"
          "PegasusConfiguration"
          "PegasusKit"
          "PeopleSuggester"
          "PerfPowerTelemetryMetadata"
          "PerfPowerTelemetryReader"
          "PerformanceAnalysis"
          "PerformanceTrace"
          "PersistentConnection"
          "PersonaKit"
          "PersonaUI"
          "PersonalIntelligenceCore"
          "PersonalizationPortrait"
          "PersonalizationPortraitInternals"
          "PhoneNumberResolver"
          "PhoneNumbers"
          "PhotoAnalysis"
          "PhotoFoundation"
          "PhotoImaging"
          "PhotoLibraryServices"
          "PhotoLibraryServicesCore"
          "PhotoPrintProduct"
          "PhotoVision"
          "PhotosFormats"
          "PhotosGraph"
          "PhotosImagingFoundation"
          "PhotosPlayer"
          "PhotosUIApps"
          "PhotosUICore"
          "PhysicsKit"
          "PlacesKit"
          "PlugInKit"
          "PodcastServices"
          "PodcastsFoundation"
          "PodcastsKit"
          "Portrait"
          "PortraitCore"
          "PostSiriEngagement"
          "PowerLog"
          "PowerUI"
          "PowerlogControl"
          "PowerlogCore"
          "PowerlogDatabaseReader"
          "PowerlogFullOperators"
          "PowerlogHelperdOperators"
          "PowerlogLiteOperators"
          "PreferencePanesSupport"
          "PreviewsFoundation"
          "PreviewsInjection"
          "PreviewsMessaging"
          "PreviewsOSSupport"
          "PreviewsServices"
          "PreviewsServicesUI"
          "PrintKit"
          "PrintingPrivate"
          "PrivateFederatedLearning"
          "ProVideo"
          "ProactiveBlendingLayer_macOS"
          "ProactiveEventTracker"
          "ProactiveExperiments"
          "ProactiveExperimentsInternals"
          "ProactiveHarvesting"
          "ProactiveInputPredictions"
          "ProactiveInputPredictionsInternals"
          "ProactiveInsights"
          "ProactiveML"
          "ProactiveSuggestionClientModel"
          "ProactiveSupport"
          "ProactiveSupportStubs"
          "PromotedContentPrediction"
          "PromotedContentSupport"
          "ProofReader"
          "ProtectedCloudStorage"
          "ProtocolBuffer"
          "PrototypeTools"
          "QLCharts"
          "Quagga"
          "QueryParser"
          "QuickLookGeneration"
          "QuickLookIosmac"
          "QuickLookNonBaseSystem"
          "QuickLookSupport"
          "QuickLookThumbnailGeneration"
          "QuickLookThumbnailingDaemon"
          "QuickLookUIIosmac"
          "RESync"
          "RTBuddyCrashlogDecoder"
          "RTCReporting"
          "RTTUI"
          "RTTUtilities"
          "Rapport"
          "RapportUI"
          "RealityFusion"
          "RealityIO"
          "Recap"
          "RecapPerformanceTesting"
          "RecoveryOS"
          "RelativeMotion"
          "ReminderKit"
          "ReminderKitInternal"
          "ReminderKitUI"
          "ReminderMigration"
          "RemindersUICore"
          "RemoteConfiguration"
          "RemoteCoreML"
          "RemoteHID"
          "RemoteManagement"
          "RemoteServiceDiscovery"
          "RemoteTextInput"
          "RemoteViewServices"
          "RemoteXPC"
          "RenderBox"
          "ReplayKitMacHelper"
          "RequestDispatcherBridges"
          "ResponseKit"
          "Restore"
          "Reveal"
          "RevealCore"
          "RunningBoard"
          "RunningBoardServices"
          "SAObjects"
          "SCEP"
          "SDAPI"
          "SMBClient"
          "SMBClientEngine"
          "SPFinder"
          "SPOwner"
          "SPShared"
          "SPSupport"
          "STSXPCHelperClient"
          "Safari"
          "SafariCore"
          "SafariFoundation"
          "SafariPlatformSupport"
          "SafariSafeBrowsing"
          "SafariShared"
          "SafariSharedUI"
          "SafeEjectGPU"
          "SampleAnalysis"
          "ScoreBoard"
          "ScreenReader"
          "ScreenReaderCore"
          "ScreenSharing"
          "ScreenTimeCore"
          "ScreenTimeFoundation"
          "ScreenTimeServiceUI"
          "ScreenTimeSettingsUI"
          "ScreenTimeUI"
          "ScreenTimeUICore"
          "SearchAds"
          "SearchFoundation"
          "SearchSuggestions"
          "SearchUI"
          "SearchUICardKitProviderSupport"
          "SecCodeWrapper"
          "SecureChannel"
          "SecureTransactionService"
          "SecurityTokend"
          "Seeding"
          "SemanticDocumentManagement"
          "Sentry"
          "ServerCompatibility"
          "ServerInformation"
          "SetupAssistantFramework"
          "SetupAssistantSupport"
          "SetupKit"
          "ShareKit"
          "SharePointManagement"
          "ShareServicesCore"
          "SharedWebCredentials"
          "Sharing"
          "SharingXPCServices"
          "ShazamInsights"
          "ShazamKitUI"
          "Shortcut"
          "ShortcutDropletServices"
          "ShoveService"
          "SidecarCore"
          "SidecarUI"
          "SignpostCollection"
          "SignpostMetrics"
          "SignpostNotification"
          "SignpostSupport"
          "SiriAnalytics"
          "SiriAppLaunchIntents"
          "SiriAppResolution"
          "SiriAudioInternal"
          "SiriAudioSupport"
          "SiriCam"
          "SiriCannedDialogIntents"
          "SiriContactsIntents"
          "SiriCore"
          "SiriDailyBriefingInternal"
          "SiriDialogEngine"
          "SiriExperiments"
          "SiriFindMy"
          "SiriFoundation"
          "SiriGeo"
          "SiriGlobalReranker"
          "SiriInference"
          "SiriInferenceFlow"
          "SiriInstrumentation"
          "SiriIntentEvents"
          "SiriKitFlow"
          "SiriKitInvocation"
          "SiriKitRuntime"
          "SiriMessageBus"
          "SiriNLUTypes"
          "SiriNaturalLanguageParsing"
          "SiriObservation"
          "SiriOntology"
          "SiriOntologyProtobuf"
          "SiriPlaybackControlIntents"
          "SiriPlaybackControlSupport"
          "SiriPrivateLearningAnalytics"
          "SiriPrivateLearningInference"
          "SiriPrivateLearningLogging"
          "SiriReferenceResolution"
          "SiriRequestDispatcher"
          "SiriSessionStore"
          "SiriSessionStoreClient"
          "SiriSettingsIntents"
          "SiriSignals"
          "SiriSpeechSynthesis"
          "SiriTTS"
          "SiriTasks"
          "SiriUI"
          "SiriUIFoundation"
          "SiriUtilities"
          "SiriVOX"
          "SiriVideoIntents"
          "SiriVirtualDeviceResolution"
          "SkyLight"
          "SleepHealthUI"
          "Slideshows"
          "SnippetKit"
          "SnippetUI"
          "SocialAppsCore"
          "SocialLayer"
          "SocialServices"
          "SocialUI"
          "SoftLinking"
          "SoftwareUpdate"
          "SoftwareUpdateCore"
          "SoftwareUpdateCoreConnect"
          "SoftwareUpdateCoreSupport"
          "SoftwareUpdateMacController"
          "SpanMatcher"
          "SpeakerRecognition"
          "SpeechDetector"
          "SpeechDictionary"
          "SpeechObjects"
          "SpeechRecognitionCommandServices"
          "SpeechRecognitionCore"
          "Spotlight"
          "SpotlightDaemon"
          "SpotlightIndex"
          "SpotlightIndexUtilities"
          "SpotlightLinguistics"
          "SpotlightReceiver"
          "SpotlightServerKit"
          "SpotlightServices"
          "StatusKit"
          "StatusKitAgentCore"
          "StorageKit"
          "StorageManagement"
          "StoreFoundation"
          "StoreJavaScript"
          "StoreKitMacHelper"
          "StoreKitUIMac"
          "StoreServices"
          "StoreUI"
          "StreamingZip"
          "Suggestions"
          "SuggestionsSpotlightMetrics"
          "Symbolication"
          "SymptomDiagnosticReporter"
          "SymptomReporter"
          "Symptoms"
          "Synapse"
          "SyncServicesUI"
          "SyncedDefaults"
          "SystemAdministration"
          "SystemAdministrationInterface"
          "SystemDesktopAppearance"
          "SystemMigration"
          "SystemMigrationNetworking"
          "SystemMigrationUtils"
          "SystemPolicy"
          "SystemStatus"
          "SystemStatusServer"
          "SystemUIPlugin"
          "SystemWake"
          "TCC"
          "TTSAsset"
          "TTYUtilities"
          "TVLibrary"
          "TVPlayback"
          "TVRemoteCore"
          "TeaDB"
          "TeaFoundation"
          "TeaSettings"
          "TelephonyUtilities"
          "TemplateKit"
          "TestFlightCore"
          "TextInput"
          "TextInputChinese"
          "TextInputCore"
          "TextInputMenuUI"
          "TextRecognition"
          "TextToSpeech"
          "TextureIO"
          "TimeMachine"
          "TimeSync"
          "Timeline"
          "TipsCore"
          "TipsDaemon"
          "TipsUI"
          "ToneKit"
          "ToneLibrary"
          "Translation"
          "TranslationUI"
          "TranslationUIServices"
          "Transparency"
          "TransparencyDetailsViewMac"
          "Trial"
          "TrialProto"
          "TrialServer"
          "TrustEvaluationAgent"
          "TrustedAccessory"
          "TrustedPeers"
          "TuriCore"
          "UARPUpdaterService"
          "UARPiCloud"
          "UAUPlugin"
          "UIFoundation"
          "UIKitMacHelper"
          "UIKitServices"
          "UIKitSystemAppServices"
          "UIRecording"
          "URLFormatting"
          "USDKit"
          "USTBridgeConnection"
          "UVCExtension"
          "UVCFamily"
          "UVCFrameProcessor"
          "UVFSXPCService"
          "UXKit"
          "Uninstall"
          "UniversalAccess"
          "UniversalControl"
          "UsageTracking"
          "UserActivity"
          "UserFS"
          "UserManagement"
          "UserNotificationsKit"
          "VFX"
          "VectorKit"
          "VideoProcessing"
          "VideoSubscriberAccountUI"
          "VideosUI"
          "VideosUICore"
          "ViewBridge"
          "VirtualGarage"
          "VisionKit"
          "VisionKitCore"
          "VisualIntelligence"
          "VisualPairing"
          "VisualTestKit"
          "VoiceShortcutClient"
          "VoiceShortcuts"
          "VoiceTrigger"
          "WPDaemon"
          "WatchListKit"
          "WatchdogClient"
          "WeatherDaemon"
          "WeatherFoundation"
          "WeatherKit"
          "WebBookmarks"
          "WebContentAnalysis"
          "WebDriver"
          "WebFilterDNS"
          "WebInspector"
          "WebInspectorUI"
          "WiFiAnalytics"
          "WiFiCloudSyncEngine"
          "WiFiPeerToPeer"
          "WiFiPolicy"
          "WiFiVelocity"
          "WildDevices"
          "WirelessCoexManager"
          "WirelessDiagnostics"
          "WirelessProximity"
          "WorkflowEditor"
          "WorkflowKit"
          "WorkflowUI"
          "WorkflowUICore"
          "WorkflowUIServices"
          "XARTRecovery"
          "XCTAutomationSupport"
          "XCTTargetBootstrap"
          "XGBoostFramework"
          "XQuery"
          "XprotectFramework"
          "ZhuGeSupport"
          "acfs"
          "acfsSupport"
          "apfs_boot_mount"
          "caulk"
          "iCalendar"
          "iCloudNotification"
          "iCloudQuota"
          "iCloudQuotaUI"
          "iLifeMediaBrowser"
          "iPod"
          "iPodSync"
          "iPodUpdater"
          "iPodVoiceOver"
          "iTunesCloud"
          "iWorkXPC"
          "kperf"
          "kperfdata"
          "ktrace"
          "login"
          "nt"
          "oncrpc"
          "perfdata"
          "vCard"
          "yara"
        ] (x: tbdOnlyFramework x { })

          //

          pkgs.lib.genAttrs [
            "AGL"
            "AVFAudio"
            "AVFoundation"
            "AVKit"
            "Accelerate"
            "Accessibility"
            "Accounts"
            "AdServices"
            "AdSupport"
            "AddressBook"
            "AppKit"
            "AppTrackingTransparency"
            "AppleScriptKit"
            "AppleScriptObjC"
            "ApplicationServices"
            "AudioToolbox"
            "AudioUnit"
            "AudioVideoBridging"
            "AuthenticationServices"
            "AutomaticAssessmentConfiguration"
            "Automator"
            "BackgroundTasks"
            "BusinessChat"
            "CFNetwork"
            "CHIP"
            "CalendarStore"
            "CallKit"
            "Carbon"
            "ClassKit"
            "CloudKit"
            "Cocoa"
            "Collaboration"
            "ColorSync"
            "Combine"
            "Contacts"
            "ContactsUI"
            "CoreAudio"
            "CoreAudioKit"
            "CoreBluetooth"
            "CoreData"
            "CoreDisplay"
            "CoreFoundation"
            "CoreGraphics"
            "CoreHaptics"
            "CoreImage"
            "CoreLocation"
            "CoreMIDI"
            "CoreMIDIServer"
            "CoreML"
            "CoreMedia"
            "CoreMediaIO"
            "CoreMotion"
            "CoreServices"
            "CoreSpotlight"
            "CoreTelephony"
            "CoreText"
            "CoreVideo"
            "CoreWLAN"
            "CreateML"
            "CryptoKit"
            "CryptoTokenKit"
            "DVDPlayback"
            "DataDetection"
            "DeveloperToolsSupport"
            "DeviceActivity"
            "DeviceCheck"
            "DirectoryService"
            "DiscRecording"
            "DiscRecordingUI"
            "DiskArbitration"
            "DriverKit"
            "EventKit"
            "ExceptionHandling"
            "ExecutionPolicy"
            "ExposureNotification"
            "ExternalAccessory"
            "FWAUserLib"
            "FileProvider"
            "FileProviderUI"
            "FinderSync"
            "ForceFeedback"
            "Foundation"
            "GLKit"
            "GLUT"
            "GSS"
            "GameController"
            "GameKit"
            "GameplayKit"
            "GroupActivities"
            "Hypervisor"
            "ICADevices"
            "IMServicePlugIn"
            "IOBluetooth"
            "IOBluetoothUI"
            "IOKit"
            "IOSurface"
            "IOUSBHost"
            "IdentityLookup"
            "ImageCaptureCore"
            "ImageIO"
            "InputMethodKit"
            "InstallerPlugins"
            "InstantMessage"
            "Intents"
            "IntentsUI"
            "JavaNativeFoundation"
            "JavaRuntimeSupport"
            "JavaScriptCore"
            "Kerberos"
            "KernelManagement"
            "LDAP"
            "LatentSemanticMapping"
            "LinkPresentation"
            "LocalAuthentication"
            "LocalAuthenticationEmbeddedUI"
            "MLCompute"
            "MailKit"
            "ManagedSettings"
            "MapKit"
            "MediaAccessibility"
            "MediaLibrary"
            "MediaPlayer"
            "MediaToolbox"
            "Metal"
            "MetalKit"
            "MetalPerformanceShaders"
            "MetalPerformanceShadersGraph"
            "MetricKit"
            "ModelIO"
            "MultipeerConnectivity"
            "MusicKit"
            "NaturalLanguage"
            "NearbyInteraction"
            "NetFS"
            "Network"
            "NetworkExtension"
            "NotificationCenter"
            "OSAKit"
            "OSLog"
            "OpenAL"
            "OpenCL"
            "OpenDirectory"
            "OpenGL"
            "PCSC"
            "PDFKit"
            "PHASE"
            "ParavirtualizedGraphics"
            "PassKit"
            "PencilKit"
            "Photos"
            "PhotosUI"
            "PreferencePanes"
            "PushKit"
            "Python"
            "QTKit"
            "Quartz"
            "QuartzCore"
            "QuickLook"
            "QuickLookThumbnailing"
            "QuickLookUI"
            "RealityFoundation"
            "RealityKit"
            "ReplayKit"
            "Ruby"
            "SafariServices"
            "SceneKit"
            "ScreenSaver"
            "ScreenTime"
            "ScriptingBridge"
            "Security"
            "SecurityFoundation"
            "SecurityInterface"
            "SensorKit"
            "ServiceManagement"
            "ShazamKit"
            "Social"
            "SoundAnalysis"
            "Speech"
            "SpriteKit"
            "StoreKit"
            "SwiftUI"
            "SyncServices"
            "SystemConfiguration"
            "SystemExtensions"
            "TWAIN"
            "TabularData"
            "Tcl"
            "Tk"
            "UniformTypeIdentifiers"
            "UserNotifications"
            "UserNotificationsUI"
            "VideoDecodeAcceleration"
            "VideoSubscriberAccount"
            "VideoToolbox"
            "Virtualization"
            "Vision"
            "WebKit"
            "WidgetKit"
            "_AVKit_SwiftUI"
            "_AuthenticationServices_SwiftUI"
            "_CoreData_CloudKit"
            "_MapKit_SwiftUI"
            "_MusicKit_SwiftUI"
            "_QuickLook_SwiftUI"
            "_SceneKit_SwiftUI"
            "_SpriteKit_SwiftUI"
            "_StoreKit_SwiftUI"
            "iTunesLibrary"
            "vmnet"
          ] (x: tbdOnlyFramework x { private = false; });
      });
}

