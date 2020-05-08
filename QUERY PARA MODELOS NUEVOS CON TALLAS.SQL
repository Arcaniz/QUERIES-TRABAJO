/*
Archivo para exportar de PROSCAI a SHOPIFY
Esta versión del 08/05/20 ya incluye el campo ICOMPOS el cual hace referencia a la sección
de composición de otros dentro de proscai
Los modelos se ordenan de mayo a menor
El query da un handle por default, si es para actualizar campos es necesario copiar el de 
shopify y reemplazarlo
*/
SELECT
CONCAT(FAM3.FAMDESCR,'-',FAM5.FAMDESCR,'-',MID(ICOD,1,9),'-','MULTICOLOR') as Handle,
IDESCR AS Title,
CONCAT('<p>',IDESCR,' ','<br><br>',ICOMPOS,'<p>HECHO EN MÉXICO</p>') as 'Body (HTML)',
IF(FAM2.FAMDESCR ='CABALLERO','CHAVOS',IF(FAM2.FAMDESCR ='DAMA','CHAVAS',FAM2.FAMDESCR)) AS Vendor,
FAM3.FAMDESCR AS 'Type',
CONCAT(MID(ICOD,1,9),',','Lo nuevo,_cf-talla-UNITALLA,_sku_config_',',',MID(ICOD,1,9),
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

WHERE ITIPO = 1 AND
/*
Aqui van todos los modelos que capturemos
*/
(ICOD='ACUOS9128' OR ICOD='ACUOR9108' OR ICOD='ACUOR9105' OR ICOD='ACUOP9112' OR ICOD='ACUOO9110' OR ICOD='ACUOO9105' OR ICOD='ACUOO9104' OR ICOD='ACUOM9201' OR ICOD='ACUOM9107' OR ICOD='ACUOM9103' OR ICOD='ACUOL9117' OR ICOD='ACUOL9115' OR ICOD='ACUOL9114' OR ICOD='ACUOI9C08' OR ICOD='ACUOF9101' OR ICOD='ACUOD9112' OR ICOD='ACUOD9111' OR ICOD='ACUOD9106' OR ICOD='ACUOD9105' OR ICOD='ACUOD9103' OR ICOD='ACUOB9201' OR ICOD='ACUOB9127' OR ICOD='ACUOA9107' OR ICOD='ACUOA9103' OR ICOD='ACUO59111' OR ICOD='ACUO59109' OR ICOD='ACUO59107' OR ICOD='ACUMU9101' OR ICOD='ACUMT9114' OR ICOD='ACUMT0101' OR ICOD='ACUMP0102' OR ICOD='ACUMN0101' OR ICOD='ACUML0101' OR ICOD='ACUMJ9P02' OR ICOD='ACUMI9C03' OR ICOD='ACUMI9C02' OR ICOD='ACUMI9C01' OR ICOD='ACUMH9403' OR ICOD='ACUMH9402' OR ICOD='ACUMH9401' OR ICOD='ACUMG9401' OR ICOD='ACUME9402' OR ICOD='ACUME0102' OR ICOD='ACUME0101' OR ICOD='ACUMD9401' OR ICOD='ACUMC9402' OR ICOD='ACUMC9401' OR ICOD='ACUMA9405' OR ICOD='ACUMA9404' OR ICOD='ACUMA9403' OR ICOD='ACUMA0102' OR ICOD='ACUMA0101' OR ICOD='ACUM29C02' OR ICOD='ACUM29401' OR ICOD='ACUM29101' OR ICOD='ACUHH9113' OR ICOD='ACUFF9405' OR ICOD='ACUEP9404' OR ICOD='ACUDT9401' OR ICOD='ACUDR9302' OR ICOD='ACUDD9305' OR ICOD='ACUCS9101' OR ICOD='ACUC79405' OR ICOD='ACUBJ9401' OR ICOD='ACUBB9403' OR ICOD='ACUBB9402' OR ICOD='ACUAC9401' OR ICOD='ACDOI9101' OR ICOD='ACDOB9102' OR ICOD='ACDAY9B01' OR ICOD='ACDAC0102' OR ICOD='ACDAB0102' OR ICOD='ACDAB0101')

GROUP BY ICOD