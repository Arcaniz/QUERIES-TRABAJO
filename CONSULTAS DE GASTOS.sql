SELECT 
IF(DMULTICIA=1,'COMERCIALIZADORA TOXIC', IF (DMULTICIA=2,'TOXIC INDUSTRIES', IF(DMULTICIA =3,'LEKRASH','ERROR'))) AS EMPRESA,
DALMACEN AS NUM,
CATDESCR AS TIENDA,
DFECHA AS FECHA,
DDEPTO AS 'FOLIO DE GASTO',
IF(DREFERELLOS='GASTOTDA',SUM(DCANTF),0) AS MONTO



FROM FDOC




LEFT JOIN FALMCAT ON  FALMCAT.CATALM = FDOC.DALMACEN

WHERE (DITIPMV='H')

AND DDEPTO LIKE  'RT%'

AND DMULTICIA < 3

GROUP BY DALMACEN, DFECHA