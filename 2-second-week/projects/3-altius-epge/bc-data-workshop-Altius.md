# bc data workshop (Altius)

# Raw .csv

[Dropbox link here](https://www.dropbox.com/s/npm5d2di0ipwvy8/promoterDHS_distalDHS_pairs.csv?dl=0)
The data points are in the form of [(promoter DHS, distal DHS), label]. Both DHSs (DNase hypersensitive site) are DNA sequences. The first column indicates the chromosome. Columns 2-3, 4-5 contain indicate the genomic interval on the chromosome (base pair indices) for the promoter and distal DHS, respectively. The last column is the class (associated or not).

# Download hg38 reference genome

We need the DNA sequence of the entire human genome to map the genomic interval of a DHS to an actual DNA sequence. Download the human genome from UCSC:

    wget http://hgdownload.cse.ucsc.edu/goldenpath/hg38/bigZips/analysisSet/hg38.analysisSet.chroms.tar.gz

Now extract the folder:

    tar -xzvf hg38.analysisSet.chroms.tar.gz

These files are in FASTA format.

# Install Julia v0.6

[Julia](https://julialang.org/) is “a new dynamic language for technical computing, designed for performance from the beginning by adapting and extending modern programming language techniques. A design based on generic functions and a rich type system simultaneously enables an expressive programming model and successful type inference, leading to good performance for a wide range of programs. This makes it possible for much of Julia’s library to be written in Julia itself, while also incorporating best-of-breed C and Fortran libraries.” [[Julia paper](https://arxiv.org/pdf/1209.5145v1.pdf)]

# Install Bio.jl

In the Julia prompt, type `Pkg.add(``"``Bio``"``)` to install the Bio Julia package that can read the FASTA files of hg38.


# Module for querying reference genome

I wrote a script `GenomeReader.jl` to facilitate you grabbing DNA sequences from the reference genome. Wherever you put the script, add this path to your  `~/.juliarcjl` file so Julia can find it. I put my script in `~/UBC/`, so I put the following line in my Julia rc file.

    push!(LOAD_PATH, homedir() * "/UBC/")

Below is the script `GenomeReader.jl` :

    module GenomeReader
    
    # dictionary keys are chromosomes, e.g. "CHR_TO_SEQ["chr1"]"
    # returns DNA sequence of chromosome 1
    export CHR_TO_SEQ
    
    using Bio.Seq
    
    # where are your FASTA files containing the DNA sequence of the human genome (hg38)
    const PATH_TO_HG38 = homedir() * "/hg38.analysisSet/"
    println("Assumes HG38 genome is present in: ", PATH_TO_HG38)
    
    # list of chromosomes
    const CHRS = ["chr1", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr2", "chr20", "chr21", "chr22", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chrM", "chrX", "chrY"]
    
    # for short, define DNAseq type for DNA sequences.
    const DNASeq = BioSequence{DNAAlphabet{4}}
    
    """
    Build a dictionary `chr_to_seq` such that, give it a chromosome, it return a sequence.
     e.g. chr_to_seq["chr1"] gives DNA sequence of chr1.
    """
    function get_chr_to_seq()
        chr_to_seq = Dict{String, DNASeq}()
    
        # loop over chromosomes, store sequence.
        for chr in CHRS
            record = first(open(FASTAReader, PATH_TO_HG38 * chr * ".fa"))
            chr_to_seq[chr] = record.seq
        end
        return chr_to_seq
    end
    
    const CHR_TO_SEQ = get_chr_to_seq()
    
    end

Now, you can query the reference genome as follows. In Julia:
`using GenomeReader`
will export a dictionary that you can access `CHR_TO_SEQ`. The keys to this dictionary are the chromosomes. It will return the DNA sequence for that chromosome. For example, `CHR_TO_SEQ[``"``chr1``"``]` will give the DNA sequence of chromosome 1.

Q: “Why am I seeing many N’s? I thought DNA was composed of A, T, C, G?”
A: The N character represents ambiguity. https://www.biostars.org/p/67068/

There is a gene for an olfactory receptor on chromosome 1 starting at 69091 and ending at position 70008.
http://www.genecards.org/cgi-bin/carddisp.pl?gene=OR4F5
To get the sequence of that gene, we can now in Julia:
`CHR_TO_SEQ[``"``chr1``"``][69091:70008]`
Voilà.

