workspace "CSGrapgProgram"
	architecture "x64"
	startproject "Main"

	configurations {
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "vendor/glfw-3.3.8/include"

include "vendor/glfw-3.3.8"

project "Main"
	location "Main"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs {
		"%{prj.name}/src",
		"%{IncludeDir.GLFW}",
		"vendor/glew-2.2.0/include",
	}

	--for x64 use these
	libdirs { 
		"vendor/glew-2.2.0/lib/Release/x64",
	}

	links {
		"GLFW",
		"glew32",
		"opengl32.lib",
	}

	-- defines {
	-- 	"GLEW_STATIC",
	-- 	"_WIN32",
	-- }

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		
	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"

