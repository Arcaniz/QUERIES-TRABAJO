SELECT DNUM AS TICKET,
IEAN AS EAN,
ICOD AS MODELO,
AICANTF AS VENTA_EN_UNIDADES,
AICOSTO AS COSTO_C_IVA,
AICOSTO * AICANTF  AS COSTO_TOTAL,
AIPRECIO * 1.16 AS PRECIO_C_IVA,
AIPRECIO * AICANTF  AS PRECIO_TOTAL,
FAM3.FAMDESCR AS TIPO,
IF(FAM5.FAMDESCR='IRON MAIDEN','GLOBAL IRON MAIDEN',
IF(FAM8.FAMDESCR='GLOBAL BRANDS','GLOBAL MULTIMARCA',
IF(FAM5.FAMDESCR='EL JUEGO DEL CALAMAR',CONCAT(FAM8.FAMDESCR,' ','SQUID GAME'),
IF(FAM8.FAMDESCR='NETFLIX', CONCAT(FAM8.FAMDESCR,' ',FAM5.FAMDESCR),
IF(FAM5.FAMDESCR='PINK FLOYD','PERRYSCOPE PINK FLOYD',
IF(FAM5.FAMDESCR='AC/DC','PERRYSCOPE AC/DC',
IF(FAM5.FAMDESCR='HARRY POTTER','XPERMA',
IF(FAM5.FAMDESCR='BATMAN','XPERMA',
IF(FAM5.FAMDESCR='JOKER','XPERMA',
IF(FAM5.FAMDESCR='BATGIRL','XPERMA',
IF(FAM5.FAMDESCR='RED HOOD','XPERMA',
IF(FAM5.FAMDESCR='RAMONES','XPERMA',
IF(FAM5.FAMDESCR='FLASH','XPERMA',
IF(FAM5.FAMDESCR='SUPERMAN','XPERMA',
IF(FAM5.FAMDESCR='WONDER WOMAN','XPERMA',
IF(FAM5.FAMDESCR='SHAZAM','XPERMA',
IF(FAM5.FAMDESCR='LINTERNA VERDE','XPERMA',
IF(FAM5.FAMDESCR='HARLEY QUINN','XPERMA',
IF(FAM5.FAMDESCR='PORKY','XPERMA',
IF(FAM5.FAMDESCR='PATO LUCAS','XPERMA',
IF(FAM5.FAMDESCR='TAZ','XPERMA',
IF(FAM5.FAMDESCR='MARVIN','XPERMA',
IF(FAM5.FAMDESCR='PEPE LE PEW','XPERMA',
IF(FAM5.FAMDESCR='LOONEY TUNES','XPERMA',
IF(FAM5.FAMDESCR='BUGS BUNNY','XPERMA',
IF(FAM5.FAMDESCR='RICK AND MORTY','XPERMA',
FAM8.FAMDESCR)))))))))))))))))))))))))) AS LICENCIA,
CATDESCR AS TIENDA,
DFECHA AS FECHA,
NULL AS REGALIA,
FAM5.FAMDESCR AS PERSONAJE,
NULL AS PORCENTAJE,
CLINOM AS CLIENTE




FROM FAXINV


LEFT JOIN FDOC ON FDOC.DSEQ=FAXINV.DSEQ

LEFT JOIN FINV ON FINV.ISEQ=FAXINV.ISEQ

LEFT JOIN FCLI ON FCLI.CLISEQ=FDOC.CLISEQ

LEFT JOIN FUNIDAD ON FUNIDAD.UCOD=FINV.IUM

LEFT JOIN FALMCAT ON  FALMCAT.CATALM = FAXINV.AIALMACEN

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

WHERE (DITIPMV='F' OR DITIPMV='T' OR DITIPMV='FL' OR DITIPMV='FX' OR   DITIPMV='TL' OR DITIPMV='NL' OR DITIPMV='TC' OR DITIPMV='TD' OR DITIPMV='G' OR DITIPMV='TD')

AND DFECHA>='2019-01-01'

AND (DMULTICIA = 2 OR DMULTICIA = 3)

AND (CLIPAR8 <> '801')




