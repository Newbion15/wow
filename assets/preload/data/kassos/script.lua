finishedGameover = false;


function onCreate()
setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-kassos')
setProperty('skipCountdown',true)
setProperty('camZooms',false)
end

function onUpdate(elapsed)
	
	if inGameOver and not startedPlaying and not finishedGameover then
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.2);
	end
      if not finishedGameover and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' and not startedPlaying then
            math.randomseed(curBeat * 4)
            soundName = string.format('welfare-gameover%i', getRandomInt(1, 6))
            playSound(soundName, 1, 'voiceWelfare')
            startedPlaying = true
      end
end

function onGameOverConfirm(reset)
	finishedGameover = true;
end

function onSoundFinished(tag)
	if tag == 'voiceWelfare' and not finishedGameover then
		soundFadeIn(nil, 4, 0.2, 1);
	end
end

function onSongStart()
characterPlayAnim('bf', 'preidle', true);

		doTweenAlpha('hideHUD','iconP1', 0, 0.3, 'linear')
		doTweenAlpha('hideHUD2','iconP2', 0, 0.3, 'linear')
		doTweenAlpha('hideHUD3','healthBar', 0, 0.3, 'linear')
		doTweenAlpha('hideHUD4','scoreTxt', 0, 0.3, 'linear')
		doTweenAlpha('hideHUD8','rating', 0, 0.3, 'linear')
		
		noteTweenX("NoteMove1", 0, -1000, 0.001, 'cubeInOut')
		noteTweenX("NoteMove2", 1, -1000, 0.001, 'cubeInOut')
		noteTweenX("NoteMove3", 2, -1000, 0.001, 'cubeInOut')
		noteTweenX("NoteMove4", 3, -1000, 0.001, 'cubeInOut')
		noteTweenX("NoteMove5", 4, 0, 0.001, 'cubeInOut')
		noteTweenX("NoteMove6", 5, 110, 0.001, 'cubeInOut')
		noteTweenX("NoteMove7", 6, 215, 0.001, 'cubeInOut')
		noteTweenX("NoteMove8", 7, 320, 0.001, 'cubeInOut')
		
end

function onBeatHit()

	if curBeat < 7 then
		if getProperty('curBeat') % 2 == 0 then	
				
			characterPlayAnim('bf', 'preidle', true);

		end
	end
	
	if curBeat > 13 then		
		doTweenAlpha('hideHUD3','healthBar', 1, 0.3, 'linear')
		doTweenAlpha('hideHUD','iconP1', 1, 0.3, 'linear')
		doTweenAlpha('hideHUD2','iconP2', 1, 0.3, 'linear')
		doTweenAlpha('hideHUD4','scoreTxt', 1, 0.3, 'linear')

	end
	
	if curBeat == 196 then

	playSound('leskassos', 1, 'TheEnd')

	end
	
end

function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
        startVideo('kassos');
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end