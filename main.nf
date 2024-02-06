#!/usr/bin/env nextflow

params.fastas = "data/*.faa"

process TakeFirstLines {
    container 'quay.io/nextflow/bash'

    input:
    path(fasta)

    output:
    path("trimmed.faa")

    script:
    "head -n2 $fasta > trimmed.faa"
}

workflow {
    Channel.fromPath(params.fastas)
    | TakeFirstLines
    | view
}

// Mycoplasma_g

's3://scidev-testing/slas/data/*'