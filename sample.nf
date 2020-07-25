/*
================================
params
================================
*/

params.resultsDir = 'results/rawGenomes'
// NOTE obtain the key from NCBI portal
params.apiKey = "FIXME"

/*
================================
ids of genomes to be downloaded
================================
*/

// NOTE: add your own run-accension IDs in the array
ids = ['ERR908507']
  

/*
================================
only for publishing these files to results folder
================================
*/


process downloadRawGenomes {

    input:
    set genomeName, file(genomeReads) from Channel.fromSRA(ids, cache: true, apiKey: params.apiKey)

    script:
    
    """
    mkdir -p ../../../$params.resultsDir
    mv \$(readlink -f ${genomeReads[0]}) ../../../$params.resultsDir/
    mv \$(readlink -f ${genomeReads[1]}) ../../../$params.resultsDir/

    """


}
