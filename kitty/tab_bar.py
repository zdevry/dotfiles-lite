from kitty.tab_bar import draw_title, as_rgb
from kitty.utils import color_as_int

def draw_tab(draw_data, screen, tab, before, max_tab_length, index, is_last, extra_data):
    screen.cursor.bg = as_rgb(color_as_int(draw_data.active_bg)) if tab.is_active else 0

    if draw_data.leading_spaces:
        screen.draw(' ' * draw_data.leading_spaces)
    draw_title(draw_data, screen, tab, index, max_tab_length)
    trailing_spaces = min(max_tab_length - 1, draw_data.trailing_spaces)
    max_tab_length -= trailing_spaces
    extra = screen.cursor.x - before - max_tab_length
    if extra > 0:
        screen.cursor.x -= extra + 1
        screen.cursor.x = max(screen.cursor.x, 3)
        screen.draw('…')
    if trailing_spaces:
        screen.draw(' ' * trailing_spaces)
    
    end = screen.cursor.x
    screen.cursor.bold = screen.cursor.italic = False
    screen.cursor.fg = 0
    screen.draw(draw_data.sep)
    return end
