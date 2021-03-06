select
CONCAT(FAM3.FAMDESCR,'-',FAM5.FAMDESCR,'-',MID(ICOD,1,9),'-','MULTICOLOR') as Handle,
IDESCR AS Title,
IF(FAM3.FAMDESCR='PLAYERA',CONCAT('<p>',IDESCR,' ','<br><br>Material 100% Algodón peinado</p><p>HECHO EN MÉXICO</p>)'),
IF(FAM3.FAMDESCR='BLUSA',CONCAT('<p>',IDESCR,' ','<br><br>Material 100% Algodón peinado</p><p>HECHO EN MÉXICO</p>)'), 
IF(FAM4.FAMDESCR='CARTERA',CONCAT('<p>',IDESCR,' ','<br><br>Material Papel laminado resistente al agua</p><p>HECHO EN MÉXICO</p>)'),
IF(FAM4.FAMDESCR='COLLAR',CONCAT('<p>',IDESCR,' ','<br><br>Material Acero inoxidable</p><p>HECHO EN MÉXICO</p>)'),
IF(FAM3.FAMDESCR='SUDADERA',CONCAT('<p>',IDESCR,' ','<br><br>Material Felpa 50% y 50 % poliéster</p><p>HECHO EN MÉXICO</p>)'),
IF(FAM4.FAMDESCR='PULSERA',CONCAT('<p>',IDESCR,' ','<br><br>Material piel recuperada</p><p>HECHO EN MÉXICO</p>'),
IF(FAM4.FAMDESCR='PATINETA',CONCAT('<p>',IDESCR,' ','<br><br>7 Capas de maple canadiense</p><p>HECHO EN MÉXICO</p>)'),
CONCAT('<p>',IDESCR,' ','<br><br>Material 100% Algodón peinado</p><p>HECHO EN MÉXICO</p>)')))))))) as 'Body (HTML)',


IF(FAM2.FAMDESCR ='CABALLERO','CHAVOS',IF(FAM2.FAMDESCR ='DAMA','CHAVAS',FAM2.FAMDESCR)) AS Vendor,
FAM3.FAMDESCR AS 'Type',
CONCAT(MID(ICOD,1,9),',','_cf-talla-UNITALLA,_sku_config_',',',MID(ICOD,1,9),
',',FAM8.FAMDESCR,',',IF(FAM5.FAMDESCR='HEROES DC','JUSTICE LEAGUE',FAM5.FAMDESCR),',',FAM9.FAMDESCR,',',
IF(FAM9.FAMDESCR='COMICS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='ANIME','ENTRETENIMIENTO', IF(FAM9.FAMDESCR='CARICATURAS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='PELICULAS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='VIDEO JUEGOS','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='SEIERES','ENTRETENIMIENTO',IF(FAM9.FAMDESCR='SEIERES','DEPORTES','ROCKERO'))))))),',',
FAM3.FAMDESCR,',',FAM4.FAMDESCR,',',
'MULTICOLOR') as Tags,

'true' as Published,
'Color' as 'Option1 Name',
'MULTICOLOR' as 'Option1 Value',
'Talla' as 'Option2 Name',
'UNITALLA' AS 'Option2 Value',
NULL AS 'Option3 Name',
NULL AS 'Option3 Value',
ICOD AS 'Variant SKU',
'1000' AS 'Variant Grams',
'shopify' as 'Variant Inventory Tracker',
ROUND(ALMCANT,0) as 'Variant Inventory Qty',
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
MID(ICOD,1,11)AS MODELO_COLOR,
ICOD AS MODELO,
IDESCR AS DESCRIPCION
from FINV


LEFT JOIN FALM ON FALM.ISEQ = FINV.ISEQ
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

WHERE ITIPO = 1 AND (CATTIPO ='POL' OR CATTIPO ='TAL') AND ALMNUM = 905
AND ICOD='ACUTT0205'
GROUP BY ICOD