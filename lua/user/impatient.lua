local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	print("couln't load impatient: ", impatient)
	return
end

impatient.enable_profile()
