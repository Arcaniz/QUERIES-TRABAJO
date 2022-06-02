SELECT
"11" as SEMANA_RETAIL,
CATDESCR AS TIENDA,
ROUND(SUM(AIPRECIO * AICANTF * 1.16),2) AS REAL_VENTA,
COUNT(DISTINCT DNUM) AS TICKETS_TOTALES,
SUM(AICANTF) AS PRENDAS_TOTALES







FROM FAXINV


LEFT JOIN FDOC ON FDOC.DSEQ=FAXINV.DSEQ

LEFT JOIN FINV ON FINV.ISEQ=FAXINV.ISEQ

LEFT JOIN FCLI ON FCLI.CLISEQ=FDOC.CLISEQ

LEFT JOIN FUNIDAD ON FUNIDAD.UCOD=FINV.IUM

LEFT JOIN FALMCAT ON  FALMCAT.CATALM = FDOC.DALMACEN

LEFT JOIN FAG ON FAG.AGTNUM = FDOC.DPAR1

WHERE DITIPMV='T' AND (DFECHA>='2020-03-15' AND DFECHA<='2020-03-21')

GROUP BY DALMACEN