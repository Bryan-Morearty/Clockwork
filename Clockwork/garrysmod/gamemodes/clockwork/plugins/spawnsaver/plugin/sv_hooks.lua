--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode
--]]

-- Called when a player's character has unloaded.
function cwSpawnSaver:PlayerCharacterUnloaded(player)
	if (Clockwork.config:Get("spawn_where_left"):Get() and player:Alive()) then
		local position = player:GetPos();
		local posTable = {
			x = position.x,
			y = position.y,
			z = position.z
		};
		
		player:SetCharacterData("SpawnPoint", posTable);
	end;
end;

-- Called just after a player spawns.
function cwSpawnSaver:PostPlayerSpawn(player, bLightSpawn, bChangeClass, bFirstSpawn)
	if (!bLightSpawn) then
		local spawnPos = player:GetCharacterData("SpawnPoint");
		
		if (spawnPos and Clockwork.config:Get("spawn_where_left"):Get()) then
			player:SetCharacterData("SpawnPoint", nil);
			player:SetPos(Vector(spawnPos.x, spawnPos.y, spawnPos.z));
		end;
	end;
end;