require "ppi"
require "gmcphelper"

local snd = nil

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
end -- OnPluginListChanged

function play_sound(sound,pan,loop,vol)
	if not snd then
		return
	end -- if
	return snd.play(GetInfo(66).."sounds/"..sound,loop or 0,pan,vol)
end -- PlaySound

function play_delay(sound,time,pan,vol)
	snd.playDelay(GetInfo(66).."sounds/"..sound,time,pan,vol)
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

function OnPluginBroadcast (msg, id, name, text)
	if (id == '3e7dedbe37e44942dd46d264') then
		if msg == 1 then
			local fragmento = "if %s then %s() end"
			
			if text == "init" then
				loadstring(string.format(fragmento, "OnGMCPInit", "OnGMCPInit"))()
			elseif text == "reload" then
				loadstring(string.format(fragmento, "OnGMCPReload", "OnGMCPReload"))()
			end -- Mensajes globales
		else
			loadstring(string.format([[
				if OnGMCP then
					OnGMCP("%s")
				end -- if
			]], text))()
		end -- if
	end -- gmcp_handler
end -- function

function PedirGMCP(valor)
	assert(valor, "Tiene que proveerse un valor para la función.")
	assert(type(valor) == "string", "El valor no es un string.")
	
	-- Necesitamos una manera fácil de comprobar los errores
	require "check"

	local rc, datos = CallPlugin("3e7dedbe37e44942dd46d264","gmcpval", valor)
	assert(datos, "No se pudieron conseguir los datos")
	
	return (loadstring("return "..datos))()
end -- function