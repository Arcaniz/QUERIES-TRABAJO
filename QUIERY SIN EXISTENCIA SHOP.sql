/*

Archivo para exportar de PROSCAI a SHOPIFY
Este query agrega el campo "lo nuevo"al tag para que se incluya en los modelos nuevos
Este no da las existencias que hay en sistema, se tienen que llenar manualmente
Esta versión del 08/05/20 ya incluye el campo ICOMPOS el cual hace referencia a la sección
de composición de otros dentro de proscai
Los modelos se ordenan de mayo a menor
El query da un handle por default, si es para actualizar campos es necesario copiar el de 
shopify y reemplazarlo
*/

SELECT
CONCAT(FAM3.FAMDESCR,'-',FAM5.FAMDESCR,'-',MID(ICOD,1,9),'-',IF (CATDESCR='NEGRO SNOW','GRIS',IF(CATDESCR='CARBON','GRIS',IF(CATDESCR='JASPE','GRIS',IF(CATDESCR='OXFORD','GRIS',IF(CATDESCR='REY','AZUL',IF(CATDESCR='MARINO','AZUL',IF(CATDESCR='JADE','VERDE',IF(CATDESCR='MENTA','MULTICOLOR',IF(CATDESCR='VARIOS','MULTI COLOR',CATDESCR)))))))))) as Handle,
IDESCR AS Title,
CONCAT('<p>',IDESCR,' ','<br><br>',ICOMPOS,'<p>HECHO EN MÉXICO</p>') as 'Body (HTML)',
IF(FAM2.FAMDESCR ='CABALLERO','CHAVOS',IF(FAM2.FAMDESCR ='DAMA','CHAVAS',FAM2.FAMDESCR)) AS Vendor,
FAM3.FAMDESCR AS 'Type',
CONCAT(MID(ICOD,1,9),',','_cf-talla-s,_cf-talla-m, _cf-talla-l, _cf-talla-xl,_sku_config_',',',MID(ICOD,1,9),
',',FAM8.FAMDESCR,',',IF(FAM5.FAMDESCR='HEROES DC','JUSTICE LEAGUE',FAM5.FAMDESCR),',',FAM9.FAMDESCR,',',
IF(FAM9.FAMDESCR='COMICS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='ANIME','ENTRETENIMIENTO', IF(FAM9.FAMDESCR='CARICATURAS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='PELICULAS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='VIDEO JUEGOS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='SEIERES','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='SEIERES','DEPORTES','ROCKERO'))))))),',',
FAM3.FAMDESCR,',',FAM4.FAMDESCR,',',
IF (CATDESCR='NEGRO SNOW','GRIS',IF(CATDESCR='CARBON','GRIS',IF(CATDESCR='JASPE','GRIS',IF(CATDESCR='OXFORD','GRIS',IF(CATDESCR='REY','AZUL',IF(CATDESCR='MARINO','AZUL',IF(CATDESCR='JADE','VERDE',IF(CATDESCR='MENTA','MULTICOLOR',IF(CATDESCR='VARIOS','MULTI COLOR',CATDESCR)))))))))) as Tags,
'true' as Published,
'Color' as 'Option1 Name',
IF (CATDESCR='NEGRO SNOW','GRIS',IF(CATDESCR='CARBON','GRIS',IF(CATDESCR='JASPE','GRIS',IF(CATDESCR='OXFORD','GRIS',IF(CATDESCR='REY','AZUL',IF(CATDESCR='MARINO','AZUL',IF(CATDESCR='JADE','VERDE',IF(CATDESCR='MENTA','MULTICOLOR',IF(CATDESCR='VARIOS','MULTI COLOR',CATDESCR))))))))) AS 'Option1 Value',
'Talla' as 'Option2 Name',
IF(MID(ICOD,12,13)= 'CH','S', IF(MID(ICOD,12,13)='MD','M',IF(MID(ICOD,12,13)='GD','L',IF(MID(ICOD,12,13)='EG','XL',IF(MID(ICOD,12,13)='UN','UNITALLA',MID(ICOD,12,13)))))) AS 'Option2 Value',
NULL AS 'Option3 Name',
NULL AS 'Option3 Value',
ICOD AS 'Variant SKU',
'1000' AS 'Variant Grams',
'shopify' as 'Variant Inventory Tracker',
null as 'Variant Inventory Qty',
'deny' as 'Variant Inventory Policy',
'manual' as 'Variant Fulfillment Service',
ilista1 as 'Variant Price',
null as 'Variant Compare At Price',
'true' as 'Variant Requires Shipping',
'false' as Taxable,
concat("'",iean) as 'Variant Barcode',
null as 'Image Src',
null as 'Image Position',
null as 'Image Alt Text',
null as 'Gift Card',
null as 'SEO Title',
null as 'SEO Description',
null as 'Google Shopping / Google Product Category',
null as 'Google Shopping / Gender',
null as 'Google Shopping / Age Group',
null as 'Google Shopping / MPN',
null as 'Google Shopping / AdWords Grouping',
null as 'Google Shopping / AdWords Labels',
null as 'Google Shopping / Condition',
null as 'Google Shopping / Custom Product',
null as 'Google Shopping / Custom Label 0',
null as 'Google Shopping / Custom Label 1',
null as 'Google Shopping / Custom Label 2',
null as 'Google Shopping / Custom Label 3',
null as 'Google Shopping / Custom Label 4',
null as 'Variant Image',
'kg' as 'Variant Weight Unit',
null as 'Variant Tax Code',
null as 'Cost per item',


/*
Las siguientes líneas son  de información y búsqueda
*/

MID(ICOD,1,11)AS MODELO_COLOR,

ICOD AS MODELO,
IDESCR AS DESCRIPCION

from FINV



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
LEFT JOIN FALMCAT ON FALMCAT.CATCOD = FINV.ICOLOR


WHERE ITIPO = 1 

AND (CATTIPO ='POL' OR CATTIPO ='TAL') AND

/*
Aqui van todos los modelos que capturemos
*/
(MID(ICOD,1,11)='PLCRT9301CA' OR MID(ICOD,1,11)='PLNLP9P01NE' OR MID(ICOD,1,11)='PLCMI9P01CA' OR MID(ICOD,1,11)='PLCMC9P15NE' OR MID(ICOD,1,11)='PLNLB9P01NE' OR MID(ICOD,1,11)='BLDWW9305RJ' OR MID(ICOD,1,11)='PLCBP9201NE' OR MID(ICOD,1,11)='PLCBP9101NE' OR MID(ICOD,1,11)='PLCRI9B01NE' OR MID(ICOD,1,11)='PLCBQ9P01NE' OR MID(ICOD,1,11)='PLNMS9202RJ' OR MID(ICOD,1,11)='PLNMS9201RH' OR MID(ICOD,1,11)='PLCBB9301CA' OR MID(ICOD,1,11)='PLCPP9C03NE' OR MID(ICOD,1,11)='PLCPP9C01PL' OR MID(ICOD,1,11)='PLCLN9103NE' OR MID(ICOD,1,11)='PLCRH9B02NE' OR MID(ICOD,1,11)='PLCBV9108NE' OR MID(ICOD,1,11)='PLCJA9P03NE' OR MID(ICOD,1,11)='PLCJS9102NE' OR MID(ICOD,1,11)='PLCRI9102GR' OR MID(ICOD,1,11)='PLCHH9P15NE' OR MID(ICOD,1,11)='PLCAS9P04BC' OR MID(ICOD,1,11)='PLCAB9B04TT' OR MID(ICOD,1,11)='PLCBV9105NE' OR MID(ICOD,1,11)='PLCJF9105BC' OR MID(ICOD,1,11)='PLCBV9113NE' OR MID(ICOD,1,11)='PLCJB9110NE' OR MID(ICOD,1,11)='PLCJB9B11NS' OR MID(ICOD,1,11)='PLCMA9P11NE' OR MID(ICOD,1,11)='PLCR29302UN' OR MID(ICOD,1,11)='PLCRZ0C01PL' OR MID(ICOD,1,11)='PLCMV9B01NS' OR MID(ICOD,1,11)='PLCTT9401NE' OR MID(ICOD,1,11)='PLCTT0101BC' OR MID(ICOD,1,11)='PLCSS9401CA' OR MID(ICOD,1,11)='PLCRO9401PL' OR MID(ICOD,1,11)='PLCSS9404NE' OR MID(ICOD,1,11)='PLCSS9403GO' OR MID(ICOD,1,11)='PLCSS9402NE' OR MID(ICOD,1,11)='PLCSS9408PL' OR MID(ICOD,1,11)='PLCTS9302RJ' OR MID(ICOD,1,11)='PLCTS9303NE' OR MID(ICOD,1,11)='PLCDF9301RJ' OR MID(ICOD,1,11)='PLCWI9P04NE' OR MID(ICOD,1,11)='PLCRL9B10NE' OR MID(ICOD,1,11)='PLCEK9405NE' OR MID(ICOD,1,11)='PLCTC9P01BC' OR MID(ICOD,1,11)='PLCRB9405NE' OR MID(ICOD,1,11)='PLCBB9305NE' OR MID(ICOD,1,11)='PLCRB9401NE' OR MID(ICOD,1,11)='PLCR29C11NE' OR MID(ICOD,1,11)='BLDWJ9P01NE' OR MID(ICOD,1,11)='PLCMC9B13UU' OR MID(ICOD,1,11)='PLCMS9P13RJ' OR MID(ICOD,1,11)='PLCMS9P14NE' OR MID(ICOD,1,11)='PLCWI9P02BC' OR MID(ICOD,1,11)='PLCBG0C01BC' OR MID(ICOD,1,11)='PLCNH0101SN' OR MID(ICOD,1,11)='PLCRT9401NE' OR MID(ICOD,1,11)='PLCWW9101NE' OR MID(ICOD,1,11)='BLDWS9B01NE' OR MID(ICOD,1,11)='PLCWE9401BC' OR MID(ICOD,1,11)='PLCWB9401BC' OR MID(ICOD,1,11)='PLCEA0102NE' OR MID(ICOD,1,11)='PLCEK9401NE' OR MID(ICOD,1,11)='PLCTT9403NE' OR MID(ICOD,1,11)='PLCRJ9103BC' OR MID(ICOD,1,11)='PLCRR9C01NE' OR MID(ICOD,1,11)='PLCTS9403NE' OR MID(ICOD,1,11)='PLCRV9401NE' OR MID(ICOD,1,11)='PLCMC9403MA' OR MID(ICOD,1,11)='PLCMC9402NE' OR MID(ICOD,1,11)='PLCNB9405NE' OR MID(ICOD,1,11)='PLCNB9404NE' OR MID(ICOD,1,11)='PLCMC9401MA' OR MID(ICOD,1,11)='PLCNB9402NE' OR MID(ICOD,1,11)='PLCWP9401BR' OR MID(ICOD,1,11)='PLCNS9401NE' OR MID(ICOD,1,11)='PLCNC9201NE' OR MID(ICOD,1,11)='PLCNB9401NE' OR MID(ICOD,1,11)='PLCNM9401NE' OR MID(ICOD,1,11)='PLCWG9401NS' OR MID(ICOD,1,11)='PLCW19401NE' OR MID(ICOD,1,11)='PLCWT9401NE' OR MID(ICOD,1,11)='PLCND9401NE' OR MID(ICOD,1,11)='PLCNJ9401BC' OR MID(ICOD,1,11)='PLCBB9401PL' OR MID(ICOD,1,11)='PLCRR9303JN' OR MID(ICOD,1,11)='PLCBJ9P06BC' OR MID(ICOD,1,11)='PLCRO9C01RY' OR MID(ICOD,1,11)='PLCR29C08NE' OR MID(ICOD,1,11)='PLCSS9301RY' OR MID(ICOD,1,11)='PLCMP9B07NE' OR MID(ICOD,1,11)='PLCRI9C05NE' OR MID(ICOD,1,11)='PLCMC9B12UU' OR MID(ICOD,1,11)='PLCMS9P15NE' OR MID(ICOD,1,11)='PLCMS9P12NS' OR MID(ICOD,1,11)='PLCTS9304NE' OR MID(ICOD,1,11)='PLCPA9301EN' OR MID(ICOD,1,11)='PLCDF9P01AA' OR MID(ICOD,1,11)='PLCMP9102NE' OR MID(ICOD,1,11)='PLCBP9C01NE' OR MID(ICOD,1,11)='PLCLN9B01NE' OR MID(ICOD,1,11)='PLCWV9101BC' OR MID(ICOD,1,11)='PLCRI9C04NE' OR MID(ICOD,1,11)='PLCRI9C03NE' OR MID(ICOD,1,11)='PLCRI9C01PL' OR MID(ICOD,1,11)='PLCNH9102NE' OR MID(ICOD,1,11)='PLCNH9207NE' OR MID(ICOD,1,11)='PLCBB9202BC' OR MID(ICOD,1,11)='PLCBB9203CA' OR MID(ICOD,1,11)='PLCMA9P10CA')


GROUP BY IEAN
ORDER BY  CONCAT(MID(ICOD,1,9),IF(MID(ICOD,12,13)= 'CH','1', IF(MID(ICOD,12,13)='MD','2',IF(MID(ICOD,12,13)='GD','3',IF(MID(ICOD,12,13)='EG','4',IF(MID(ICOD,12,13)='XX','5', MID(ICOD,12,13)))))))


