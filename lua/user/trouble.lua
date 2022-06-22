local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	print("trouble not ok ", trouble)
	return
end

trouble.setup({})
