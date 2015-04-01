dofile('xcode/xcode.lua')

local project_name = 'test-project'

solution (project_name)
configurations { 'Debug', 'Release' }


project (project_name)
	-- kind 'WindowedApp'
	kind 'ConsoleApp'
	-- kind 'SharedLib'
	-- kind 'StaticLib'

	language 'C++'

	targetdir 'bin'

	includedirs {
		'/usr/local/include'
	}

	libdirs {
		'/usr/local/lib'
	}

	links {
	}

	files {
		'src/**.c',
		'src/**.cpp'
	}

	configuration 'Debug'
		defines { 'DEBUG' }
		flags { 'Symbols' }
		targetname (project_name .. '_debug')

	configuration 'Release'
		defines { 'NDEBUG' }
		flags { 'Optimize' }
		targetname (project_name)

	configuration { 'macosx' }
		postbuildcommands { 'mkdir -p bin/data' }

	configuration { 'macosx', 'xcode*' }
		xcodebuildsettings {
			CLANG_CXX_LANGUAGE_STANDARD = 'c++0x',
			CLANG_CXX_LIBRARY = 'libc++'
		}

