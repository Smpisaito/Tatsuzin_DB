/*表示する列*/
SELECT
	/*支店コード(支店商品テーブル)*/
	office_products.branch_code,
	/*商品数*/
	COUNT(*)
/*列を引き出すテーブル*/
FROM
	(
		/*支店商品テーブル*/
		office_products
	/*結合するテーブル*/
	INNER JOIN
		/*支店テーブル*/
		branches
	/*結合条件*/
	ON
		/*支社コードの一致*/
		office_products.office_code = branches.office_code
	AND
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
	/*支店名の条件*/
	branches.branch_name
HAVING
	COUNT(*) >= 
	(
		/*表示する列*/
	SELECT
		/*商品数*/
		COUNT(*)
	/*列を引き出すテーブル*/
	FROM
		(
			/*支店商品テーブル*/
			office_products
		/*結合するテーブル*/
		INNER JOIN
			/*支店テーブル*/
			branches
		/*結合条件*/
		ON
			/*支社コードの一致*/
			office_products.office_code = branches.office_code
		AND
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
		/*支店名の条件*/
		branches.branch_name
	/*抽出後のデータのソート*/
	ORDER BY
		/*商品数で降順にする*/
		COUNT(*) DESC
	/*特定範囲を抽出する*/
	LIMIT
		/*範囲を先頭行(一番商品数の多い支店)のみ抽出する*/
		0,1
	)
;