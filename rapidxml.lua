-- scaffold geniefile for rapidxml

rapidxml_script = path.getabsolute(path.getdirectory(_SCRIPT))
rapidxml_root = path.join(rapidxml_script, "rapidxml")

rapidxml_includedirs = {
	path.join(rapidxml_script, "config"),
	rapidxml_root,
}

rapidxml_libdirs = {}
rapidxml_links = {}
rapidxml_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { rapidxml_includedirs }
	end,

	_add_defines = function()
		defines { rapidxml_defines }
	end,

	_add_libdirs = function()
		libdirs { rapidxml_libdirs }
	end,

	_add_external_links = function()
		links { rapidxml_links }
	end,

	_add_self_links = function()
		links { "rapidxml" }
	end,

	_create_projects = function()

project "rapidxml"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		rapidxml_includedirs,
	}

	defines {}

	files {
		path.join(rapidxml_script, "config", "**.h"),
		path.join(rapidxml_root, "**.h"),
		path.join(rapidxml_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
