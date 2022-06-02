SELECT
AGNUM AS NUMERO_AGENTE,
AGDESCR AS VENDEDOR,DFECHA AS FECHA,
DALMACEN AS 'NUMERO DE TIENDA',
CATDESCR AS TIENDA,
SUM(AICANTF) AS PIEZAS,
SUM(ROUND(AICANTF*AIPRECIO,2)) AS 'PRECIO SIN IVA',
SUM(ROUND((AICANTF*AIPRECIO)+(IF(IPORCIVA=0,(AICANTF*AIPRECIO)*((DPORCIVA/100)),0)),2)) AS 'PRECIO CON IVA',
COUNT(DISTINCT DNUM) AS TICKETS_TOTALES,
AGPUESTO AS PUESTO,
AGOBS AS TIENDA_ORIGEN





FROM FAXINV


LEFT JOIN FDOC ON FDOC.DSEQ=FAXINV.DSEQ

LEFT JOIN FINV ON FINV.ISEQ=FAXINV.ISEQ

LEFT JOIN FCLI ON FCLI.CLISEQ=FDOC.CLISEQ

LEFT JOIN FUNIDAD ON FUNIDAD.UCOD=FINV.IUM

LEFT JOIN FALMCAT ON  FALMCAT.CATALM = FDOC.DALMACEN

LEFT JOIN FAG ON FAG.AGTNUM = FDOC.DPAR1

WHERE DITIPMV='T' AND (DFECHA>='2020-03-01' AND DFECHA<='2020-03-23')

GROUP BY DALMACEN, DFECHA, AGDESCR