const rex = "regex.txt" |> readline |> Regex
const src = "8aicyivrdlfa3sjl7ycnpb4cr.css"
const dst = "a281kmzwun1jdm9kyuk4gm78z.css"

try
	css = read(src, String)
	css = replace(css, rex => "")
	write(dst, css)
	@info "完成"
catch e
	@info "错误"
	@info e
end
length(ARGS) > 0 && exit()
print("> ")
readline()

