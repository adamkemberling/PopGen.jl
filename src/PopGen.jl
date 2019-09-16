module PopGen

##   o O       o O       o ############ O       o O       o O
## o | | O   o | | O   o |              | O   o | | O   o | | O
## | | | | O | | | | O | | Dependencies | | O | | | | O | | | | O
## O | | o   O | | o   O |              | o   O | | o   O | | o
##   O o       O o       O ############ o       O o       O o


using DataFrames, PlotlyJS, Statistics, GeneticVariation

export PopObj,
    summary,
<<<<<<< HEAD
    nancycats,
    gulfsharks,
    csv,
    genepop,
    vcf,
    sample_names,
    isolate_genotypes,
    locations,
    locations!,
    population,
    populations,
    population!,
    populations!,
=======
    csv,
    genepop,
    nancycats,
    gulfsharks,
    indnames,
    loci,
    locations,
    locations!,
    popid,
    popid!,
    genotypes,
>>>>>>> master
    remove_inds!,
    remove_loci!,
    missing,
    plot_missing,
    plot_locations



##   o O       o O       o ############ O       o O       o O
## o | | O   o | | O   o |              | O   o | | O   o | | O
## | | | | O | | | | O | |  Load files  | | O | | | | O | | | | O
## O | | o   O | | o   O |              | o   O | | o   O | | o
##   O o       O o       O ############ o       O o       O o

include("PopObj.jl")
include("Read.jl")
include("Manipulate.jl")
include("Plotting.jl")
include("Datasets.jl")


end # module PopGen