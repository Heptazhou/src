const dst = "."
const src = "../../../../Iosevnya/dist/iosevnya/woff2"
const list = [
	"thin"
	"thin-italic"
	"extralight"
	"extralight-italic"
	"light"
	"light-italic"
	"regular"
	"regular-italic"
	"medium"
	"medium-italic"
	"semibold"
	"semibold-italic"
	"bold"
	"bold-italic"
	"extrabold"
	"extrabold-italic"
	"black"
	"black-italic"
]

try
	n = 0
	for f in "iosevnya-" .* list .* ".woff2"
		cp(joinpath(src, f), joinpath(dst, f), force = true)
		n += 1
	end
	@info "完成 > $n"
catch e
	@info "错误"
	@info e
end
print("> ")
readline()

try
	run(`explorer $(src |> abspath)`)
catch
end

