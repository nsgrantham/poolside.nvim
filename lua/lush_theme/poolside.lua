--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local ps = require("poolside")

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- 
    -- See :h highlight-groups

    -- Windows
    Normal         { fg = ps.normal, bg = ps.base },              -- Normal text
    NormalNC       { Normal },                                    -- Normal text in non-current windows
    NormalFloat    { fg = ps.subtle, bg = ps.base.lighten(10) },  -- Normal text in floating windows
    FloatBorder    { fg = NormalFloat.fg },                       -- Border of floating windows
    FloatTitle     { Normal },                                    -- Title of floating windows
    Conceal        { Normal },                                    -- Placeholder characters substituted for concealed text (see 'conceallevel')
    VertSplit      { fg = ps.muted },                             -- Line separating vertically split windows

    -- Columns, Folds, Signs
    CursorColumn   { bg = ps.base.lighten(10) },  -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg = ps.base.lighten(10) },  -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    ColorColumn    { bg = ps.base.lighten(10) },  -- Columns set with 'colorcolumn'
    Folded         { bg = ps.base.lighten(20) },  -- Line used for closed folds
    SignColumn     { Normal },                    -- Column where |signs| are displayed
    FoldColumn     { Folded },                    -- 'foldcolumn'
    CursorLineFold { CursorLine },                -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { CursorLine },                -- Like SignColumn when 'cursorline' is set for the cursor line

    -- Search & Replace Highlighting
    IncSearch      { fg = ps.base, bg = ps.green },  -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     { IncSearch },                    -- |:substitute| replacement text highlighting
    CurSearch      { IncSearch },                    -- Highlighting a search pattern under the cursor (see 'hlsearch')

    -- Cursor
    Cursor         { fg = ps.base, bg = ps.accent },  -- Character under the cursor
    lCursor        { Cursor },                        -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM       { Cursor },                        -- Like Cursor, but used when in IME mode |CursorIM|
    TermCursor     { Cursor },                        -- Cursor in a focused terminal
    TermCursorNC   { Cursor },                        -- Cursor in an unfocused terminal

    Directory      { fg = ps.purple }, -- Directory names (and other special names in listings)

    -- Diffs
    DiffAdd        { fg = ps.blue },              -- Added line |diff.txt|
    DiffChange     { fg = ps.orange },            -- Changed line |diff.txt|
    DiffDelete     { fg = ps.red },               -- Deleted line |diff.txt|
    DiffText       { DiffChange, gui = "bold" },  -- Changed text within a changed line |diff.txt|

    -- Line numbers
    LineNr         { fg = ps.muted },               -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    { LineNr },                      -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow    { LineNr },                      -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { CursorLine, fg = ps.subtle },  -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    MatchParen     { bg = ps.base.lighten(40) },  -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        { fg = ps.muted.lighten(15) }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea        { fg = ps.muted.lighten(15) }, -- Area for messages and cmdline
    MsgSeparator   { fg = ps.muted.lighten(15) }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg = ps.green },             -- |more-prompt|
    NonText        { fg = ps.muted },             -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    -- Popup menu
    Pmenu          { NormalFloat },                  -- Normal item
    PmenuSel       { fg = ps.normal, bg = ps.base.lighten(40) }, -- Selected item
    PmenuKind      { Pmenu },                        -- Normal item "kind"
    PmenuKindSel   { PmenuSel },                     -- Selected item "kind"
    PmenuExtra     { Pmenu },                        -- Normal item "extra text"
    PmenuExtraSel  { PmenuSel },                     -- Selected item "extra text"
    PmenuSbar      { bg = ps.base.lighten(50) },          -- Scrollbar
    PmenuThumb     { bg = ps.base.lighten(60) },          -- Thumb of the scrollbar

    Question       { fg = ps.subtle }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { fg = ps.base, bg = ps.green }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { fg = ps.base, bg = ps.green }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { fg = ps.accent }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { fg = ps.normal, bg = ps.base.lighten(5) }, -- Status line of current window
    StatusLineNC   { bg = ps.base.lighten(5) }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    -- Tabs
    TabLine        { Pmenu },   -- Tab pages line, not active tab page label
    TabLineFill    { Normal },   -- Tab pages line, where there are no labels
    TabLineSel     { PmenuSel }, -- Tab pages line, active tab page label

    Title          { fg = ps.normal },           -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg = ps.base.lighten(15) }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg = ps.orange }, -- Warning messages
    ErrorMsg       { fg = ps.red },              -- Error messages on the command line
    EndOfBuffer    { fg = ps.base.lighten(20) }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    Whitespace     { fg = ps.muted.darken(30) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator   { VertSplit }, -- Separator between window splits. Inherits from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       { IncSearch }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markups.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name

    Comment        { fg = ps.muted },    -- Any comment

    Constant       { fg = ps.purple },   -- (*) Any constant
    Character      { Constant },         --   A character constant: 'c', '\n'
    Number         { Constant },         --   A number constant: 234, 0xff
    Boolean        { Constant },         --   A boolean constant: TRUE, false
    Float          { Constant },         --   A floating point constant: 2.3e10
    String         { fg = ps.yellow },   --   A string constant: "this is a string"

    Identifier     { fg = ps.normal },   -- (*) Any variable name
    Function       { fg = ps.blue },     --   Function name (also: methods for classes)

    Statement      { fg = ps.pink },     -- (*) Any statement
    Conditional    { Statement },        --   if, then, else, endif, switch, etc.
    Repeat         { Statement },        --   for, do, while, etc.
    Label          { Statement },        --   case, default, etc.
    Keyword        { Statement },        --   any other keyword
    Exception      { Statement },        --   try, catch, throw
    Operator       { fg = ps.accent },   --   "sizeof", "+", "*", etc.

    PreProc        { fg = ps.normal },   -- (*) Generic Preprocessor
    Include        { fg = ps.pink },     --   Preprocessor #include
    Define         { fg = ps.pink },     --   Preprocessor #define
    Macro          { fg = ps.pink },     --   Same as Define
    PreCondit      { fg = ps.pink },     --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = ps.green },    -- int, long, char, etc.
    StorageClass   { Type },             -- static, register, volatile, etc.
    Structure      { Type },             -- struct, union, enum, etc.
    Typedef        { Type },             -- A typedef

    Special        { fg = ps.blue },     -- (*) Any special symbol
    Tag            { fg = ps.purple },   --   You can use CTRL-] on this
    Delimiter      { fg = ps.accent },   --   Character that needs attention
    SpecialComment { fg = ps.orange },   --   Special things inside a comment (e.g. '\n')
    Debug          { fg = ps.orange },   --   Debugging statements

    SpecialChar    { fg = ps.red },      --   Special character in a constant

    Underlined     { underline = true }, -- Text that stands out, HTML links

    Ignore         { fg = ps.base },     -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { ErrorMsg },         -- Any erroneous construct
    Todo           { WarningMsg },       -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature helps. See |vim.lsps.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg = ps.red }, -- Used as the base highlight groups. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = ps.orange }, -- Used as the base highlight groups. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = ps.blue }, -- Used as the base highlight groups. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = ps.yellow }, -- Used as the base highlight groups. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg = ps.green }, -- Used as the base highlight groups. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { DiagnosticError, bg = ps.base.mix(DiagnosticError.fg, 20) }, -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { DiagnosticWarn, bg = ps.base.mix(DiagnosticWarn.fg, 20) }, -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextHint  { DiagnosticHint, bg = ps.base.mix(DiagnosticHint.fg, 20) }, -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { DiagnosticInfo, bg = ps.base.mix(DiagnosticInfo.fg, 20) }, -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextOk    { DiagnosticOk, bg = ps.base.mix(DiagnosticOk.fg, 20) } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { DiagnosticError, underline = true } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { DiagnosticWarn, underline = true } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { DiagnosticInfo, underline = true } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { DiagnosticHint, underline = true } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { DiagnosticOk, underline = true } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    --DiagnosticSignError        { fg = DiagnosticError.fg.mix(muted, 60) } , -- Used for "Error" signs in sign column.
    --DiagnosticSignWarn         { fg = DiagnosticWarn.fg.mix(muted, 60) } , -- Used for "Warn" signs in sign column.
    --DiagnosticSignInfo         { fg = DiagnosticInfo.fg } , -- Used for "Info" signs in sign column.
    --DiagnosticSignHint         { fg = DiagnosticHint.fg.mix(muted, 60) } , -- Used for "Hint" signs in sign column.
    --DiagnosticSignOk           { fg = DiagnosticOk.fg.mix(muted, 60) } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@text.literal"      { fg = ps.subtle },
    sym"@text.reference"    { Identifier },
    sym"@text.title"        { Title },
    sym"@text.uri"          { Underlined },
    sym"@text.underline"    { Underlined },
    sym"@text.todo"         { Todo },
    sym"@comment"           { Comment },
    sym"@punctuation"       { Delimiter },
    sym"@constant"          { Constant },
    sym"@constant.builtin"  { Constant },
    sym"@constant.macro"    { Constant },
    sym"@define"            { Define },
    sym"@macro"             { Macro },
    sym"@string"            { String  },
    sym"@string.escape"     { SpecialChar },
    sym"@string.special"    { SpecialChar },
    sym"@character"         { Character },
    sym"@character.special" { SpecialChar },
    sym"@number"            { Number },
    sym"@boolean"           { Boolean },
    sym"@float"             { Float },
    sym"@function"          { Function },
    sym"@function.builtin"  { Function },
    sym"@function.macro"    { Function },
    sym"@parameter"         { fg = ps.orange },
    sym"@method"            { Function },
    sym"@field"             { Identifier },
    sym"@property"          { fg = ps.orange },
    sym"@constructor"       { Special },
    sym"@conditional"       { Conditional },
    sym"@repeat"            { Repeat },
    sym"@label"             { Label },
    sym"@operator"          { Operator },
    sym"@keyword"           { Keyword },
    sym"@keyword.operator"  { Operator },
    sym"@exception"         { Exception },
    sym"@variable"          { Identifier },
    sym"@type"              { Type },
    sym"@type.definition"   { Typedef },
    sym"@storageclass"      { StorageClass },
    sym"@structure"         { Structure },
    sym"@namespace"         { fg = ps.blue },
    sym"@include"           { Include },
    sym"@preproc"           { PreProc },
    sym"@debug"             { Debug },
    sym"@tag"               { Tag },
    sym"@tag.delimiter"     { Delimiter },


    -- Telescope
    TelescopeBorder   { fg = NormalFloat.fg },

    -- NvimTree
    NvimTreeCursorLine       { CursorLine },
    NvimTreeNormal           { fg = ps.normal },
    NvimTreeRootFolder       { fg = ps.subtle, gui = "bold" },
    NvimTreeFolderIcon       { Directory }, --Directory.fg.mix(fg.darken(30), 40) },
    NvimTreeEmptyFolderName  { Directory, gui = "none" },
    NvimTreeOpenedFolderName { Directory, gui = "none" },
    NvimTreeGitDirty         { fg = ps.orange },
    NvimTreeGitStaged        { fg = ps.yellow },
    NvimTreeGitMerge         { fg = ps.pink },
    NvimTreeGitNew           { fg = ps.blue },
    NvimTreeGitDeleted       { fg = ps.red },
    NvimTreeGitIgnored       { Comment },
    NvimTreeFileIcon         { NvimTreeNormal },
    NvimTreeSpecialFile      { NvimTreeNormal, gui = "underline" },
    NvimTreeIndentMarker     { fg = Comment.fg.mix(ps.base, 30) },
    NvimTreeModifiedFile     { fg = ps.green.mix(ps.base, 40) },
    --NvimTreeSymlink          { fg = blue },

    -- notify
    NotifyBackground  { Normal, bg = ps.base },
    NotifyERRORBody   { Normal },
    NotifyWARNBody    { Normal },
    NotifyINFOBody    { Normal },
    NotifyDEBUGBody   { Normal },
    NotifyTRACEBody   { Normal },
    NotifyERRORBorder { Normal, fg = ps.red },
    NotifyWARNBorder  { Normal, fg = ps.orange },
    NotifyINFOBorder  { Normal, fg = ps.blue },
    NotifyDEBUGBorder { Normal, fg = ps.purple },
    NotifyTRACEBorder { Normal, fg = ps.pink },
    NotifyERRORIcon   { NotifyERRORBorder },
    NotifyWARNIcon    { NotifyWARNBorder },
    NotifyINFOIcon    { NotifyINFOBorder },
    NotifyDEBUGIcon   { NotifyDEBUGBorder },
    NotifyTRACEIcon   { NotifyTRACEBorder },
    NotifyERRORTitle  { NotifyERRORBorder },
    NotifyWARNTitle   { NotifyWARNBorder },
    NotifyINFOTitle   { NotifyINFOBorder },
    NotifyDEBUGTitle  { NotifyDEBUGBorder },
    NotifyTRACETitle  { NotifyTRACEBorder },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
