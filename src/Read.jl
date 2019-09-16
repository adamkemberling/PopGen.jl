### GenePop parsing ###
"""
    genepop(infile::String; digits::Int64 = 3, popsep::Any = "POP", numpops::Int64)
Load a Genepop format file into memory as a PopObj object.
- `infile` : path to Genepop file
- `digits` : number of digits denoting each allele
- `popsep` : word that separates populations in `infile` (default: "POP")
- `numpops` : number of populations in `infile` (used for checking parser)
File must follow standard Genepop formatting:
- First line is a comment (and skipped)
- Loci are listed after first line as one-per-line without commas or in single comma-separated row
- A line with a particular keyword (default "POP") must delimit populations
- File is tab or space delimted

# Example

 `waspsNY = genepop("wasp_hive.gen", digits = 3, popsep = "POP", numpops = 2);`

Genepop file example:  \n
---------------------
Wasp populations in New York \n
Locus1 \n
Locus2 \n
Locus3 \n
POP \n
Oneida_01,  250230 564568 110100  \n
Oneida_02,  252238 568558 100120  \n
Oneida_03,  254230 564558 090100  \n
POP \n
Newcomb_01,  254230 564558 080100 \n
Newcomb_02,  000230 564558 090080 \n
Newcomb_03,  254230 000000 090100 \n
Newcomb_04,  254230 564000 090120 \n
---------------------
"""
function genepop(infile::String; digits::Int64 = 3, popsep::Any = "POP", numpops::Int64)
    println("\n", "Input File : ", abspath(infile))
    gpop = split(open(readlines,infile)[2:end], popsep)
    if length(gpop)-1 != numpops
        error("incorrect number of populations detected, see docstring for formatting
            expected : $numpops
            detected : $(length(gpop)-1) ")
    end
    if length(gpop[1]) == 1     # loci horizontally stacked
        locinames = strip.(split(gpop[1]|> join, ",") |> Array{String,1})
    else                        # loci vertically stacked
<<<<<<< HEAD
        locinames = replace(gpop[1], "." => "_")
=======
        locinames = gpop[1]
>>>>>>> master
    end
    d = Dict(string(i) => [] for i in locinames)
    popid = []
    indnames = []
    for i in 2:length(gpop)
        append!(popid, fill(i-1,length(gpop[i])))
        for j in 1:length(gpop[i])
            phasedloci = []
            push!(indnames, split(strip(gpop[i][j]), r"\,|\t")[1])
            unphasedloci = split(strip(gpop[i][j]), r"\s|\t")[2:end] |> Array{String,1}
            for locus in unphasedloci
<<<<<<< HEAD
                phasedlocus = parse.(Int16,[join(i) for i in Iterators.partition(locus,digits)])  |> sort |> Tuple
=======
                phasedlocus = parse.(Int64,[join(i) for i in Iterators.partition(locus,digits)])  |> sort |> Tuple
>>>>>>> master
                push!(phasedloci, phasedlocus)
            end
            for (loc,geno) in zip(locinames, phasedloci)
                push!(d[loc], geno)
            end
        end
    end
    ploidy = length.(d[locinames[1]])   # lazy finding of ploidy from single locus
<<<<<<< HEAD
    for (loc, ploid) in zip(locinames, ploidy)
        miss_geno = fill(0,ploid) |> Tuple
        replace!(d[loc], miss_geno => missing)
    end
    samples_df = DataFrame(name = string.(indnames),
                           population = categorical(popid),
                           ploidy = Int8.(ploidy),
                           longitude = fill(missing,length(indnames)),
                           latitude = fill(missing,length(indnames)))
    PopObj(samples_df, d |> DataFrame)
=======
    PopObj(indnames,popid,locinames,ploidy,d,[],[])
>>>>>>> master
end

### CSV parsing ###

"""
<<<<<<< HEAD
    csv(infile::String; delim::Union{Char,String,Regex}, digits::Int64 = 3, location::Bool = false)
=======
    csv(infile::String; delim::Union{Char,String,Regex}, digits::Int64 = 2, location::Bool = false)
>>>>>>> master
Load a CSV-type file into memory as a PopObj object
- `infile` : path to CSV file
- `delim` values can be space (" "), comma (","), tab ("\\t"), etc.
- `digits` : number of digits denoting each allele
- `location` : decimal degrees longitude/latitude provided as values 3/4
File formatting:
- Loci names must be first row
- Individuals names must be first value in row
- Population ID's must be second value in row
- [Optional] longitude (x) values third value in row, latitude (y) fourth

example: `lizardsCA = Read.csv("CA_lizards.csv", delim = ",", digits = 3);`

Formatting example:  \n
---------------------  \n
Locus1,Locus2,Locus3   \n
sierra_01,1,001001,002002,001001   \n
sierra_02,1,001001,001001,001002   \n
snbarb_03,2,001001,001001,001002 \n
snbarb_02,2,001001,001001,001001 \n
snbarb_03,2,001002,001001,001001 \n
---------------------
"""
function csv(infile::String; delim::Union{Char,String,Regex} = ",", digits::Int64 = 3, location::Bool = false)
    println("\n", "Input File : ", abspath(infile))
    popid = []
    indnames = []
    locx = []
    locy = []
    locinames = []
    d = Dict()
    linenum = 1
    open(infile) do file
        for ln in eachline(file)
            if linenum == 1
<<<<<<< HEAD
                loci_raw = split(ln, delim)
                loci_safe = replace(loci_raw, "." => "_")
                append!(locinames, loci_safe)
=======
                append!(locinames, split(ln, delim))
>>>>>>> master
                [d[string(i)] = [] for i in locinames]
                linenum += 1
                continue
            end
            if location == false
                tmp = split(ln, delim) |> Array{String,1}
                # phase genotypes by ploidy
                phasedloci = []
                for locus in tmp[3:end]
<<<<<<< HEAD
                    phasedlocus = parse.(
                        Int16,
                        [join(i) for i in Iterators.partition(locus,digits)]
                        ) |> sort |> Tuple
=======
                    phasedlocus = parse.(Int64,[join(i) for i in Iterators.partition(locus,digits)])|> Tuple
>>>>>>> master
                    push!(phasedloci, phasedlocus)
                end
                for (loc,geno) in zip(locinames, phasedloci)
                    push!(d[loc], geno)
                end
                push!(indnames, tmp[1])
                push!(popid, tmp[2])
<<<<<<< HEAD
                push!(locx, missing)
                push!(locy, missing)
=======
>>>>>>> master
            else
                tmp = split(ln, delim) |> Array{String,1}
                phasedloci = []
                for locus in tmp[5:end]
<<<<<<< HEAD
                    phasedlocus = parse.(Int16,
                        [join(i) for i in Iterators.partition(locus, digits)]
                        ) |> sort |> Tuple
=======
                    phasedlocus = parse.(Int64,[join(i) for i in Iterators.partition(locus, digits)])|> sort |> Tuple
>>>>>>> master
                    push!(phasedloci, phasedlocus)
                end
                for (loc,geno) in zip(locinames, phasedloci)
                    push!(d[loc], geno)
                end
                push!(indnames, tmp[1])
                push!(popid, tmp[2])
                push!(locx, parse.(Float64,tmp[3]))
                push!(locy, parse.(Float64,tmp[4]))
            end
        linenum += 1
        end
    end
    ploidy = length.(d[locinames[1]])   # lazy finding of ploidy from single locus
<<<<<<< HEAD
    for (loc, ploid) in zip(locinames, ploidy)
        miss_geno = fill(0,ploid) |> Tuple
        replace!(d[loc], miss_geno => missing)
    end
    samples_df = DataFrame(name = string.(indnames),
                           population = categorical(popid),
                           ploidy = Int8.(ploidy),
                           longitude = locx,
                           latitude = locy)
    PopObj(samples_df, d |> DataFrame)
end


### VCF parsing ###
"""
    vcf(infile::String)
Load a VCF file into memory as a PopObj object. Population and [optional]
location information need to be provided separately.
- `infile` : path to VCF file
"""
function vcf(infile::String)
    vcf_file = VCF.Reader(open(infile, "r"))
    # get sample names from header
    sample_names = header(vcf_file).sampleID
    # fill in pop/lat/long with missing
    population = fill(missing, length(sample_names))
    lat = fill(missing, length(sample_names))
    long = fill(missing, length(sample_names))
    ## array of genotypes
    # get loci names
    locinames = []
    d = Dict()
    # get genotypes
    for record in vcf_file
        chr_safe = replace(VCF.chrom(record), "." => "_")
        chr_safer = replace(chr_safe, "|" => "_")
        pos = VCF.pos(record) |> string
        push!(locinames, chr_safer*"_"*pos)
        geno_raw = [split(i, ('/', '|')) for i in VCF.genotype(record, :, "GT")] |> sort
        # change missing data "." to "-1"
        geno_corr_miss = [replace(i, "." => "-1") for i in geno_raw]
        # convert everything to an integer
        geno_int = [parse.(Int8, i) for i in geno_corr_miss]
        # add 1 to shift genos so 0 is 1 and -1 is 0
        geno_shift = [i .+ Int8(1) for i in geno_int]
        geno_final = [replace(i, 0 => missing) for i in geno_shift]
        geno_tuple = [Tuple(i) for i in geno_final]
        d[locinames[end]] = geno_tuple
    end
    ploidy = length.(d[locinames[1]])
    samples_df = DataFrame(name = sample_names,
                           population = population,
                           ploidy = Int8.(ploidy),
                           latitude = lat,
                           longitude = long)
    PopObj(samples_df, d |> DataFrame)
=======
    PopObj(indnames, popid, locinames, ploidy, d, locx, locy)
>>>>>>> master
end















### VCF parsing ###

#gives you genotypes of a record


for record in reader
    alleles = [VCF.ref(record)]
    if VCF.alt(record) != missing
        append!(alleles, VCF.alt)
    end
    for each in VCF.genotype(record)
        rawgeno = VCF.genotype(record, :, "GT")
        replace(rawgeno, "." => "999") # code missing as 999
        parse.(Int64, split(each[1], "/") |> Array{String,1}) |> Tuple
    end
    return
end


# check for alternative alleles
for record in reader
    aa = VCF.info(record)
    idx = findfirst(i -> i.first =="NUMALT",  aa)
    if aa[idx].second == "0"
       alleles = [VCF.ref(record)]
       println(alleles)
   else
       alleles = append!([VCF.ref(record)], VCF.alt(record))
       println(alleles)
   end
end
