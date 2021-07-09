/* https://gist.github.com/kevinyan815/f71b2f5ca3541631abd2e50f3929739b#file-base62-js v0.2.2 */

function toBaseN(num, base) {
	if (num === 0) return "0"
	var digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var len = Math.min(/* digits.length */ 62, base)
	var result = ""
	while (num > 0) {
		result = digits[num % len] + result
		num = parseInt(num / len, 10)
	}
	return result
}

function fromBaseN(str, base) {
	if (str === null || str.length === 0) return 0
	var digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var result = 0
	for (var i = 0; i < str.length; i++) {
		var p = digits.indexOf(str[i])
		if (p < 0 || p >= base) return NaN
		result += p * Math.pow(/* digits.length */ 62, str.length - i - 1)
	}
	return result
}

function toBase62(num) {
	if (num === 0) return "0"
	var digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var result = ""
	while (num > 0) {
		result = digits[num % /* digits.length */ 62] + result
		num = parseInt(num / /* digits.length */ 62, 10)
	}
	return result
}

function fromBase62(str) {
	var digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var result = 0
	for (var i = 0; i < str.length; i++) {
		var p = digits.indexOf(str[i])
		if (p < 0) return NaN
		result += p * Math.pow(/* digits.length */ 62, str.length - i - 1)
	}
	return result
}
