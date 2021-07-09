// 序曲

// 域设置
document.domain = "heptazhou.com"

//
function clean_illegal(str) {
	/* https://github.com/xpl/printable-characters/blob/master/build/printable-characters.js v1.0.36 */
	const ansiEscapeCode = "[\u001b\u009b][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-PRZcf-nqry=><]",
		zeroWidthCharacterExceptNewline = "\u0000-\u0008\u000B-\u0019\u001b\u009b\u00ad\u200b\u2028\u2029\ufeff\ufe00-\ufe0f",
		zeroWidthCharactersExceptNewline = new RegExp("(?:" + ansiEscapeCode + ")|[" + zeroWidthCharacterExceptNewline + "]", "g")
	return str.replace(zeroWidthCharactersExceptNewline, "")
}
