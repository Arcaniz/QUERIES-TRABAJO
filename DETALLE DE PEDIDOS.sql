select
PENUM AS'FOLIO ODC',
CLINOM AS CLIENTE,
IEAN AS EAN,
ICOD AS MODELO,
IDESCR AS DESCRIPCION,
FAM2.FAMDESCR AS DEPARTAMENTO,
PLCANT AS PEDIDO,
PLASIGNADO AS ASIGNADO,
PLSURT AS SURTIDO,
PLPRECI AS PRECIO,
FAM1.FAMDESCR AS PROVEEDOR,
FAM3.FAMDESCR AS TIPO,
FAM4.FAMDESCR AS SUBTIPO,
FAM5.FAMDESCR AS PERSONAJE,
SUBSTRING(ICOD,1,9)AS MODELO_PADRE,
PLTIPMV AS 'TIPO DE MOVIMIENTO',
PEFECHA AS 'FECHA DE ODC',
PEDESDE AS 'FECHA INICIAL',
PEVENCE AS'FECHA LÍMITE',
PEMULTICIA AS COMPAÑIA



from FPLIN




LEFT JOIN FINV ON FINV.ISEQ=FPLIN.ISEQ

LEFT JOIN FPRV ON FPRV.PRVSEQ= FPLIN.PRVSEQ

LEFT JOIN FPENC ON FPENC.PESEQ=FPLIN.PESEQ

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
LEFT JOIN FCLI ON FCLI.CLISEQ=FPLIN.CLISEQ


WHERE (PLTIPMV ='P' OR PLTIPMV ='PO' OR PLTIPMV ='PM')


