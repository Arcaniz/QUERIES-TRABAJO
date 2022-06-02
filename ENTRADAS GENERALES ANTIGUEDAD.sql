SELECT MID(ICOD,1,9) AS 'MODELO PADRE', WEEK(DFECHA)+1 AS SEMANA, YEAR(DFECHA) AS AÑO, DPAR0 AS PROVEEDOR,
TIDESCR AS TIPO_MOV, IDESCR AS DESCRIPCION,FAM2.FAMDESCR AS DEPARTAMENTO,
CONCAT(FAM2.FAMDESCR,'-',FAM3.FAMDESCR) as TIPO
,FAM4.FAMDESCR AS SUBTIPO,FAM5.FAMDESCR AS PERSONAJE,
FAM6.FAMDESCR AS TRIMESTRE,FAM7.FAMDESCR AS DISEÑADOR,FAM8.FAMDESCR AS LICENCIA, FAM9.FAMDESCR AS TIPO_DE_LICENCIA,
SUM(AICANT) AS UNIDADES,AICOSTO,
FAM3.FAMDESCR AS TIPO2
FROM FAXINV


LEFT JOIN FDOC ON FDOC.DSEQ=FAXINV.DSEQ
LEFT JOIN FINV ON FINV.ISEQ=FAXINV.ISEQ
LEFT JOIN FCLI ON FCLI.CLISEQ=FDOC.CLISEQ
LEFT JOIN FUNIDAD ON FUNIDAD.UCOD=FINV.IUM
LEFT JOIN FALMCAT ON  FALMCAT.CATALM = FAXINV.AIALMACEN
LEFT JOIN FAG ON FAG.AGTNUM = FDOC.DPAR1
LEFT JOIN FTIPMV ON FTIPMV.TICLA = FDOC.DITIPMV
LEFT JOIN FFAM AS FAM1 ON FAM1.FAMTNUM=FINV.IFAM1
LEFT JOIN FFAM AS FAM2 ON FAM2.FAMTNUM=FINV.IFAM2
LEFT JOIN FFAM AS FAM3 ON FAM3.FAMTNUM=FINV.IFAM3
LEFT JOIN FFAM AS FAM4 ON FAM4.FAMTNUM=FINV.IFAM4
LEFT JOIN FFAM AS FAM5 ON FAM5.FAMTNUM=FINV.IFAM5
LEFT JOIN FFAM AS FAM6 ON FAM6.FAMTNUM=FINV.IFAM6
LEFT JOIN FFAM AS FAM7 ON FAM7.FAMTNUM=FINV.IFAM7
LEFT JOIN FFAM AS FAM8 ON FAM8.FAMTNUM=FINV.IFAM8
LEFT JOIN FFAM AS FAM9 ON FAM9.FAMTNUM=FINV.IFAM9
LEFT JOIN FFAM AS FAMA ON FAMA.FAMTNUM=FINV.IFAMA




WHERE (DITIPMV='I' OR DITIPMV='IF' OR DITIPMV='EI 'OR DITIPMV='RT' OR DITIPMV='RX' OR DITIPMV='R') AND AIALMACEN <> 302 AND AIALMACEN <> 301  AND AIALMACEN < 903 AND AIALMACEN <> 901 AND AIALMACEN < 904

AND ITIPO = 1



GROUP BY MID(ICOD,1,9),WEEK(DFECHA)

