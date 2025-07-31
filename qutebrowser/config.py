
## This is here so configs done via the GUI are still loaded.
## Remove it to not load settings done via the GUI.
config.load_autoconfig(False)

c.url.searchengines = {
    'DEFAULT':                  'https://www.google.com/search?q={}',
    'wt':                       'https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fwww.webtoolkit.eu%2Fwt%2Fdoc%2Freference+{}',
    ':af':                      'https://www.google.com/search?q=site%3Ahttps://bbs.archlinux.org+{}',
    ':amir':                    'http://scripts.jakeandamir.com/index.php?search={}',
    ':aor':                     'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
    ':arch':                    'https://wiki.archlinux.org/index.php?search={}',
    ':archive':                 'https://archive.org/search.php?query={}&sin=',
    ':aro':                     'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
    ':aru':                     'https://aur.archlinux.org/packages/?O=0&K={}',
    ':arw':                     'https://wiki.archlinux.org/index.php?title=Special:Search&search={}',
    ':askubuntu':               'https://askubuntu.com/search?q={}',
    ':aur':                     'https://aur.archlinux.org/packages/?O=0&K={}',
    ':baidu':                   'https://www.baidu.com/s?ie=utf-8&wd={}',
    ':bash':                    'https://wiki.bash-hackers.org/doku.php?do=search&id={}',
    ':B':                       'https://search.brave.com/search?q={}&source=desktop',
    ':bi':                      'https://search.brave.com/images?q={}&source=web',
    ':bing':                    'https://www.bing.com/search?q={}',
    ':brave':                   'https://community.brave.com/search?q={}',
    ':bref':                    'https://www.basketball-reference.com/search/search.fcgi?hint=&search={}',
    ':br':                      'https://search.brave.com/search?q={}',
    ':bsdman':                  'https://man.openbsd.org/?query={}&apropos=0&sec=0&arch=default&manpath=OpenBSD-current',
    ':camel':                    'https://camelcamelcamel.com/search?sq={}',
    ':cfs':                     'https://search.brave.com/search?q={}+site:forums.phoenixrising.me',
    ':coin':                    'https://en.numista.com/catalogue/index.php?r={}&ct=coin',
    ':criticallytouched':       'https://criticallytouched.wordpress.com/?s={}',
    ':cs.stackexchange.com':    'https://cs.stackexchange.com/search?q={}',
    ':dc':                      'https://devdocs.io/#q={}',
    ':dg':                      'https://duckduckgo.com/?q={}',
    ':D':                       'https://www.dogpile.com/serp?q={}',
    ':django':                  'https://docs.djangoproject.com/en/4.0/search/?q={}',
    ':dl':                      'https://lite.duckduckgo.com/lite/?q={}',
    ':doc':                     'https://devdocs.io/#q={}',
    ':ebay':                    'https://www.ebay.com/sch/i.html?_from=R40&_trksid=p4432023.m570.l1313&_nkw={}',
    ':e':                       'https://www.ecosia.org/search?q={}',
    ':el':                      'https://hexdocs.pm/elixir/search.html?q={}',
    ':elixirforum.com':         'https://github.com/search?q={}&ref=opensearch',
    ':exploitee':               'http://www.Exploitee.rs/index.php?title=Special:Search&search={}',
    ':ezinearticles':           'http://ezinearticles.com/search/?q={}&sopt=title',
    ':fc':                      'https://www.google.com/search?q=site%3Achristianforums.com+{}',
    ':fdc':                     'https://fdc.nal.usda.gov/fdc-app.html#/?query={}',
    ':fdroid':                  'https://search.f-droid.org/?q={}&opensearch=1',
    ':f':                       'https://boardreader.com/s/{}.html;language=English',
    ':flask':                   'https://www.google.com/search?q={}+site%3Aflask.palletsprojects.com',
    ':forum':                   'https://boardreader.com/s/{}.html;language=English',
    ':ge':                      'https://search.gitee.com/?type=repository&q={}',
    ':gel':                     'https://www.google.com/search?q=site%3Ahexdocs.pm/elixir/+{}',
    ':gentoo':                  'https://wiki.gentoo.org/index.php?title=Special:Search&search={}',
    ':gh':                      'https://github.com/search?q={}',
    ':g':                       'https://www.google.com/search?q={}',
    ':gitlab.archlinux.org':    'https://gitlab.archlinux.org/search?search={}',
    ':gitlab':                  'https://gitlab.com/search?search={}',
    ':glf':                     'https://www.google.com/search?q={}+site%3Awww.linuxquestions.org%2Fquestions%2F',
    ':gl':                      'https://www.google.com/search?q={}+site%3Awww.linuxquestions.org%2F',
    ':glnx':                    'https://www.google.com/search?q=site%3Awww.linux.org+{}',
    ':gs':                      'https://scholar.google.com/scholar?q={}',
    ':hna':                     'https://hn.algolia.com?q={}&utm_source=opensearch&utm_medium=search&utm_campaign=opensearch',
    ':hn':                      'http://www.google.com/search?q={}+site:news.ycombinator.com',
    ':;':                       'http://127.0.0.1:5000/{}',
    ':.':                       'https://search.marginalia.nu/search?query={}&profile=yolo&js=default',
    ':imdb':                    'https://www.imdb.com/find?q={}&ref_=nv_sr_sm',
    ':invent.kde.org':          'https://invent.kde.org/search?search={}',
    ':jonskeet':                'https://codeblog.jonskeet.uk/?s={}',
    ':kdedocs':                 'https://docs.kde.org/index.php?application={}',
    ':kernel':                  'https://www.google.com/search?q=site%3Awww.kernel.org%2F+{}',
    ':k':                       'https://www.google.com/search?q=site%3Awww.kernel.org%2Fdoc%2F+{}',
    ':kj':                      'https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fwww.wordproject.org%2Fbibles%2Fkj%2F+{}',
    ':l':                       'http://libgen.is/search.php?req={}',
    ':linuxquestions.org':      'http://www.linuxquestions.org/questions/search.php?do=process&showposts=1&query={}',
    ':lkn':                     'https://www.google.com/search?q=site%3Ahttps://kernelnewbies.org/+{}',
    ':mailru':                  'https://go.mail.ru/search?q={}',
    ':mandeb':                  'https://dyn.manpages.debian.org/jump?q={}',
    ':man':                     'https://www.mankier.com/?q={}',
    ':math':                    'https://math.libretexts.org/Special:Search?q={}&offset=0&limit={{count?}}&format=html',
    ':mdn':                     'https://developer.mozilla.org/search?q={}',
    ':meme':                    'https://community.memex.garden/search?q={}',
    ':meta':                    'https://meta.stackexchange.com/search?q={}',
    ':m':                       'https://search.marginalia.nu/search?query={}',
    ':mj':                      'https://packages.manjaro.org/?query={}',
    ':mojeek':                  'https://www.mojeek.com/search?q={}',
    ':mw':                      'https://wiki.manjaro.org/index.php?&search={}',
    ':n':                       'https://www.google.com/search?q={}+site%3Aen.numista.com',
    ':novastream':              'https://novastream.to/search?keyword={}',
    ':onworks.net':             'https://www.onworks.net/index.php?option=com_search&searchword={}',
    ':opencode.net':            'https://www.opencode.net/search?search={}',
    ':pac':                     'https://archlinux.org/packages/?sort=&q={}',
    ':perldoc.perl.org':        'https://perldoc.perl.org/search?q={}',
    ':p':                       'http://priv.au/search?q={}',
    ':piano':                   'https://www.pianostreet.com/index_sr.php?q={}&sa=Search+pianostreet.com',
    ':piped.kavin.rocks':       'https://piped.video/results?search_query={}',
    ':pks':                     'https://piped.kavin.rocks/results?search_query={}',
    ':proof':                   'https://proofwiki.org/w/index.php?search={}',
    ':protondb.com':            'https://www.protondb.com/search?q={}',
    ':ps':                      'https://www.google.com/search?q={}+site%3Awww.pianostreet.com',
    ':py':                      'https://docs.python.org/3/search.html?q={}',
    ':python':                  'https://docs.python.org/3/search.html?q={}',
    ':q':                       'https://www.qwant.com/?q={}',
    ':rb':                      'https://search.brave.com/search?q={}+site:reddit.com',
    ':ref':                     'https://search.brave.com/search?q={}+site%3Abasketball-reference.com&source=web',
    ':re':                      'https://www.google.com/search?q={}+site%3Areddit.com',
    ':rn':                      'https://new.reddit.com/search?q={}',
    ':rs':                      'https:/old.reddit.com/search?q={}&utm_source=opensearch',
    ':rt':                      'https://www.rottentomatoes.com/search/?search={}',
    ':sa':                      'https://www.google.com/search?q={}+site%3Asilveragecoins.com',
    ':se':                      'https://stackexchange.com/search?q={}',
    ':s':                       'https://explore2.marginalia.nu/search?domain={}',
    ':so':                      'https://www.google.com/search?q={}+site:stackoverflow.com',
    ':source.chromium':         'https://source.chromium.org/search?q={}',
    ':sp':                      'https://www.startpage.com/do/search?q={}',
    ':ss':                      'https://swisscows.com/web?query={}',
    ':stack':                   'https://stackoverflow.com/search?q={}',
    ':start':                   'https://www.startpage.com/sp/search?query={}&cat=web&pl=opensearch&language=english',
    ':superuser':               'https://superuser.com/search?q={}',
    ':sx':                      'https://searx.be/search?q={}&categories=general',
    ':thebe0vlksaga.com':       'https://thebe0vlksaga.com/?s={}',
    ':tldr':                    'https://tldr.ostera.io/{}',
    ':tmdb':                    'https://www.themoviedb.org/search?query={}',
    ':unix':                    'https://www.google.com/search?q={}+site%3Aunix.stackexchange.com',
    ':unix.stack':              'https://unix.stackexchange.com/search?q={}',
    ':uptondaily.com':          'https://uptondaily.com/?s={}',
    ':wallpapersafari.com':     'https://wallpapersafari.com/search?q={}',
    ':wiby':                    'https://wiby.me/?q={}',
    ':wi':                      'https://www.wikipedia.org/w/index.php?search={}',
    ':yahoo':                   'https://search.yahoo.com/search?p={}',
    ':y':                       'https://yandex.com/search/?text={}',
    ':yi':                      'https://yandex.com/images/search?text={}',
    ':yt':                      'https://yewtu.be/search?q={}',
    ':ytube':                   'https://www.youtube.com/results?search_query={}&page={{startPage?}}&utm_source=opensearch',
}

#----------appearance-------------#
c.colors.tabs.bar.bg                     =  '#DF111111'
c.colors.tabs.even.bg                    =  '#000000'
c.colors.tabs.even.fg                    =  '#AAAAAA'
c.colors.tabs.indicator.error            =  '#ff0000'
c.colors.tabs.indicator.start            =  '#0000aa'
c.colors.tabs.indicator.system           =  'none'
c.colors.tabs.odd.bg                     =  '#000000'
c.colors.tabs.odd.fg                     =  '#AAAAAA'
c.colors.tabs.pinned.even.bg             =  'darkseagreen'
c.colors.tabs.pinned.even.fg             =  'white'
c.colors.tabs.pinned.odd.bg              =  'seagreen'
c.colors.tabs.pinned.odd.fg              =  'white'
c.colors.tabs.pinned.selected.even.bg    =  'black'
c.colors.tabs.pinned.selected.even.fg    =  'white'
c.colors.tabs.pinned.selected.odd.bg     =  'black'
c.colors.tabs.pinned.selected.odd.fg     =  'white'
c.colors.tabs.selected.even.bg           =  '#002244'
c.colors.tabs.selected.even.fg           =  '#00FF00'
c.colors.tabs.selected.odd.bg            =  '#002244'
c.colors.tabs.selected.odd.fg            =  '#00FFFF'
c.colors.webpage.bg                      =  "#000000"
c.colors.webpage.darkmode.algorithm      =  'lightness-cielab'
c.colors.webpage.darkmode.enabled        =  True
c.colors.webpage.preferred_color_scheme  =  'dark'
c.content.canvas_reading                 =  False
c.fonts.default_family                   =  [ "Agave", "Noto Sans", "Monospace"]
c.fonts.default_size                     =  '9pt'
c.fonts.downloads                        =  'default_size default_family'
c.fonts.statusbar                        =  '9pt Noto Sans'
c.fonts.tabs.selected                    =  '9pt Noto Sans'
c.fonts.tabs.unselected                  =  '9pt Noto Sans'
c.spellcheck.languages                   =  []
c.tabs.favicons.scale                    =  1.0
c.tabs.favicons.show                     =  'always'
c.tabs.position                          =  'left'
c.downloads.position                     =  'bottom'
c.window.transparent                     =  True
c.qt.highdpi                             =  True

#----------variables--------------#
hint_all = [
    'a',                           'area',                    'textarea',                        'select',
    'input:not([type="hidden"])',  'button',                  'frame',                           'iframe',
    'img',                         'link',                    'summary',                         '[contenteditable]:not([contenteditable="false"])',
    '[onclick]',                   '[onmousedown]',           '[role="link"]',                   '[role="option"]',
    '[role="button"]',             '[role="tab"]',            '[role="checkbox"]',               '[role="menuitem"]',
    '[role="menuitemcheckbox"]',   '[role="menuitemradio"]',  '[ng-click]',                      '[ngClick]',
    '[data-ng-click]',             '[x-ng-click]',            '[tabindex]:not([tabindex="-1"])'
]
hint_links   = [ 'a[href]', 'area[href]', 'link[href]', '[role="link"][href]' ]
hint_images  = [ 'img' ]
hint_media   = [ 'audio', 'img', 'video' ]
hint_url     = [ '[src]', '[href]' ]
hint_inputs  = [
    'input[type="text"]'            ,
    'input[type="month"]'           ,
    'input[type="tel"]'             ,
    'input[type="datetime-local"]'  ,
    'input[type="password"]'        ,
    'input[type="url"]'             ,
    'input:not([type])'             ,
    'input[type="date"]'            ,
    'input[type="number"]'          ,
    'input[type="time"]'            ,
    'input[type="email"]'           ,
    'input[type="search"]'          ,
    'input[type="week"]'            ,
    'textarea'                      ,
    '[contenteditable]:not([contenteditable="false"])',
]
hint_selectors = {
    'all':     hint_all,
    'links':   hint_links,
    'images':  hint_images,
    'media':   hint_media,
    'url':     hint_url,
    'inputs':  hint_inputs,
}
my_start_page = "about:blank"
my_start_pages = [ my_start_page ]

adblock_list = []
adblock_list += ['https://easylist.to/easylist/easylist.txt'        ]
adblock_list += ['https://easylist.to/easylist/easyprivacy.txt'     ]
adblock_list += ['https://secure.fanboy.co.nz/fanboy-annoyance.txt' ]
adblock_list += ['https://easylist.to/easylist/fanboy-social.txt'   ]
keybind_mappings = {
    '<Ctrl-6>':        '<Ctrl-^>',
    '<Ctrl-M>':        '<Return>',
    '<Ctrl-J>':        '<Return>',
    '<Shift-Return>':  '<Return>',
    '<Enter>':         '<Return>',
    '<Shift-Enter>':   '<Return>',
    '<Ctrl-Enter>':    '<Ctrl-Return>'
}
aliases = {
    'w': 'session-save',
    'q': 'close',
    'qa': 'quit',
    'wq': 'quit --save',
    'wqa': 'quit --save'
}
zoom_levels = [
    '5%',    '10%',   '15%',   '25%',   '30%',   '35%',   '40%',   '45%',
    '50%',   '55%',   '65%',   '75%',   '90%',   '100%',  '110%',  '125%',
    '150%',  '175%',  '200%',  '250%',  '300%',  '400%',  '500%'
]

#----------settings---------------#
c.new_instance_open_target = 'tab-silent'
c.content.local_content_can_access_remote_urls = True
c.content.javascript.log_message.excludes = {
    #"userscript:_qute_stylesheet": ["*Refused to apply inline style because it violates the following Content Security Policy directive: *"],
    #"userscript:_qute_js":         ["*TrustedHTML*"]
}
c.hints.selectors = hint_selectors
c.history_gap_interval = -1
c.window.hide_decoration = False
c.aliases = aliases
c.bindings.key_mappings = keybind_mappings
c.auto_save.interval                            =   500
c.auto_save.session                             =   True
c.completion.use_best_match                     =   True
c.content.blocking.adblock.lists                =   adblock_list
c.content.blocking.enabled                      =   True
c.content.blocking.hosts.block_subdomains       =   True
c.content.blocking.method                       =   'both'
c.content.cookies.accept                        =   'no-3rdparty'
c.content.cookies.store                         =   True
c.content.dns_prefetch                          =   True
c.content.geolocation                           =   False
c.content.headers.accept_language               =   'en-US,en;q=0.9'
#c.content.headers.user_agent                    =   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'
c.content.javascript.enabled                    =   True
c.content.pdfjs                                 =   True
c.content.site_specific_quirks.enabled          =   True
c.downloads.location.suggestion                 =   'both'
c.downloads.remove_finished                     =   -1
c.messages.timeout                              =   0
c.qt.workarounds.disable_accelerated_2d_canvas  =   'always'
c.scrolling.smooth                              =   False
c.search.ignore_case                            =   'smart'
c.search.incremental                            =   True
c.search.wrap                                   =   True
c.session.default_name                          =   "Default"
c.session.lazy_restore                          =   True
c.statusbar.widgets                             =   ['progress', 'keypress', 'url', 'scroll', 'history', 'tabs', 'progress']
c.url.default_page                              =   my_start_page
c.url.start_pages                               =   my_start_pages
c.zoom.default                                  =   '90%'
c.zoom.levels                                   =   zoom_levels
c.zoom.mouse_divider                            =   512
c.zoom.text_only                                =   False

#----------tab-settings-----------#
c.tabs.indicator.padding            = {'top': 0, 'bottom': 0, 'left': 0, 'right': 9}
c.tabs.focus_stack_size                     =  100
c.tabs.indicator.width                      =  1
c.tabs.title.format                         =  '{audio}{current_title}'
c.tabs.undo_stack_size                      =  -1
c.tabs.width                                =  '15%'
c.tabs.show = "multiple"

#----------external-commands------#
c.fileselect.folder.command =  ['st', '-e', 'ranger', '--choosedir={}']
c.editor.command = ['st', '-e', 'nvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.editor.encoding = 'utf-8'
c.editor.remove_file = True

#----------permissions------------#
c.content.media.audio_capture        =  False
c.content.media.audio_video_capture  =  False
c.content.media.video_capture        =  False
c.content.notifications.enabled      =  False
c.colors.webpage.darkmode.policy.page = 'always'
c.colors.webpage.darkmode.policy.page = 'smart'

#----------regular_binding--------#
config.bind("'",                        'mode-enter jump_mark')
config.bind(',ab',                      'bookmark-add')
config.bind(',aq',                      'quickmark-save')
config.bind(',oc',                      'spawn mpv {url}')
config.bind(',om',                      'hint links spawn mpv {hint-url}')
config.bind(',rb',                      'bookmark-del')
config.bind(',rq',                      'quickmark-del')
config.bind(';;',                       'config-cycle tabs.show always never')
config.bind(';Ta',                      'set tabs.show "always"')
config.bind(';Tm',                      'set tabs.show "multiple"')
config.bind(';Tn',                      'set tabs.show "never"')
config.bind(';Ts',                      'set tabs.show "switching"')
config.bind(';h',                       'hint all hover')
config.bind(';i',                       'hint images')
config.bind(';o',                       'hint links fill :open {hint-url}')
config.bind(';r',                       'hint --rapid links tab-bg')
config.bind(';t',                       'hint inputs')

config.bind('<Ctrl-->',                 'zoom-out')
config.bind('<Ctrl-1>',                 'tab-focus 1')
config.bind('<Ctrl-2>',                 'tab-focus 2')
config.bind('<Ctrl-3>',                 'tab-focus 3')
config.bind('<Ctrl-4>',                 'tab-focus 4')
config.bind('<Ctrl-5>',                 'tab-focus 5')
config.bind('<Ctrl-6>',                 'tab-focus 6')
config.bind('<Ctrl-7>',                 'tab-focus 7')
config.bind('<Ctrl-8>',                 'tab-focus 8')
config.bind('<Ctrl-9>',                 'tab-focus -1')
config.bind('<Ctrl-=>',                 'zoom-in')
config.bind('<Ctrl-Shift-+>',           'zoom-in')
config.bind('<Ctrl-Shift-Tab>',         'tab-prev')
config.bind('<Ctrl-Shift-_>',           'zoom-out')
config.bind('<Ctrl-Tab>',               'tab-next')
config.bind('<Ctrl-[',                  'scroll up')
config.bind('<Ctrl-]',                  'scroll down')
config.bind('<Escape>',                 'clear-keychain ;; search ;; clear-messages;; download-clear')

config.bind('<Ctrl-b>',                 'config-cycle colors.webpage.darkmode.enabled true false')
config.bind('<Ctrl-d>',                 'scroll-page 0 0.5')
config.bind('<Ctrl-e>',                 'prompt-fileselect-external', mode='prompt')
config.bind('<Ctrl-j>',                 'tab-next')
config.bind('<Ctrl-k>',                 'tab-prev')
config.bind('<Ctrl-o>',                 'cmd-set-text :open {url:pretty}')
config.bind('<Ctrl-u>',                 'scroll-page 0 -0.5')
config.bind('<Ctrl-v>',                 'mode-enter passthrough')

config.bind('<Ctrl-Shift-I>',           'devtools bottom')
config.bind('<Ctrl-Shift-T>',           'undo')
config.bind('<Ctrl-Shift-O>',           'cmd-set-text :open -t {url:pretty}')


config.bind('B',                        'cmd-set-text -s :bookmark-load -t')
config.bind('D',                        'scroll-close 0 1')
config.bind('H',                        'back')
config.bind('J',                        'tab-prev')
config.bind('K',                        'tab-next')
config.bind('L',                        'forward')
config.bind('R',                        'reload -f')
config.bind('U',                        'scroll-page 0 -0.5')

config.bind('b',                        'cmd-set-text -s :bookmark-load')
config.bind('cd',                       'download-clear')
config.bind('d',                        'scroll-page 0 0.5')
config.bind('gO',                       'set-cmd-text :open -t -r {url:pretty}')
config.bind('j',                        'scroll down')
config.bind('k',                        'scroll up')
config.bind('u',                        'scroll-page 0 -0.5')
config.bind('wIf',                      'devtools-focus')
config.bind('wIh',                      'devtools left')
config.bind('wIk',                      'devtools top')
config.bind('wIl',                      'devtools right')
config.bind('wIw',                      'devtools window')
config.bind('yD',                       'yank domain -s')
config.bind('yf',                       'hint links yank')
config.bind('yp',                       'yank pretty-url')

#----------command_binding--------#
config.bind('<Ctrl-p>',                 'completion-item-focus prev',           mode='command')
config.bind('<Ctrl-n>',                 'completion-item-focus next',           mode='command')
config.bind('<Ctrl-[>',                 'command-history-next',                 mode='command')
config.bind('<Ctrl-]>',                 'command-history-prev',                 mode='command')
config.bind('<Shift-Tab>',              'completion-item-focus prev',           mode='command')
config.bind('<Tab>',                    'completion-item-focus next',           mode='command')
config.bind('<Up>',                     'completion-item-focus --history prev', mode='command')

#----------insert__binding--------#
config.bind('<Ctrl-i>',                 'open -- {clipboard}',                  mode='insert')
#----------passthrough_binding----#
config.bind('<Shift-Escape>',           'mode-leave', mode='passthrough')
#------------------END--------------------#

#############################################################################################################################
#############################################################################################################################
#############################################################################################################################
#############################################################################################################################

##  This only has an effect when `colors.webpage.darkmode.algorithm` is set to `lightness-hsl` `brightness-rgb`. Type: Float
#c.colors.webpage.darkmode.contrast = 0.0
#
##################################################### - always, aever, amart
##c.colors.webpage.darkmode.policy.images = 'never'
#
### Render all colors as grayscale. Only works when `c..darkmode.algorithm` is set to `lightness-hsl` `brightness-rgb` ## Type: Bool
#c.colors.webpage.darkmode.grayscale.all = False
#
### Desaturation factor for images in dark mode. If set to 0, images are left as-is. If set to 1, images are completely grayscale. Values ## Type: Float
#c.colors.webpage.darkmode.grayscale.images = 0.0
#
### Which pages to apply dark mode to. The underlying Chromium setting has
### been removed in QtWebEngine 5.15.3, thus this setting is ignored
### there. Instead, every element is now classified individually.
### Type: String
### Valid values:
###   - always: Apply dark mode filter to all frames, regardless of content.
###   - smart: Apply dark mode filter to frames based on background color.
#c.colors.webpage.darkmode.policy.page = 'smart'
#
### Threshold for inverting background elements with dark mode. Background
### elements with brightness above this threshold will be inverted, and
### below it will be left as in the original, non-dark-mode page. Set to
### 256 to never invert the color or to 0 to always invert it. Note: This
### behavior is the opposite of `colors.webpage.darkmode.threshold.text`!
### Type: Int
#c.colors.webpage.darkmode.threshold.background = 256
### Threshold for inverting text with dark mode. Text colors with
### brightness below this threshold will be inverted, and above it will be
### left as in the original, non-dark-mode page. Set to 256 to always
### invert text color or to 0 to never invert text color.
### Type: Int
#c.colors.webpage.darkmode.threshold.text = 256
## lightness-cielab: Modify colors by converting them to CIELAB color space and inverting the L value. Not available with Qt < 5.14.
## lightness-hsl: Modify colors by converting them to the HSL color space and inverting the lightness (i.e. the "L" in HSL).
## brightness-rgb: Modify colors by subtracting each of r, g, and b from their maximum value.

## Color gradient end for the tab indicator ## Type: QtColor
## Background color of the tab bar ## Type: QssColor
## Color gradient inerpolation system for the tab indicator.
## rgb, hsv, hsl, none ##Type: ColorSystem
#c.colors.webpage.darkmode.policy.page = 'always'
