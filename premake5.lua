project "GSL"
	kind "StaticLib"

	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	location "%{wks.location}/Libs/Vendor/%{prj.name}"

	targetdir (bin_dir .. "/Libs/Vendor/%{prj.name}")
	objdir (int_dir .. "/Libs/Vendor/%{prj.name}")

	-- Not using precompiled headers!

	files
	{
		"%{prj.location}/premake5.lua",
		"%{prj.location}/include/algorithm",
		"%{prj.location}/include/assert",
		"%{prj.location}/include/byte",
		"%{prj.location}/include/files",
		"%{prj.location}/include/gsl",
		"%{prj.location}/include/gsl.cpp",
		"%{prj.location}/include/narrow",
		"%{prj.location}/include/pointers",
		"%{prj.location}/include/span",
		"%{prj.location}/include/span_ext",
		"%{prj.location}/include/string_span",
		"%{prj.location}/include/util",
		"%{prj.location}/include/zstring",
	}

	removefiles
	{
		"%{prj.location}/premake5.lua",
	}

	includedirs
	{
		"%{IncludeDir.GSL}",
	}

	dependson
	{
		-- Nil
	}

	links
	{
		-- Nil
	}

	defines { "_LIB" }
	
	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter {}