/*
================================
params
================================
*/

params.resultsDir = 'results/rawGenomes'
params.apiKey = "FIXME"

/*
================================
ids of genomes to be downloaded
================================
*/


ids = ['ERR908507']
  

/*
================================
only for publishing these files to results folder
================================
*/


process downloadRawGenomes {
echo true


    input:
    set genomeName, file(genomeReads) from Channel.fromSRA(ids, cache: true, apiKey: params.apiKey)

    script:
    
    """
    mkdir -p ../../../$params.resultsDir
    mv \$(readlink -f ${genomeReads[0]}) ../../../$params.resultsDir/
    mv \$(readlink -f ${genomeReads[1]}) ../../../$params.resultsDir/

    """


}
