using Base.CoreLogging: @logmsg, Info, Warn
using UUID4

while true
	print("> ")
	input_fmt = 0
	id = try
		r = uuid_parse(replace(readline(), r"\s" => ""))
		input_fmt = r[1]
		uuid_string(r[2])
	catch
		uuid_string()
	end
	# while !occursin("", id[]) id = uuid_string() end
	for i in uuid_formats()
		len = length(id[i])
		msg = "$(lpad(len, 3)) $(i == input_fmt ? "<<" : "  ") $(id[i])"
		@logmsg i == len ? Info : Warn msg
	end
end

