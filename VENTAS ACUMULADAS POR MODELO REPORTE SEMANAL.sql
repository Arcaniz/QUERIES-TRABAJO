SELECT MID(ICOD,1,9) AS 'MODELO PADRE',
MID(ICOD,1,11)AS 'MODELO COLOR', 
IF(CATDESCR='IBUSHAK/MERCADO LIBRE','MERCADO LIBRE',
IF(CATDESCR='MERCADO LIBRE TOXIC','MERCADO LIBRE',
IF(CATDESCR='MERCADO LIBRE FULL','MERCADO LIBRE',
IF(CATDESCR='AMAZON COMER','AMAZON',
IF(CATDESCR='AMAZON EN CEDIS','AMAZON',
IF(CATDESCR='ALMACEN B2B LEKRASH','SHOPIFY',
CATDESCR
)))))) AS TIENDA,
IDESCR AS DESCRIPCION,
FAM2.FAMDESCR AS DEPARTAMENTO,
FAM1.FAMDESCR AS PROVEEDOR,
FAM3.FAMDESCR AS TIPO,
FAM4.FAMDESCR AS SUBTIPO,
FAM5.FAMDESCR AS PERSONAJE,
FAM6.FAMDESCR AS TRIMESTRE,
FAM7.FAMDESCR AS DISEÑADOR,
FAM8.FAMDESCR AS LICENCIA,
FAM9.FAMDESCR AS 'TIPO DE LICENCIA',
SUM(AICANTF) AS 'VENTA EN UNIDADES',
ROUND(AVG(AICOSTO)*1.16,2) as 'COSTO PROMEDIO',
ROUND(AVG(AIPRECIO)*1.16,2) as 'PRECIO PROMEDIO',
DFECHA AS FECHA

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

AND (AIALMACEN <> 0 AND AIALMACEN <> 910  AND AIALMACEN <> 911 AND AIALMACEN <> 912 AND AIALMACEN <> 913  AND AIALMACEN <> 914 AND AIALMACEN <> 915 AND AIALMACEN <> 916 AND AIALMACEN <> 917  AND AIALMACEN <> 918 AND AIALMACEN <> 920 AND AIALMACEN <> 921 AND AIALMACEN <> 923 AND AIALMACEN <> 928)

AND ITIPO = 1


GROUP BY MID(ICOD,1,11),AIALMACEN