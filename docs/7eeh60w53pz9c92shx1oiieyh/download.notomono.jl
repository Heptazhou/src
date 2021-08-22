try
	using HTTP
	const wd = mktempdir(".", prefix = "NotoMono_", cleanup = false)
	@info "请稍候"
	baseurl = "https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSansMono/"
	for f in [
		# "NotoSansMono-Black.ttf",
		# "NotoSansMono-Bold.ttf",
		# "NotoSansMono-Condensed.ttf",
		# "NotoSansMono-CondensedBlack.ttf",
		# "NotoSansMono-CondensedBold.ttf",
		# "NotoSansMono-CondensedExtraBold.ttf",
		# "NotoSansMono-CondensedExtraLight.ttf",
		# "NotoSansMono-CondensedLight.ttf",
		# "NotoSansMono-CondensedMedium.ttf",
		# "NotoSansMono-CondensedSemiBold.ttf",
		# "NotoSansMono-CondensedThin.ttf",
		# "NotoSansMono-ExtraBold.ttf",
		# "NotoSansMono-ExtraCondensed.ttf",
		# "NotoSansMono-ExtraCondensedBlack.ttf",
		# "NotoSansMono-ExtraCondensedBold.ttf",
		# "NotoSansMono-ExtraCondensedExtraBold.ttf",
		# "NotoSansMono-ExtraCondensedExtraLight.ttf",
		# "NotoSansMono-ExtraCondensedLight.ttf",
		# "NotoSansMono-ExtraCondensedMedium.ttf",
		# "NotoSansMono-ExtraCondensedSemiBold.ttf",
		# "NotoSansMono-ExtraCondensedThin.ttf",
		# "NotoSansMono-ExtraLight.ttf",
		# "NotoSansMono-Light.ttf",
		# "NotoSansMono-Medium.ttf",
		"NotoSansMono-Regular.ttf",
		# "NotoSansMono-SemiBold.ttf",
		# "NotoSansMono-SemiCondensed.ttf",
		# "NotoSansMono-SemiCondensedBlack.ttf",
		# "NotoSansMono-SemiCondensedBold.ttf",
		# "NotoSansMono-SemiCondensedExtraBold.ttf",
		# "NotoSansMono-SemiCondensedExtraLight.ttf",
		# "NotoSansMono-SemiCondensedLight.ttf",
		# "NotoSansMono-SemiCondensedMedium.ttf",
		# "NotoSansMono-SemiCondensedSemiBold.ttf",
		# "NotoSansMono-SemiCondensedThin.ttf",
		# "NotoSansMono-Thin.ttf",
	]
		HTTP.download(joinpath(baseurl, f), f)
	end
	baseurl = "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/otf/NotoSansMono/"
	for f in [
		# "NotoSansMono-Black.otf",
		# "NotoSansMono-Bold.otf",
		# "NotoSansMono-Condensed.otf",
		# "NotoSansMono-CondensedBlack.otf",
		# "NotoSansMono-CondensedBold.otf",
		# "NotoSansMono-CondensedExtraBold.otf",
		# "NotoSansMono-CondensedExtraLight.otf",
		# "NotoSansMono-CondensedLight.otf",
		# "NotoSansMono-CondensedMedium.otf",
		# "NotoSansMono-CondensedSemiBold.otf",
		# "NotoSansMono-CondensedThin.otf",
		# "NotoSansMono-ExtraBold.otf",
		# "NotoSansMono-ExtraCondensed.otf",
		# "NotoSansMono-ExtraCondensedBlack.otf",
		# "NotoSansMono-ExtraCondensedBold.otf",
		# "NotoSansMono-ExtraCondensedExtraBold.otf",
		# "NotoSansMono-ExtraCondensedExtraLight.otf",
		# "NotoSansMono-ExtraCondensedLight.otf",
		# "NotoSansMono-ExtraCondensedMedium.otf",
		# "NotoSansMono-ExtraCondensedSemiBold.otf",
		# "NotoSansMono-ExtraCondensedThin.otf",
		# "NotoSansMono-ExtraLight.otf",
		# "NotoSansMono-Light.otf",
		# "NotoSansMono-Medium.otf",
		"NotoSansMono-Regular.otf",
		# "NotoSansMono-SemiBold.otf",
		# "NotoSansMono-SemiCondensed.otf",
		# "NotoSansMono-SemiCondensedBlack.otf",
		# "NotoSansMono-SemiCondensedBold.otf",
		# "NotoSansMono-SemiCondensedExtraBold.otf",
		# "NotoSansMono-SemiCondensedExtraLight.otf",
		# "NotoSansMono-SemiCondensedLight.otf",
		# "NotoSansMono-SemiCondensedMedium.otf",
		# "NotoSansMono-SemiCondensedSemiBold.otf",
		# "NotoSansMono-SemiCondensedThin.otf",
		# "NotoSansMono-Thin.otf",
	]
		HTTP.download(joinpath(baseurl, f), f)
	end
	@info "完成 > $wd"
catch e
	@info "错误"
	@info e
end
readline()
