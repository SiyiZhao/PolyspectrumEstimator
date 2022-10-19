
include("Bk.jl")

@everywhere pids = workers()
@everywhere pstart = minimum(pids)
@defineat pstart fname = "Ntri_nkmax=$(nkmax)_s=$(skip).dat"
@defineat pstart f = open(fname, "w")

@everywhere begin 
    bnmesh = 100
    nkmax = 100
    skip = 1
end
@time run_Bk(bnmesh, nkmax, skip)
fetch(@spawnat pstart close(f))