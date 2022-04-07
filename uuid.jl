using Base.CoreLogging: @logmsg, Info, Warn
using UUID4

while true
	print("> ")
	input_fmt = 0
	str = replace(readline(), r"\s" => "")
	id = try
		r = uuid_parse(str)
		input_fmt = r[1]
		uuid_string(r[2])
	catch
		uuid_string()
	end
	# while !occursin("", id[]) id = uuid_string() end
	for i in uuid_formats()
		len = length(id[i])
		@logmsg i == len ? Info : Warn "$(lpad(len, 3)) $(i == input_fmt ? "<<" : "  ") $(id[i])"
	end
end

