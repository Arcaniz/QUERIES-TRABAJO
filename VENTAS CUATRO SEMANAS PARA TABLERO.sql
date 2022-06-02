

SELECT IEAN AS EAN,
ICOD AS MODELO,
IDESCR AS DESCRIPCION,
FAM2.FAMDESCR AS DEPARTAMENTO,
AICANTF AS VENTA_EN_UNIDADES,
AICOSTO AS COSTO,
AICOSTO * AICANTF AS COSTO_TOTAL,
AIPRECIO AS PRECIO,AIPRECIO * AICANTF AS PRECIO_TOTAL,
FAM1.FAMDESCR AS PROVEEDOR,
FAM3.FAMDESCR AS TIPO,
FAM4.FAMDESCR AS SUBTIPO,
FAM5.FAMDESCR AS PERSONAJE,
FAM6.FAMDESCR AS TRIMESTRE,
FAM7.FAMDESCR AS DISEÑADOR,
FAM8.FAMDESCR AS LICENCIA,
FAM9.FAMDESCR AS TIPO_DE_LICENCIA,
IF(CATDESCR='IBUSHAK/MERCADO LIBRE','MERCADO LIBRE',
IF(CATDESCR='MERCADO LIBRE TOXIC','MERCADO LIBRE',
IF(CATDESCR='MERCADO LIBRE FULL','MERCADO LIBRE',
IF(CATDESCR='AMAZON COMER','AMAZON',
IF(CATDESCR='AMAZON EN CEDIS','AMAZON',
IF(CATDESCR='ALMACEN B2B LEKRASH','SHOPIFY',
IF(CATDESCR='ALMACEN PRIVALIA','CEDIS',
IF(CATDESCR='BODEGA COMERCIALIZADORA TOXIC','CEDIS',
IF(CATDESCR='BODEGA TOXIC INDUSTRIES','CEDIS',
IF(CATDESCR='MIXUP','CEDIS',
IF(CATDESCR='MIXUP EN CEDIS','CEDIS',
IF(CATDESCR='SALVAJE TENTACION','CEDIS',
IF(CATDESCR='MORGAN','CEDIS',
CATDESCR
))))))))))))) AS TIENDA,
DFECHA AS FECHA, 
CATCONTACTO AS CLASIFICA_ALMACEN,
SUBSTRING(ICOD,1,9)AS MODELO_PADRE,
CONCAT(FAM2.FAMDESCR,'-',FAM3.FAMDESCR) AS CONCATENADO




FROM FAXINV


LEFT JOIN FDOC ON FDOC.DSEQ=FAXINV.DSEQ
LEFT JOIN FINV ON FINV.ISEQ=FAXINV.ISEQ
LEFT JOIN FCLI ON FCLI.CLISEQ=FDOC.CLISEQ
LEFT JOIN FUNIDAD ON FUNIDAD.UCOD=FINV.IUM
LEFT JOIN FALMCAT ON  FALMCAT.CATALM = FDOC.DALMACEN
LEFT JOIN FAG ON FAG.AGTNUM = FDOC.DPAR1
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

WHERE (DITIPMV='F' OR DITIPMV='T' OR DITIPMV='FL' OR DITIPMV='FX'OR  DITIPMV='TD'OR DITIPMV='TL'OR DITIPMV='TC')


AND (AIALMACEN <> 0
AND AIALMACEN <> 910  
AND AIALMACEN <> 911 
AND AIALMACEN <> 912 
AND AIALMACEN <> 913 
AND AIALMACEN <> 914 
AND AIALMACEN <> 915 
AND AIALMACEN <> 916 
AND AIALMACEN <> 917  
AND AIALMACEN <> 918 
AND AIALMACEN <> 920 
AND AIALMACEN <> 921 
AND AIALMACEN <> 923 
AND AIALMACEN <> 928 
AND AIALMACEN <> 929 
AND AIALMACEN <> 930 
AND AIALMACEN <> 933 
AND AIALMACEN <> 934
AND AIALMACEN <> 936)

 AND DFECHA>='2021-11-22' AND DFECHA<='2021-12-19'

AND CATCOD =''
