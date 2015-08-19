module Brim

# Dependencies
using Cairo
using Color
using DataFrames
using Logging
Logging.configure(output=open("brim.log", "a"), level=INFO)

using StatsBase

VERSION < v"0.4-dev" && import Lexicon

# Exports
export Modular,
       Q,
       Qr,
       no_empty_modules!,
       recursive_brim!,
       partition_lp,
       partition_random,
       partition_single,
       reorder_by_module!,
       draw_matrix,
       network_roles,
       null_preserve_marginals,
       null_preserve_rows_marginals

# Includes
include(joinpath(".", "Modular.jl"))
include(joinpath(".", "common.jl"))
include(joinpath(".", "Q.jl"))
include(joinpath(".", "recursive_brim.jl"))
include(joinpath(".", "partition_lp.jl"))
include(joinpath(".", "partition_random.jl"))
include(joinpath(".", "partition_single.jl"))
include(joinpath(".", "draw_matrix.jl"))
include(joinpath(".", "network_roles.jl"))
include(joinpath(".", "permutations.jl"))

end
