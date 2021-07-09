$(function () {
	$("a.external")
		.filter(function (idx) {
			var h = ("" + $(this).attr("href")).split("/")
			if (h.length < 3) return false
			if (h[2] == location.host) return false
			return true
		})
		.attr("target", "_blank")
})
