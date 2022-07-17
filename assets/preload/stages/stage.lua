function onCreate()
	-- background shit
	makeLuaSprite('KassosDesktop', 'KassosDesktop', 15, 25);
	setLuaSpriteScrollFactor('KassosDesktop', 1, 1);
	
	makeLuaSprite('CANALFNF', 'CANALFNF', 1010, 50);
	setLuaSpriteScrollFactor('CANALFNF', 0, 0);

	addLuaSprite('KassosDesktop', false);
	addLuaSprite('CANALFNF', false);
	
end