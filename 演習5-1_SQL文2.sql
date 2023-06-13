/*表示する列*/
SELECT
	/*支社名(支社テーブル)*/
	offices.office_name,
	/*支店名(支店テーブル)*/
	branches.branch_name,
	/*商品名(商品テーブル)*/
	products.product_name
/*列を引き出すテーブル*/
FROM
	(
		(
			/*支店商品テーブル*/
			office_products
		/*結合するテーブル*/
		INNER JOIN
			/*支社テーブル*/
			offices
		/*結合条件*/
		ON
			/*それぞれの支社コードの一致*/
			office_products.office_code = offices.office_code
		)
	/*結合するテーブル*/
	INNER JOIN
		/*支店テーブル*/
		branches
	/*結合条件*/
	ON
		/*支社コードの一致*/
		office_products.office_code = branches.office_code,
		/*支店コードの一致*/
		office_products.branch_code = branches.branch_code
	)
/*結合するテーブル*/
INNER JOIN
	/*商品テーブル*/
	products
/*結合条件*/
ON
	/*商品コードの一致*/
	office_products.product_code = products.product_code
/*カテゴリ単位での抽出*/
GROUP BY
	/*支社コードの条件*/
	product_group.office_code,
	/*支店コードの条件*/
	product_group.branch_code,
	/*商品コードの条件*/
	office_products.product_code
;