function onCreate()

	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'FakeVoiceNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'FAKENOTE_assets');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			end
		end
	end
end

function noteMiss(id, direction, noteType, isSustain)
	if noteType == 'FakeVoiceNote' then
		setProperty('health', -500);
	end
end

local healthDrain = 0;
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'FakeVoiceNote' then
		healthDrain = healthDrain + 0.05;
	end
	
end

function onUpdate(elapsed)
	if healthDrain > 0 then
		healthDrain = healthDrain - 0.75 * elapsed;
		setProperty('health', getProperty('health') - 1.75 * elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
		end
	end
end
