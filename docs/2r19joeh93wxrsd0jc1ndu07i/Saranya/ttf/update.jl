const dst = "."
const src = "../../../../../Saranya/dist/ttf"
const list = [
	"regular"
	"regular-italic"
	"bold"
	"bold-italic"
]

try
	n = 0
	for f in "saranya-mono-sc-" .* list .* ".ttf"
		cp(joinpath.([src, dst], f)..., force = true)
		n += 1
	end
	@info "完成 > $n"
catch e
	@info "错误"
	@info e
end
isempty(ARGS) || exit()
print("> ")
readline()

try
	run(`explorer $(src |> abspath)`)
catch
end

