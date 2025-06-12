from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class redblack(ColorScheme):
    progress_bar_color = red

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        if context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal

            if context.directory:
                fg = yellow
                attr |= bold

            elif context.link:
                fg = yellow
                attr |= bold

            elif context.executable and not context.directory:
                fg = green
                attr |= bold

            elif context.file and hasattr(context.file, "basename") and context.file.basename.lower().endswith(('.zip', '.tar', '.gz', '.7z', '.rar', '.xz')):
                fg = red
                attr |= bold

            else:
                fg = white

            if context.marked:
                fg = magenta
                attr |= bold

            if context.badinfo:
                fg = red

        elif context.in_titlebar:
            fg = red
            attr |= bold

        elif context.in_statusbar:
            fg = red
            attr |= bold

        if context.text and context.highlight:
            attr |= reverse

        if context.in_taskview and context.title:
            fg = red

        return fg, bg, attr
