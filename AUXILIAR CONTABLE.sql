
-- VERSIÓN PROBADA Y FUNCIONAL, SUBIDA A CUBOS
SELECT
BCOD AS CUENTA,
BNOMBRE AS NOMBRE_CUENTA,
   PODESCR AS CONCEPTO,
   BATIP AS TM,
   BAOK AS OK, 
   POFAMILIA AS FAMILIA,
    POCHEQUE AS CHEQUE,
    PONUM AS POLIZA,
      BACENCOS AS CENTRO_COSTOS,
    POBENEF AS BENEFICIARIO,
    POCIA AS CIA,
    POUSR AS USR,
    BABENEF AS REFER,
   POFECHA AS FECHA,
  FPOLIZA.POSEQ AS CONSECUTIVO,
     BAIMPORNEG AS ABONOS,
    BAIMPOR AS CARGOS
    
     
    
FROM
    fbenc
        LEFT JOIN
    FBANMOV ON FBANMOV.BSEQ = FBENC.BSEQ
        LEFT JOIN
    FPOLIZA ON FPOLIZA.POSEQ = FBANMOV.POSEQ
WHERE
    POCIA <=3