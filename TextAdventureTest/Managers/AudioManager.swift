//
//  AudioManager.swift
//  TextAdventureTest
//
//  Created by Gino Preti on 27/01/2019.
//  Copyright © 2019 Gino Preti. All rights reserved.
//

import Foundation
import AVFoundation

class AudioManager
{
    private var music: AVAudioPlayer?
    
    func loadMainTheme()
    {
        do
        {
            if let path = Bundle.main.path(forResource: GameDataUILayout.backgroundMusicTheme, ofType:nil)
            {
                let url = URL(fileURLWithPath: path)
                
                music = try AVAudioPlayer(contentsOf: url)
                
                music!.prepareToPlay()
            }
            else
            {
                throw ApplicationInternalErrors.noAudioFileLoaded
            }
        }
        catch (let err)
        {
            print("UNABLE TO PRELOAD MUSIC FILE !!! \(err.localizedDescription)")
        }
    }
    
    func loadInGameTheme()
    {
        do
        {
            if let path = Bundle.main.path(forResource: GameDataUILayout.inGameMusicTheme, ofType:nil)
            {
                let url = URL(fileURLWithPath: path)
                
                music = try AVAudioPlayer(contentsOf: url)
                
                music!.prepareToPlay()
            }
            else
            {
                throw ApplicationInternalErrors.noAudioFileLoaded
            }
        }
        catch (let err)
        {
            print("UNABLE TO PRELOAD MUSIC FILE !!! \(err.localizedDescription)")
        }
    }
    
    func play()
    {
        if PreferencesManager.getAudioEnabled() != nil
        {
            let audioState = PreferencesManager.getAudioEnabled()!
            
            if audioState == true
            {
                guard music != nil else {
                    
                    print("AUDIO PLAYER NOT READY !!!")
                    return
                    
                }
                
                music!.play()
            }
        }
    }
    
    func pause()
    {
        music?.pause()
    }
    
    func stop()
    {
        music?.stop()
    }
    
    func isPlaying() -> Bool
    {
        guard music != nil else {
            return false
        }
        
        return music!.isPlaying
    }
}
