select CLICOD,CLINOM, AFECHA, ACANT,AREFPAG,  DCFDIUUID AS UUID from fax
LEFT JOIN FDOC ON FDOC.DSEQ= FAX.DSEQ
LEFT JOIN FCLI ON FCLI.CLISEQ = FAX.CLISEQ
where arefpag <> ''
and atipmv = 'PA'