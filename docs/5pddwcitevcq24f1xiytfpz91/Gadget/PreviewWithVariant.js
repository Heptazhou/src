$(function () {
	// 偵測「顯示預覽」按鈕
	$("#wpPreview, input[name=wpTemplateSandboxPreview]").each(function () {
		var $this = $(this)
		// 建立菜單
		var $listVariant = (this.$listVariant = $("<select />")
			.attr("name", "listVariant_" + $this.attr("name") || "listVariant_" + $this.attr("id"))
			.attr("id", "listVariant_" + $this.attr("id") || "listVariant_" + $this.attr("name"))
			.css({
				"margin-top": "0.5em",
				"vertical-align": "middle",
			}))
		// 建立菜單選項
		;(function addVarOpt(text, variant) {
			$("<option />")
				.text(text)
				.each(function () {
					this.selected = this.defaultSelected = mw.config.get("wgUserVariant") == (this.value = variant)
				})
				.appendTo($listVariant)
			return addVarOpt
		})(wgULS("不转换", "不轉換"), "zh")("简体", "zh-hans")("繁體", "zh-hant")("大陆简体", "zh-cn")("香港繁體", "zh-hk")("澳門繁體", "zh-mo")("马来西亚简体", "zh-my")("新加坡简体", "zh-sg")("臺灣正體", "zh-tw")
		// 为了保障OOUI下button所包裹其span的功能，将button与其包裹的span作为整体去调整
		var $insertBlock = $this.parent("span")
		// 安排位置
		$("<span />")
			.css({
				"border": "1px dashed grey",
				"white-space": "nowrap",
				"padding": "0px 10px 0.5em",
				"display": "inline-block",
			})
			.append('<span style="vertical-align: -webkit-baseline-middle;">以<span />')
			.append($listVariant)
			.insertAfter($insertBlock)
			.append($insertBlock)
		// 修改預覽按鈕單擊動作
		$this.click(function () {
			// 被按下時在表單傳送字串添加variant參數
			var listVariantValue = this.$listVariant.find("option:selected").get(0).value
			mw.config.set("wgUserLanguage", listVariantValue)
			var $form = $this.parents("form")
			$form.attr(
				"action",
				$form
					.attr("action")
					.replace(/\&variant\=[^\&\?\#]*($|\&)/g, "$1")
					.replace(/\?variant\=[^\&\?\#]*(?:$|\&)/, "?")
					.replace(/\?/, "?variant=" + listVariantValue + "&")
					.replace(/\&$/, "")
			)
		})
	})
})
