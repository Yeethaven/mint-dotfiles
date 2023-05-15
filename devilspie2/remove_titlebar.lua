--debug_print(get_window_type());
--undecorate_window();

if (get_window_type() == "WINDOW_TYPE_NORMAL") then
	--debug_print("match!");
    undecorate_window();
end
