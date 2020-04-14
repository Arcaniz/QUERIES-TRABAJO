SELECT 
CONCAT(FAM3.FAMDESCR,'S') as TIPO,
ROUND(SUM(AICANTF),0) AS VENTA_EN_UNIDADES


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


WHERE (DITIPMV='F' OR DITIPMV='T' OR DITIPMV='FL' OR DITIPMV='FK'OR DITIPMV='FX'OR DITIPMV='FT'OR DITIPMV='G' OR  DITIPMV='TD'OR DITIPMV='NL'OR DITIPMV='TC') 
AND DFECHA>='2020-03-01' AND DFECHA<='2020-03-31'
AND DMULTICIA=1 AND FAM8.FAMDESCR  ='BRAVADO'

GROUP BY FAM3.FAMDESCR