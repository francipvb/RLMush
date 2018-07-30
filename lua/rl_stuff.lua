require "ppi"
local snd = nil
local gmcp = nil

-- Funciones asociadas a mensajes enviados mediante GMCP
local suscriptores = {}

mushreader = nil

local html_replacements = {
	['&lt;'] = "<",
	['&gt;'] = ">",
	['&quot;'] = "\""
}

local coros = {}

-- Tomado de la wiki de LUA
local function interp(s, tab)
	return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end
getmetatable("").__mod = interp

function replace_html(s)
	-- Substituye los caracteres html por sus correspondientes simples.
	for k, v in pairs(html_replacements) do
		s = s:gsub(k, v)
	end -- html
	
	return s
end -- function

function RLStuffListChanged()
	mushreader = ppi.Load("16ba6b7a227a9dab54f5c76e")
	snd = ppi.Load("aedf0cb0be5bf045860d54b7")
	gmcp = ppi.Load("3b764c2d9d7e85dbf01ddfab")
	
	if gmcp then
		
	end -- gmcp
end -- OnPluginListChanged

function playSound(sound,loop,pan,vol)
	if not snd then
		return
	end -- if
	return snd.play(GetInfo(67)..sound,loop,pan,vol)
end -- PlaySound

function playDelay(sound,time,pan,vol)
	snd.playDelay(GetInfo(67).."sounds/"..sound,time,pan,vol)
end -- PlayDelay

function playListOfSounds(list, time, pan, vol)
	-- Comprobación de errores
	assert(list, "No se pasó una lista de sonidos.")
	assert(type(list) == "table", string.format("Se pasó un %s, se esperaba una tabla.", type(list)))
	
	for  k, v in pairs(list) do
		playDelay(v, k*time, pan, vol)
	end
end -- playListOfSounds

function slidePan(x,id,time)
	if not snd then
		snd = ppi.Load("aedf0cb0be5bf045860d54b7")
	end -- snd
	return snd.slidePan(x,id,time)
end -- SlidePan

function utf8convert(str)
	local data = utils.utf8decode(str)
	local retval = ""
	
	if not data then
		return str
	end -- if
	
	for k, v in pairs(data) do
		local character = ""
		local res = false
		res, character = pcall(string.char, v)
		if res then
			retval = retval..character
		else
			retval = retval.."?"
		end -- if
	end -- data
	
	return retval
end -- utf8convert

function history_add(cat, msg)
	CallPlugin("f6153a4ac099403418c11711", "history_add", cat, msg)
end -- add_history

function play_sound(filepath, pan)
	local folder = "sounds/" .. filepath

	return playSound(folder, 0, pan or 0)
end -- play_sound

function subscribir(mensaje, funcion)
	assert(mensaje, "No se definió un mensaje.")
	assert(type(mensaje) == "string", "El mensaje no es válido.")
	assert(funcion, "No se suplió una función.")
	assert(type(funcion) == "string", "Solo se admite el nombre de la función.")
	
	if gmcp then
		gmcp.add_callback(mensaje, GetPluginID(), funcion)
	end -- gmcp
end -- function

function desuscribir(mensaje, funcion)
	if gmcp then
		gmcp.remove_callback(mensaje, GetPluginID(), funcion)
	end
end -- function

function OnPluginTick()
	for k, v in pairs(coros) do
		if not completo(k) then
			local success, r1, r2, r3 = coroutine.resume(v)
			if success then
				if type(r1) == "string" then
					print(r1)
				end -- if
			else
				print(r1)
			end -- if
		else
			coros[k] = nil
		end -- if
	end -- for
end -- function

function completo(nombre)
	if not coros[nombre] then
		return true
	else
		local success, result = pcall(coroutine.status, coros[nombre])
		return success and result == "dead"
	end -- if
end -- function

function agregarCoro(nombre, funcion)
	coros[nombre] = coroutine.create(funcion)
end -- function
