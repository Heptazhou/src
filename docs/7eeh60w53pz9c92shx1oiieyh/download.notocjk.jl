try
	using HTTP
	const wd = mktempdir(".", prefix = "NotoCJK_", cleanup = false)
	@info "请稍候"
	url = "https://github.com/googlefonts/noto-cjk/raw/main/Sans/"
	for f in [
		"Mono/NotoSansMonoCJKsc-Regular.otf"
		"OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf"
		# "SubsetOTF/SC/NotoSansSC-Regular.otf"
	]
		HTTP.download(joinpath(url, f), f)
	end
	@info "完成 > $wd"
catch e
	@info "错误"
	@info e
end
isempty(ARGS) || exit()
print("> ")
readline()

