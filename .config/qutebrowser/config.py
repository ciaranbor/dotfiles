config.load_autoconfig(False)

# ui
config.source("gruvbox.py")
c.colors.webpage.preferred_color_scheme = "dark"
c.completion.shrink = True
c.completion.use_best_match = True
c.downloads.position = "top"
c.downloads.remove_finished = 2000
c.statusbar.widgets = ["progress", "keypress", "url", "history"]
c.scrolling.bar = "never"
c.scrolling.smooth = True
c.tabs.position = "top"
c.tabs.title.format = "{index}: {audio}{current_title}"
c.tabs.title.format_pinned = "{index}: {audio}{current_title}"

# general
c.auto_save.session = True
c.content.default_encoding = "utf-8"
c.content.pdfjs = True
c.editor.command = ["kitty", "kak", "-e", "exec {line}g{column0}l", "{}"]
c.fileselect.handler = "external"
c.fileselect.single_file.command = ["kitty", "sh", "-c", "xplr > {}"]
c.fileselect.multiple_files.command = ["kitty", "sh", "-c", "xplr > {}"]
c.downloads.location.prompt = False
c.input.insert_mode.auto_load = True
c.spellcheck.languages = ["en-GB"]
c.tabs.last_close = "close"
c.tabs.mousewheel_switching = False
c.qt.args += [
    "enable-gpu-rasterization",
    "blink-settings=preferredColorScheme=1",
]
c.qt.highdpi = True

# privacy
c.content.cookies.accept = "no-3rdparty"
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.site_specific_quirks.enabled = False
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36"
c.content.javascript.can_access_clipboard = False 
c.content.notifications.enabled = False 
c.content.canvas_reading = False

c.content.blocking.method = "both"
c.content.blocking.enabled = True
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://github.com/uBlockOrigin/uAssets/tree/master/filters"
]

c.url.default_page = "~/.config/qutebrowser/blank.html"
c.url.start_pages = ["~/.config/qutebrowser/blank.html"]
c.url.searchengines = {"DEFAULT": "https:/duckduckgo.com/?q={} -site:cplusplus.com"}

# per-domain settings

# keys
