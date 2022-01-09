using Base.CoreLogging: @logmsg
using Base.CoreLogging: Info
using Base.CoreLogging: Warn
using Match
using UUIDs: UUID
using UUIDs: uuid4

function uuid_parse(str::String; fmt::Int = 0)::Tuple{Int, UUID}
	len = length(str)
	fmt == 0 || fmt == len || error("Invalid id `$str` with length = $len (should be $fmt)")
	@match len begin
		24 => (24, uuid_parse(replace.(str, "-" => ""), fmt = 22)[2])
		29 => (29, uuid_parse(replace.(str, "-" => ""), fmt = 25)[2])
		39 => (39, uuid_parse(replace.(str, "-" => ""), fmt = 32)[2])
		22 => (22, UUID(parse(UInt128, str, base = 62)))
		25 => (25, UUID(parse(UInt128, str, base = 36)))
		32 => (32, UUID(parse(UInt128, str, base = 16)))
		36 => (36, UUID(str))
		_  => (-1, error("Invalid id `$str` with length = $len"))
	end
end
function uuid_new(uuid::UUID = uuid4())::Dict{Int, String}
	id36 = string(uuid)
	id22 = string(uuid.value, base = 62, pad = 22)
	id25 = string(uuid.value, base = 36, pad = 25)
	id32 = string(uuid.value, base = 16, pad = 32)
	id24 = replace(id22, r"(.{7})" => s"\1-", count = 2)
	id29 = replace(id25, r"(.{5})" => s"\1-", count = 4)
	id39 = replace(id32, r"(.{4})" => s"\1-", count = 7)
	Dict(22 => id22, 24 => id24, 25 => id25, 29 => id29, 32 => id32, 36 => id36, 39 => id39)
end

while true
	print("> ")
	inpfmt = 0
	str = replace(readline(), r"\s" => "")
	id = try
		r = uuid_parse(str)
		inpfmt = r[1]
		uuid_new(r[2])
	catch
		uuid_new()
	end
	# while !occursin("", id[]) id = uuid_new() end
	for i in [22, 24, 25, 29, 32, 36, 39]
		len = length(id[i])
		@logmsg i == len ? Info : Warn "$(lpad(len, 3)) $(i == inpfmt ? "<<" : "  ") $(id[i])"
	end
end

