//
//  Parent+MIDISettingsPopoverDelegate.swift
//  AudioKitSynthOne
//
//  Created by Aurelius Prochazka on 5/25/18.
//  Copyright © 2018 AudioKit. All rights reserved.
//

// MIDI Settings Pop Over Delegate

extension ParentViewController: MIDISettingsPopOverDelegate {

    func resetMIDILearn() {
        midiKnobs.forEach { $0.midiCC = 255 }
        saveAppSettingValues()
    }

    func didSelectMIDIChannel(newChannel: Int) {
        if newChannel > -1 {
            midiChannelIn = MIDIByte(newChannel)
            omniMode = false
        } else {
            midiChannelIn = 0
            omniMode = true
        }
        saveAppSettingValues()
    }

    func didToggleVelocity() {
        appSettings.velocitySensitive = !appSettings.velocitySensitive
        saveAppSettingValues()
    }

    public func storeTuningWithPresetDidChange(_ value: Bool) {
        appSettings.saveTuningWithPreset = value
    }
}