SELECT
'Inventario' AS clas,
IEAN AS EAN,
ICOD AS MODELO,
IDESCR AS DESCRIPCION,
FAM2.FAMDESCR AS DEPARTAMENTO,
(ALMCANT-ALMASIGNADO)  AS pzas,
IF(CATMULTICIA = 1, ILISTA8,IF(CATMULTICIA=2, ILISTA5,IF (CATMULTICIA=3,ILISTA3, IF (CATMULTICIA=4,ILISTA2,ILISTA2))))  AS COSTO,
IF(CATMULTICIA = 1, ILISTA8*ALMCANT,IF(CATMULTICIA=2, ILISTA5*ALMCANT,IF (CATMULTICIA=3,ILISTA3*ALMCANT, IF (CATMULTICIA=4,ILISTA2*ALMCANT,ILISTA2*ALMCANT))))AS COSTO_TOTAL,
ILISTA1 / 1.16 AS PRECIO,
ILISTA1  AS 'Precio con IVA',
(ILISTA1 / 1.16)*ALMCANT AS PRECIO_TOTAL,
ILISTA1 * ALMCANT AS 'Precio Total con iva',
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
CATDESCR
)))))) AS TIENDA,
CURDATE() AS FECHA,
CATCONTACTO  AS  CLASIFICA_ALMACEN,
IF(ALMNUM < 100, "BOUTIQUES", IF(ALMNUM <303,"MAYOREO" ,IF(ALMNUM <503,"FRANQUICIAS", IF(ALMNUM =909,"B2C",IF(ALMNUM =905,"B2B",IF(ALMNUM =925,"B2B",IF(ALMNUM =919,"AMAZON",'VENTA BODEGAS'))))))) AS 'Canal de venta',
SUBSTRING(ICOD,1,9)AS MODELO_PADRE,
FAM2.FAMDESCR AS 'NUEVO DEPTO',
FAM3.FAMDESCR AS 'NUEVO TIPO',
FAMA.FAMDESCR AS OFERTA,
IF(FAMA.FAMDESCR='SIN OFERTA','Linea','Rebaja') as 'Tabla de acción'
from FINV

LEFT JOIN FALM ON FALM.ISEQ = FINV.ISEQ
LEFT JOIN FALMCAT ON  FALMCAT.CATALM = FALM.ALMNUM
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

WHERE ALMCANT <> 0

AND (ALMNUM<> 501 AND ALMNUM<> 0 AND ALMNUM <> 910 AND ALMNUM<> 911 AND ALMNUM<> 912 AND ALMNUM<> 913 AND ALMNUM<> 914 AND ALMNUM<> 915 AND ALMNUM< 928)

AND ITIPO = 1


