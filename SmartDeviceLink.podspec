Pod::Spec.new do |s|

s.name         = "SmartDeviceLink"
s.version      = "6.7.0"
s.summary      = "Connect your app with cars!"
s.homepage     = "https://github.com/smartdevicelink/SmartDeviceLink-iOS"
s.license      = { :type => "New BSD", :file => "LICENSE" }
s.author       = { "SmartDeviceLink Team" => "developer@smartdevicelink.com" }
s.platform     = :ios, "8.0"
s.dependency     'BiSON', '~> 1.2.0'
s.source       = { :git => "https://github.com/smartdevicelink/sdl_ios.git", :tag => s.version.to_s }
s.requires_arc = true
s.swift_version = '5.2'

s.default_subspec = 'Default'

s.subspec 'Default' do |sdefault|
sdefault.source_files = 'SmartDeviceLink/*.{h,m}'
sdefault.resource_bundles = { 'SmartDeviceLink' => ['SmartDeviceLink/Assets/**/*'] }

sdefault.public_header_files = [
'SmartDeviceLink/NSNumber+NumberType.h',
'SmartDeviceLink/SDLAddCommand.h',
'SmartDeviceLink/SDLAddCommandResponse.h',
'SmartDeviceLink/SDLAddSubMenu.h',
'SmartDeviceLink/SDLAddSubMenuResponse.h',
'SmartDeviceLink/SDLAirbagStatus.h',
'SmartDeviceLink/SDLAlert.h',
'SmartDeviceLink/SDLAlertManeuver.h',
'SmartDeviceLink/SDLAlertManeuverResponse.h',
'SmartDeviceLink/SDLAlertResponse.h',
'SmartDeviceLink/SDLAppServiceCapability.h',
'SmartDeviceLink/SDLAppServiceData.h',
'SmartDeviceLink/SDLAppServiceManifest.h',
'SmartDeviceLink/SDLAppServiceRecord.h',
'SmartDeviceLink/SDLAppServicesCapabilities.h',
'SmartDeviceLink/SDLAppServiceType.h',
'SmartDeviceLink/SDLButtonPressResponse.h',
'SmartDeviceLink/SDLAmbientLightStatus.h',
'SmartDeviceLink/SDLAppHMIType.h',
'SmartDeviceLink/SDLAppInfo.h',
'SmartDeviceLink/SDLAppInterfaceUnregisteredReason.h',
'SmartDeviceLink/SDLArtwork.h',
'SmartDeviceLink/SDLAudioControlData.h',
'SmartDeviceLink/SDLAudioControlCapabilities.h',
'SmartDeviceLink/SDLAudioPassThruCapabilities.h',
'SmartDeviceLink/SDLAudioFile.h',
'SmartDeviceLink/SDLAudioStreamingState.h',
'SmartDeviceLink/SDLAudioStreamingIndicator.h',
'SmartDeviceLink/SDLAudioStreamManager.h',
'SmartDeviceLink/SDLAudioStreamManagerDelegate.h',
'SmartDeviceLink/SDLStreamingAudioManagerType.h',
'SmartDeviceLink/SDLAudioType.h',
'SmartDeviceLink/SDLBeltStatus.h',
'SmartDeviceLink/SDLBitsPerSample.h',
'SmartDeviceLink/SDLBodyInformation.h',
'SmartDeviceLink/SDLButtonCapabilities.h',
'SmartDeviceLink/SDLButtonEventMode.h',
'SmartDeviceLink/SDLButtonName.h',
'SmartDeviceLink/SDLButtonPress.h',
'SmartDeviceLink/SDLButtonPressMode.h',
'SmartDeviceLink/SDLCancelInteraction.h',
'SmartDeviceLink/SDLCancelInteractionResponse.h',
'SmartDeviceLink/SDLCarModeStatus.h',
'SmartDeviceLink/SDLCarWindowViewController.h',
'SmartDeviceLink/SDLChangeRegistration.h',
'SmartDeviceLink/SDLChangeRegistrationResponse.h',
'SmartDeviceLink/SDLCharacterSet.h',
'SmartDeviceLink/SDLChoice.h',
'SmartDeviceLink/SDLChoiceCell.h',
'SmartDeviceLink/SDLChoiceSet.h',
'SmartDeviceLink/SDLChoiceSetDelegate.h',
'SmartDeviceLink/SDLClimateControlCapabilities.h',
'SmartDeviceLink/SDLClimateControlData.h',
'SmartDeviceLink/SDLCloseApplication.h',
'SmartDeviceLink/SDLCloseApplicationResponse.h',
'SmartDeviceLink/SDLCloudAppProperties.h',
'SmartDeviceLink/SDLClusterModeStatus.h',
'SmartDeviceLink/SDLCompassDirection.h',
'SmartDeviceLink/SDLComponentVolumeStatus.h',
'SmartDeviceLink/SDLConfiguration.h',
'SmartDeviceLink/SDLCreateInteractionChoiceSet.h',
'SmartDeviceLink/SDLCreateInteractionChoiceSetResponse.h',
'SmartDeviceLink/SDLCreateWindow.h',
'SmartDeviceLink/SDLCreateWindowResponse.h',
'SmartDeviceLink/SDLDateTime.h',
'SmartDeviceLink/SDLDefrostZone.h',
'SmartDeviceLink/SDLDeleteCommand.h',
'SmartDeviceLink/SDLDeleteCommandResponse.h',
'SmartDeviceLink/SDLDeleteFile.h',
'SmartDeviceLink/SDLDeleteFileResponse.h',
'SmartDeviceLink/SDLDeleteInteractionChoiceSet.h',
'SmartDeviceLink/SDLDeleteInteractionChoiceSetResponse.h',
'SmartDeviceLink/SDLDeleteSubMenu.h',
'SmartDeviceLink/SDLDeleteSubMenuResponse.h',
'SmartDeviceLink/SDLDeleteWindow.h',
'SmartDeviceLink/SDLDeleteWindowResponse.h',
'SmartDeviceLink/SDLDeliveryMode.h',
'SmartDeviceLink/SDLDeviceInfo.h',
'SmartDeviceLink/SDLDeviceLevelStatus.h',
'SmartDeviceLink/SDLDeviceStatus.h',
'SmartDeviceLink/SDLDiagnosticMessage.h',
'SmartDeviceLink/SDLDiagnosticMessageResponse.h',
'SmartDeviceLink/SDLDialNumber.h',
'SmartDeviceLink/SDLDialNumberResponse.h',
'SmartDeviceLink/SDLDIDResult.h',
'SmartDeviceLink/SDLDimension.h',
'SmartDeviceLink/SDLDirection.h',
'SmartDeviceLink/SDLDisplayCapability.h',
'SmartDeviceLink/SDLDisplayCapabilities.h',
'SmartDeviceLink/SDLDisplayMode.h',
'SmartDeviceLink/SDLDisplayType.h',
'SmartDeviceLink/SDLDistanceUnit.h',
'SmartDeviceLink/SDLDriverDistractionState.h',
'SmartDeviceLink/SDLDynamicUpdateCapabilities.h',
'SmartDeviceLink/SDLECallConfirmationStatus.h',
'SmartDeviceLink/SDLECallInfo.h',
'SmartDeviceLink/SDLElectronicParkBrakeStatus.h',
'SmartDeviceLink/SDLEncryptionConfiguration.h',
'SmartDeviceLink/SDLEmergencyEvent.h',
'SmartDeviceLink/SDLEmergencyEventType.h',
'SmartDeviceLink/SDLEncodedSyncPData.h',
'SmartDeviceLink/SDLEncodedSyncPDataResponse.h',
'SmartDeviceLink/SDLEndAudioPassThru.h',
'SmartDeviceLink/SDLEndAudioPassThruResponse.h',
'SmartDeviceLink/SDLEqualizerSettings.h',
'SmartDeviceLink/SDLEnum.h',
'SmartDeviceLink/SDLErrorConstants.h',
'SmartDeviceLink/SDLFile.h',
'SmartDeviceLink/SDLFileManager.h',
'SmartDeviceLink/SDLFileManagerConfiguration.h',
'SmartDeviceLink/SDLFileManagerConstants.h',
'SmartDeviceLink/SDLFileType.h',
'SmartDeviceLink/SDLFuelCutoffStatus.h',
'SmartDeviceLink/SDLFuelRange.h',
'SmartDeviceLink/SDLFuelType.h',
'SmartDeviceLink/SDLFunctionID.h',
'SmartDeviceLink/SDLGenericResponse.h',
'SmartDeviceLink/SDLGetAppServiceData.h',
'SmartDeviceLink/SDLGetAppServiceDataResponse.h',
'SmartDeviceLink/SDLGetDTCs.h',
'SmartDeviceLink/SDLGetCloudAppProperties.h',
'SmartDeviceLink/SDLGetCloudAppPropertiesResponse.h',
'SmartDeviceLink/SDLGetDTCsResponse.h',
'SmartDeviceLink/SDLGetFile.h',
'SmartDeviceLink/SDLGetFileResponse.h',
'SmartDeviceLink/SDLGetInteriorVehicleData.h',
'SmartDeviceLink/SDLGetInteriorVehicleDataConsent.h',
'SmartDeviceLink/SDLGetInteriorVehicleDataConsentResponse.h',
'SmartDeviceLink/SDLGetInteriorVehicleDataResponse.h',
'SmartDeviceLink/SDLGetSystemCapability.h',
'SmartDeviceLink/SDLGetSystemCapabilityResponse.h',
'SmartDeviceLink/SDLGetVehicleData.h',
'SmartDeviceLink/SDLGetVehicleDataResponse.h',
'SmartDeviceLink/SDLGetWaypoints.h',
'SmartDeviceLink/SDLGetWaypointsResponse.h',
'SmartDeviceLink/SDLGlobalProperty.h',
'SmartDeviceLink/SDLGPSData.h',
'SmartDeviceLink/SDLGrid.h',
'SmartDeviceLink/SDLHapticRect.h',
'SmartDeviceLink/SDLHeadLampStatus.h',
'SmartDeviceLink/SDLHMICapabilities.h',
'SmartDeviceLink/SDLHMILevel.h',
'SmartDeviceLink/SDLHMIPermissions.h',
'SmartDeviceLink/SDLHMISettingsControlCapabilities.h',
'SmartDeviceLink/SDLHMISettingsControlData.h',
'SmartDeviceLink/SDLHMIZoneCapabilities.h',
'SmartDeviceLink/SDLHybridAppPreference.h',
'SmartDeviceLink/SDLIgnitionStableStatus.h',
'SmartDeviceLink/SDLIgnitionStatus.h',
'SmartDeviceLink/SDLImage.h',
'SmartDeviceLink/SDLImageField.h',
'SmartDeviceLink/SDLImageFieldName.h',
'SmartDeviceLink/SDLImageResolution.h',
'SmartDeviceLink/SDLImageType.h',
'SmartDeviceLink/SDLInteractionMode.h',
'SmartDeviceLink/SDLKeyboardDelegate.h',
'SmartDeviceLink/SDLKeyboardEvent.h',
'SmartDeviceLink/SDLKeyboardLayout.h',
'SmartDeviceLink/SDLKeyboardProperties.h',
'SmartDeviceLink/SDLKeypressMode.h',
'SmartDeviceLink/SDLLanguage.h',
'SmartDeviceLink/SDLLayoutMode.h',
'SmartDeviceLink/SDLLifecycleConfiguration.h',
'SmartDeviceLink/SDLLifecycleConfigurationUpdate.h',
'SmartDeviceLink/SDLLightCapabilities.h',
'SmartDeviceLink/SDLLightControlCapabilities.h',
'SmartDeviceLink/SDLLightControlData.h',
'SmartDeviceLink/SDLLightName.h',
'SmartDeviceLink/SDLLightState.h',
'SmartDeviceLink/SDLLightStatus.h',
'SmartDeviceLink/SDLListFiles.h',
'SmartDeviceLink/SDLListFilesResponse.h',
'SmartDeviceLink/SDLLocationCoordinate.h',
'SmartDeviceLink/SDLLocationDetails.h',
'SmartDeviceLink/SDLLockScreenConfiguration.h',
'SmartDeviceLink/SDLLockScreenStatus.h',
'SmartDeviceLink/SDLLockScreenViewController.h',
'SmartDeviceLink/SDLLogConfiguration.h',
'SmartDeviceLink/SDLLogConstants.h',
'SmartDeviceLink/SDLLogFileModule.h',
'SmartDeviceLink/SDLLogFilter.h',
'SmartDeviceLink/SDLLogMacros.h',
'SmartDeviceLink/SDLLogManager.h',
'SmartDeviceLink/SDLLogTarget.h',
'SmartDeviceLink/SDLLogTargetAppleSystemLog.h',
'SmartDeviceLink/SDLLogTargetFile.h',
'SmartDeviceLink/SDLLogTargetOSLog.h',
'SmartDeviceLink/SDLMacros.h',
'SmartDeviceLink/SDLMaintenanceModeStatus.h',
'SmartDeviceLink/SDLManager.h',
'SmartDeviceLink/SDLManagerDelegate.h',
'SmartDeviceLink/SDLMassageCushionFirmness.h',
'SmartDeviceLink/SDLMassageModeData.h',
'SmartDeviceLink/SDLMassageCushion.h',
'SmartDeviceLink/SDLMassageMode.h',
'SmartDeviceLink/SDLMassageZone.h',
'SmartDeviceLink/SDLMediaClockFormat.h',
'SmartDeviceLink/SDLMediaServiceData.h',
'SmartDeviceLink/SDLMediaServiceManifest.h',
'SmartDeviceLink/SDLMediaType.h',
'SmartDeviceLink/SDLMenuCell.h',
'SmartDeviceLink/SDLMenuConfiguration.h',
'SmartDeviceLink/SDLMenuLayout.h',
'SmartDeviceLink/SDLMenuManagerConstants.h',
'SmartDeviceLink/SDLMenuParams.h',
'SmartDeviceLink/SDLMetadataTags.h',
'SmartDeviceLink/SDLMetadataType.h',
'SmartDeviceLink/SDLModuleData.h',
'SmartDeviceLink/SDLModuleInfo.h',
'SmartDeviceLink/SDLModuleType.h',
'SmartDeviceLink/SDLMyKey.h',
'SmartDeviceLink/SDLNavigationAction.h',
'SmartDeviceLink/SDLNavigationCapability.h',
'SmartDeviceLink/SDLNavigationInstruction.h',
'SmartDeviceLink/SDLNavigationJunction.h',
'SmartDeviceLink/SDLNavigationServiceData.h',
'SmartDeviceLink/SDLNavigationServiceManifest.h',
'SmartDeviceLink/SDLNotificationConstants.h',
'SmartDeviceLink/SDLOasisAddress.h',
'SmartDeviceLink/SDLOnAppInterfaceUnregistered.h',
'SmartDeviceLink/SDLOnAppServiceData.h',
'SmartDeviceLink/SDLOnAudioPassThru.h',
'SmartDeviceLink/SDLOnButtonEvent.h',
'SmartDeviceLink/SDLOnButtonPress.h',
'SmartDeviceLink/SDLOnCommand.h',
'SmartDeviceLink/SDLOnDriverDistraction.h',
'SmartDeviceLink/SDLOnEncodedSyncPData.h',
'SmartDeviceLink/SDLOnHashChange.h',
'SmartDeviceLink/SDLOnInteriorVehicleData.h',
'SmartDeviceLink/SDLOnHMIStatus.h',
'SmartDeviceLink/SDLOnKeyboardInput.h',
'SmartDeviceLink/SDLOnLanguageChange.h',
'SmartDeviceLink/SDLOnLockScreenStatus.h',
'SmartDeviceLink/SDLOnPermissionsChange.h',
'SmartDeviceLink/SDLOnRCStatus.h',
'SmartDeviceLink/SDLOnSyncPData.h',
'SmartDeviceLink/SDLOnSystemCapabilityUpdated.h',
'SmartDeviceLink/SDLOnSystemRequest.h',
'SmartDeviceLink/SDLOnTBTClientState.h',
'SmartDeviceLink/SDLOnTouchEvent.h',
'SmartDeviceLink/SDLOnUpdateFile.h',
'SmartDeviceLink/SDLOnUpdateSubMenu.h',
'SmartDeviceLink/SDLOnVehicleData.h',
'SmartDeviceLink/SDLOnWayPointChange.h',
'SmartDeviceLink/SDLParameterPermissions.h',
'SmartDeviceLink/SDLPerformAppServiceInteraction.h',
'SmartDeviceLink/SDLPerformAppServiceInteractionResponse.h',
'SmartDeviceLink/SDLPerformAudioPassThru.h',
'SmartDeviceLink/SDLPerformAudioPassThruResponse.h',
'SmartDeviceLink/SDLPerformInteraction.h',
'SmartDeviceLink/SDLPerformInteractionResponse.h',
'SmartDeviceLink/SDLPermissionConstants.h',
'SmartDeviceLink/SDLPermissionElement.h',
'SmartDeviceLink/SDLPermissionItem.h',
'SmartDeviceLink/SDLPermissionManager.h',
'SmartDeviceLink/SDLPermissionStatus.h',
'SmartDeviceLink/SDLPhoneCapability.h',
'SmartDeviceLink/SDLPinchGesture.h',
'SmartDeviceLink/SDLPowerModeQualificationStatus.h',
'SmartDeviceLink/SDLPowerModeStatus.h',
'SmartDeviceLink/SDLPredefinedLayout.h',
'SmartDeviceLink/SDLPredefinedWindows.h',
'SmartDeviceLink/SDLPrerecordedSpeech.h',
'SmartDeviceLink/SDLPresetBankCapabilities.h',
'SmartDeviceLink/SDLPrimaryAudioSource.h',
'SmartDeviceLink/SDLPRNDL.h',
'SmartDeviceLink/SDLProtocolConstants.h',
'SmartDeviceLink/SDLPublishAppService.h',
'SmartDeviceLink/SDLPublishAppServiceResponse.h',
'SmartDeviceLink/SDLPutFile.h',
'SmartDeviceLink/SDLPutFileResponse.h',
'SmartDeviceLink/SDLRadioBand.h',
'SmartDeviceLink/SDLRadioControlCapabilities.h',
'SmartDeviceLink/SDLRadioControlData.h',
'SmartDeviceLink/SDLRadioState.h',
'SmartDeviceLink/SDLRDSData.h',
'SmartDeviceLink/SDLReadDID.h',
'SmartDeviceLink/SDLRectangle.h',
'SmartDeviceLink/SDLReadDIDResponse.h',
'SmartDeviceLink/SDLRectangle.h',
'SmartDeviceLink/SDLRegisterAppInterface.h',
'SmartDeviceLink/SDLRegisterAppInterfaceResponse.h',
'SmartDeviceLink/SDLRemoteControlCapabilities.h',
'SmartDeviceLink/SDLReleaseInteriorVehicleDataModule.h',
'SmartDeviceLink/SDLReleaseInteriorVehicleDataModuleResponse.h',
'SmartDeviceLink/SDLRequestType.h',
'SmartDeviceLink/SDLResetGlobalProperties.h',
'SmartDeviceLink/SDLResetGlobalPropertiesResponse.h',
'SmartDeviceLink/SDLResult.h',
'SmartDeviceLink/SDLRGBColor.h',
'SmartDeviceLink/SDLRPCFunctionNames.h',
'SmartDeviceLink/SDLRPCMessage.h',
'SmartDeviceLink/SDLRPCMessageType.h',
'SmartDeviceLink/SDLRPCNotification.h',
'SmartDeviceLink/SDLRPCNotificationNotification.h',
'SmartDeviceLink/SDLRPCPermissionStatus.h',
'SmartDeviceLink/SDLRPCRequest.h',
'SmartDeviceLink/SDLRPCRequestNotification.h',
'SmartDeviceLink/SDLRPCResponse.h',
'SmartDeviceLink/SDLRPCResponseNotification.h',
'SmartDeviceLink/SDLRPCStruct.h',
'SmartDeviceLink/SDLSamplingRate.h',
'SmartDeviceLink/SDLScreenParams.h',
'SmartDeviceLink/SDLScreenManager.h',
'SmartDeviceLink/SDLScrollableMessage.h',
'SmartDeviceLink/SDLScrollableMessageResponse.h',
'SmartDeviceLink/SDLSeatControlCapabilities.h',
'SmartDeviceLink/SDLSeatControlData.h',
'SmartDeviceLink/SDLSeatLocation.h',
'SmartDeviceLink/SDLSeatLocationCapability.h',
'SmartDeviceLink/SDLSeatMemoryAction.h',
'SmartDeviceLink/SDLSeatMemoryActionType.h',
'SmartDeviceLink/SDLSecurityType.h',
'SmartDeviceLink/SDLSendHapticData.h',
'SmartDeviceLink/SDLSendHapticDataResponse.h',
'SmartDeviceLink/SDLSendLocation.h',
'SmartDeviceLink/SDLSendLocationResponse.h',
'SmartDeviceLink/SDLServiceEncryptionDelegate.h',
'SmartDeviceLink/SDLServiceUpdateReason.h',
'SmartDeviceLink/SDLSetAppIcon.h',
'SmartDeviceLink/SDLSetAppIconResponse.h',
'SmartDeviceLink/SDLSetCloudAppProperties.h',
'SmartDeviceLink/SDLSetCloudAppPropertiesResponse.h',
'SmartDeviceLink/SDLSetDisplayLayout.h',
'SmartDeviceLink/SDLSetDisplayLayoutResponse.h',
'SmartDeviceLink/SDLSetGlobalProperties.h',
'SmartDeviceLink/SDLSetInteriorVehicleData.h',
'SmartDeviceLink/SDLSetGlobalPropertiesResponse.h',
'SmartDeviceLink/SDLSetInteriorVehicleDataResponse.h',
'SmartDeviceLink/SDLSetMediaClockTimer.h',
'SmartDeviceLink/SDLSetMediaClockTimerResponse.h',
'SmartDeviceLink/SDLShow.h',
'SmartDeviceLink/SDLShowAppMenu.h',
'SmartDeviceLink/SDLShowAppMenuResponse.h',
'SmartDeviceLink/SDLShowConstantTBT.h',
'SmartDeviceLink/SDLShowConstantTBTResponse.h',
'SmartDeviceLink/SDLShowResponse.h',
'SmartDeviceLink/SDLSingleTireStatus.h',
'SmartDeviceLink/SDLSISData.h',
'SmartDeviceLink/SDLSlider.h',
'SmartDeviceLink/SDLSliderResponse.h',
'SmartDeviceLink/SDLSoftButton.h',
'SmartDeviceLink/SDLSoftButtonCapabilities.h',
'SmartDeviceLink/SDLSoftButtonObject.h',
'SmartDeviceLink/SDLSoftButtonState.h',
'SmartDeviceLink/SDLSoftButtonType.h',
'SmartDeviceLink/SDLSpeak.h',
'SmartDeviceLink/SDLSpeakResponse.h',
'SmartDeviceLink/SDLSpeechCapabilities.h',
'SmartDeviceLink/SDLStartTime.h',
'SmartDeviceLink/SDLStaticIconName.h',
'SmartDeviceLink/SDLStationIDNumber.h',
'SmartDeviceLink/SDLStreamingMediaConfiguration.h',
'SmartDeviceLink/SDLStreamingMediaManager.h',
'SmartDeviceLink/SDLStreamingMediaManagerConstants.h',
'SmartDeviceLink/SDLStreamingMediaManagerDataSource.h',
'SmartDeviceLink/SDLStreamingVideoScaleManager.h',
'SmartDeviceLink/SDLSubscribeButton.h',
'SmartDeviceLink/SDLSubscribeButtonResponse.h',
'SmartDeviceLink/SDLSubscribeVehicleData.h',
'SmartDeviceLink/SDLSubscribeVehicleDataResponse.h',
'SmartDeviceLink/SDLSubscribeWaypoints.h',
'SmartDeviceLink/SDLSubscribeWaypointsResponse.h',
'SmartDeviceLink/SDLSupportedSeat.h',
'SmartDeviceLink/SDLSyncMsgVersion.h',
'SmartDeviceLink/SDLMsgVersion.h',
'SmartDeviceLink/SDLSyncPData.h',
'SmartDeviceLink/SDLSyncPDataResponse.h',
'SmartDeviceLink/SDLSystemAction.h',
'SmartDeviceLink/SDLSystemCapability.h',
'SmartDeviceLink/SDLSystemCapabilityManager.h',
'SmartDeviceLink/SDLSystemCapabilityType.h',
'SmartDeviceLink/SDLSystemContext.h',
'SmartDeviceLink/SDLSystemRequest.h',
'SmartDeviceLink/SDLTBTState.h',
'SmartDeviceLink/SDLTemperature.h',
'SmartDeviceLink/SDLTemperatureUnit.h',
'SmartDeviceLink/SDLTemplateConfiguration.h',
'SmartDeviceLink/SDLTemplateColorScheme.h',
'SmartDeviceLink/SDLTextAlignment.h',
'SmartDeviceLink/SDLTextField.h',
'SmartDeviceLink/SDLTextFieldName.h',
'SmartDeviceLink/SDLTimerMode.h',
'SmartDeviceLink/SDLTireStatus.h',
'SmartDeviceLink/SDLTouch.h',
'SmartDeviceLink/SDLTouchCoord.h',
'SmartDeviceLink/SDLTouchEvent.h',
'SmartDeviceLink/SDLTouchEventCapabilities.h',
'SmartDeviceLink/SDLTouchManager.h',
'SmartDeviceLink/SDLTouchManagerDelegate.h',
'SmartDeviceLink/SDLTouchType.h',
'SmartDeviceLink/SDLTPMS.h',
'SmartDeviceLink/SDLTriggerSource.h',
'SmartDeviceLink/SDLTTSChunk.h',
'SmartDeviceLink/SDLTurn.h',
'SmartDeviceLink/SDLTurnSignal.h',
'SmartDeviceLink/SDLUnpublishAppService.h',
'SmartDeviceLink/SDLUnpublishAppServiceResponse.h',
'SmartDeviceLink/SDLUnregisterAppInterface.h',
'SmartDeviceLink/SDLUnregisterAppInterfaceResponse.h',
'SmartDeviceLink/SDLUnsubscribeButton.h',
'SmartDeviceLink/SDLUnsubscribeButtonResponse.h',
'SmartDeviceLink/SDLUnsubscribeVehicleData.h',
'SmartDeviceLink/SDLUnsubscribeVehicleDataResponse.h',
'SmartDeviceLink/SDLUnsubscribeWaypoints.h',
'SmartDeviceLink/SDLUnsubscribeWaypointsResponse.h',
'SmartDeviceLink/SDLUpdateMode.h',
'SmartDeviceLink/SDLUpdateTurnList.h',
'SmartDeviceLink/SDLUpdateTurnListResponse.h',
'SmartDeviceLink/SDLVehicleDataActiveStatus.h',
'SmartDeviceLink/SDLVehicleDataEventStatus.h',
'SmartDeviceLink/SDLVehicleDataNotificationStatus.h',
'SmartDeviceLink/SDLVehicleDataResult.h',
'SmartDeviceLink/SDLVehicleDataResultCode.h',
'SmartDeviceLink/SDLVehicleDataStatus.h',
'SmartDeviceLink/SDLVehicleDataType.h',
'SmartDeviceLink/SDLVentilationMode.h',
'SmartDeviceLink/SDLVehicleType.h',
'SmartDeviceLink/SDLVersion.h',
'SmartDeviceLink/SDLVideoStreamingCapability.h',
'SmartDeviceLink/SDLVideoStreamingCodec.h',
'SmartDeviceLink/SDLVideoStreamingFormat.h',
'SmartDeviceLink/SDLVideoStreamingProtocol.h',
'SmartDeviceLink/SDLVideoStreamingState.h',
'SmartDeviceLink/SDLVoiceCommand.h',
'SmartDeviceLink/SDLVrCapabilities.h',
'SmartDeviceLink/SDLVrHelpItem.h',
'SmartDeviceLink/SDLWarningLightStatus.h',
'SmartDeviceLink/SDLWayPointType.h',
'SmartDeviceLink/SDLWeatherAlert.h',
'SmartDeviceLink/SDLWeatherData.h',
'SmartDeviceLink/SDLWeatherServiceData.h',
'SmartDeviceLink/SDLWeatherServiceManifest.h',
'SmartDeviceLink/SDLWiperStatus.h',
'SmartDeviceLink/SDLWindowCapability.h',
'SmartDeviceLink/SDLWindowType.h',
'SmartDeviceLink/SDLWindowTypeCapabilities.h',
'SmartDeviceLink/SmartDeviceLink.h',
]
end

s.subspec 'Swift' do |sswift|
sswift.dependency 'SmartDeviceLink/Default'
sswift.source_files = 'SmartDeviceLinkSwift/*.swift'
end

end
