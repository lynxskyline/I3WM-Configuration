debug_window = true 

if get_window_class() == "Chromium" then
    set_window_geometry(0, 0, 200, 700)
end

if get_window_class() == "Com.kiwan.studioprojects" then
    set_window_geometry(0, 0, 400, 800)
end

if get_window_class() == "com.microsoft.VSCode" then
    set_window_geometry(0, 0, 1130, 700)
end

if get_window_class() == "firefox" then
    set_window_geometry(0, 0, 1315, 800)
end

if get_window_class() == "Spotify" then
    set_window_geometry(0, 0, 900, 650)
end
