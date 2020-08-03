# Autogenerated wrapper script for Zlib_jll for x86_64-w64-mingw32
export libz

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `libz`
const libz_splitpath = ["bin", "libz.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libz_path = ""

# libz-specific global declaration
# This will be filled out by __init__()
libz_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libz = "libz.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Zlib")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libz_path = normpath(joinpath(artifact_dir, libz_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libz_handle = dlopen(libz_path)
    push!(LIBPATH_list, dirname(libz_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(vcat(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ';')

    
end  # __init__()

