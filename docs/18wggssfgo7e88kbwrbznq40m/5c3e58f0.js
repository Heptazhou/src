// 尾声

// a, area
function set_ifnull_rel_target(selector) {
	var list = document.querySelectorAll(selector)
	var chars = "./#"
	for (var i = 0; i < list.length; i++) {
		var elem = list[i]
		var href = elem.getAttribute("href")
		if (href == null) continue
		href = href.trim()
		if (href != "" && !href.startsWith("javascript:") && !chars.includes(href[0])) {
			if (elem.getAttribute("rel") == null) elem.rel = "noopener"
			if (elem.getAttribute("target") == null) elem.target = "_blank"
		}
	}
}
set_ifnull_rel_target("a")
set_ifnull_rel_target("area")

// img
function set_ifnoalt_onerror(selector) {
	var list = document.querySelectorAll(selector)
	for (var i = 0; i < list.length; i++) {
		var elem = list[i]
		if (elem == null) continue
		if (elem.alt == "")
			elem.onerror = function () {
				this.style.display = "none"
			}
	}
}
set_ifnoalt_onerror("img")

// url
/* https://github.com/the1812/Bilibili-Evolved/blob/master/min/url-params-clean.min.js */
function url_clean() {
	const a = ["__cf_chl_captcha_tk__", "__cf_chl_jschl_tk__"]
	const b = (i) => i
	const c = location.search.substring(1).split("&")
	const d = c.filter((j) => (a.some((k) => j.startsWith(`${k}=`)) ? false : true))
	const e = d.join("&")
	const f = b(document.URL.replace(location.search, ""))
	const g = e ? "?" + e : ""
	const h = f + g
	if (h !== document.URL) history.replaceState({}, document.title, h)
}
url_clean()
