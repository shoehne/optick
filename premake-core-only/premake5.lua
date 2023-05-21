project "OptickCore"
    language "C++"
    location "./"
    flags {

        "NoManifest",
        "FatalWarnings"
    }
    warnings "Extra"
    symbols "On"
    kind "SharedLib"

    targetdir ("bin/" .. output_dir .. "/%{prj.name}")
    objdir ("bin-obj/" .. output_dir .. "/%{prj.name}")

    defines { 
        "_CRT_SECURE_NO_WARNING",
        "OPTICK_LIB=!",
        "OPTICK_EXPORTS"
    }

    includedirs {

        "../src"
    }

    files {

        "../src/**.cpp",
        "../src/**.h"
    }

    vpaths {
        ["api"] = {

            "src/optick.h",
            "src/optick.config.h"
        }
    }

    filter "system:windows"
        systemversion "latest"

        targetdir ("../../../bin/" .. output_dir .. "/%{prj.name}_win")
        objdir ("../../../bin-obj/" .. output_dir .. "/%{prj.name}_win")
        
        links {

            "d3d12",
            "dxgi"
        }
        defines {

            "OPTICK_ENABLE_GPU_VULKAN=0"
        }