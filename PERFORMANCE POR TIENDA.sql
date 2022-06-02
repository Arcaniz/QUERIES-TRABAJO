SELECT
ICOD AS MODELO,
DFECHA AS FECHA,
SUM(AICANTF) AS 'VENTA EN UNIDADES',
CATDESCR AS TIENDA

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


WHERE (DITIPMV='F' OR DITIPMV='T' OR DITIPMV='FL' OR DITIPMV='FX' OR   DITIPMV='TL' OR DITIPMV='NL' OR DITIPMV='TC' OR DITIPMV='TD')

AND (AIALMACEN <> 0 AND AIALMACEN <> 910  AND AIALMACEN < 911 AND AIALMACEN <> 912
AND AIALMACEN <> 913  AND AIALMACEN <> 914 AND AIALMACEN <> 915 AND AIALMACEN <> 916 AND AIALMACEN <> 917  AND AIALMACEN <> 918 AND AIALMACEN <> 920 AND AIALMACEN <> 921 AND AIALMACEN <> 928 AND AIALMACEN <> 928)

AND ITIPO = 1

AND DFECHA>='2021-03-01' AND DFECHA<='2021-09-18'

AND CATDESCR = 'UAM-I'

GROUP BY ICOD, DFECHA, AIALMACEN