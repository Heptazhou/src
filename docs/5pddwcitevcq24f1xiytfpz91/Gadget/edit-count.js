;(function (ele, txt, time, condition) {
	var s = " (" + mw.config.values.wgUserEditCount + ")"
	var hook = document.getElementById("pt-mycontris")
	if (!hook) return "unexpected dom abort mission"
	hook.childNodes[0].innerHTML += s
	if (!condition) return
	ele.innerHTML = ""
	;(function (ele, txt, time) {
		txt = txt.split("")
		var len = txt.length,
			rate = time / len
		for (var i = 0; i < len; i++)
			setTimeout(function () {
				ele.innerHTML += txt.shift()
			}, i * rate)
	})(ele, txt, time)
})(document.getElementById("edit_count"), "2018.5.1 / ab9", 400, document.getElementById("8c23b4144bd58c689e192c6ab912a3b75c76f6849977518b8bedefd5e347d67f"))
