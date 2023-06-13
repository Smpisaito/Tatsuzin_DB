/*表示する列*/
SELECT
	/*分類名(商品分類テーブル)*/
	product_group.group_name,
	/*商品数*/
	COUNT(*)
/*列を引き出すテーブル*/
FROM
	/*商品テーブル*/
	products
/*結合するテーブル*/
INNER JOIN
	/*商品分類テーブル*/
	product_group
/*結合条件*/
ON
	/*商品分類テーブル.商品分類コード = 商品テーブル.商品分類コード*/
	product_group.group_code = products.group_code
/*カテゴリ単位での抽出*/
GROUP BY
	/*分類名(商品分類テーブル)*/
	product_group.group_name
;