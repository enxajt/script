const {classes: Cc, interfaces: Ci, utils: Cu} = Components;
const gClipboardHelper = Cc['@mozilla.org/widget/clipboardhelper;1']
      .getService(Ci.nsIClipboardHelper);
const {Preferences} = Cu.import('resource://gre/modules/Preferences.jsm', {});

const FIREFOX_PREFS = {
  'browser.startup.page': 3,
  'browser.tabs.animate': false,
  'browser.search.suggest.enabled': true,
  'browser.urlbar.suggest.searches': true,
  'browser.urlbar.maxRichResults': 20,
  'browser.tabs.remote.force-enable': true,
  'extensions.e10sBlockedByAddons': false,
  'extensions.e10sBlocksEnabling': false,
  'dom.ipc.processCount': 4
};

const VIMFX_PREFS = {
  'prevent_autofocus': true
};

const MAPPINGS = {
  'copy_current_url': '',
  'go_home': '',
  'stop': '<c-escape>',
  'stop_all': 'a<c-escape>',

  'history_back': '<c-o>',
  'history_forward': '<c-i>',

  'scroll_left': 'h',
  'scroll_right': 'l',
  'scroll_page_down': '<c-f>',
  'scroll_page_up': '<c-b>',
  'scroll_half_page_down': '<c-d>',
  'scroll_half_page_up': '<c-u>',
  'mark_scroll_position': 'mm',
  'scroll_to_mark': 'gm',

  'tab_new': 'T',
  'tab_new_after_current': 't',
  'tab_close': 'd x',
  'tab_restore': 'u',
  'tab_restore_list': 'U',
  'tab_select_previous': 'gT',
  'tab_select_next': 'gt',
  'tab_select_first_non_pinned': '^',
  'tab_select_last': '$',

  'enter_mode_ignore': 'I',
  'quote': 'i',

  'custom.mode.normal.search_selected_text': 's',
  'custom.mode.normal.copy_selection_or_url': 'yy',
  'custom.mode.normal.copy_as_markdown': 'ym',
  'custom.mode.normal.click_toolbar_pocket': 'mp'
};

const {commands} = vimfx.modes.normal;

const CUSTOM_COMMANDS = [
  [
    {
      name: 'search_selected_text',
      description: 'Search for the selected text'
    }, ({vim}) => {
      vimfx.send(vim, 'getSelection', true, selection => {
        if (selection != '') {
          vim.window.switchToTabHavingURI(`https://www.google.co.jp/search?q=${selection}`, true);
        }
      });
    }
  ],
  [
    {
      name: 'copy_as_markdown',
      description: 'Copy title and url as Markdown',
      category: 'location',
      order: commands.copy_current_url.order + 2
    }, ({vim}) => {
      let url = vim.window.gBrowser.selectedBrowser.currentURI.spec;
      let title = vim.window.gBrowser.selectedBrowser.contentTitle;
      let s = `[${title}](${url})`;
      gClipboardHelper.copyString(s);
      vim.notify(`Copied to clipboard: ${s}`);
    }
  ],
  [
    {
      name: 'copy_selection_or_url',
      description: 'Copy the selection or current url',
      category: 'location',
      order: commands.copy_current_url.order + 1
    }, ({vim}) => {
      vimfx.send(vim, 'getSelection', true, selection => {
        if (selection == '') {
          selection = vim.window.gBrowser.selectedBrowser.currentURI.spec;
        }
        gClipboardHelper.copyString(selection);
        vim.notify(`Copied to clipboard: ${selection}`);
      });
    }
  ],
  [
    {
      name: 'click_toolbar_pocket',
      description: 'Click toolbar button [Pocket]'
    }, ({vim}) => {
      vim.window.document.getElementById('pocket-button').click();
    }
  ]
];

Object.entries(VIMFX_PREFS).forEach(([name, value]) => {
  vimfx.set(name, value);
});

CUSTOM_COMMANDS.forEach(([options, fn]) => {
  vimfx.addCommand(options, fn);
});

Object.entries(MAPPINGS).forEach(([cmd, key]) => {
  if (!cmd.includes('.')) {
    cmd = `mode.normal.${cmd}`;
  }
  vimfx.set(cmd, key);
});

Preferences.set(FIREFOX_PREFS);
