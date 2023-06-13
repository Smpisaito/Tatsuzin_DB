SELECT
	支店コード,
	COUNT(*) /*商品数*/
FROM
	支店テーブル
GROUP BY
	支店名
HAVING
	COUNT(*) >= 
	(
	SELECT
		COUNT(*) /*取り扱う商品数が一番多い店の商品数*/
	FROM
		支店テーブル
	GROUP BY
		支店名
	ORDER BY
		COUNT(*) DESC
	LIMIT
		0,1
	)
;