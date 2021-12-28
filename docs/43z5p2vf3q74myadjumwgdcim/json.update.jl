const src = "v2n-routing.jsonc"
const dst = "v2n-routing.json"

try
	@info "正在更新"
	json = read(src, String)
	json = replace(json, r"^\s*//.*\n"m => "", r",\K\n" => " ", r"(^\t+|\n)"m => "") * "\n"
	write(dst, json)
	@info "完成"
catch e
	@info "错误"
	@info e
end
length(ARGS) > 0 && exit()
print("> ")
readline()

