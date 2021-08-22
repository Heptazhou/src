using UUIDs: uuid4

while true
	uuid = uuid4()
	uuid36 = string(uuid)

	uuid22 = string(uuid.value, base = 62, pad = 22)
	uuid25 = string(uuid.value, base = 36, pad = 25)
	uuid32 = string(uuid.value, base = 16, pad = 32)

	uuid24 = replace(uuid22, r"(.{7})" => s"\1-", count = 2)
	uuid29 = replace(uuid25, r"(.{5})" => s"\1-", count = 4)
	uuid39 = replace(uuid32, r"(.{4})" => s"\1-", count = 7)

	# occursin("", uuid25) || continue

	for u in [
		uuid22
		uuid24
		uuid25
		uuid29
		uuid32
		uuid36
		uuid39
	]
		@info "$(u |> length)  $u"
	end
	print("> ")
	readline()
end

