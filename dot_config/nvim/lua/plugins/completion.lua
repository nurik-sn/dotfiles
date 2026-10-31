return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        -- Enterキーでの確定を無効化（改行を優先し、誤爆を防ぐ）
        ["<CR>"] = { "fallback" },
        -- Tabキーで候補選択または確定
        ["<Tab>"] = { "select_and_accept", "fallback" },
      },
      completion = {
        -- 1. 後ろにうっすら出る灰色の先行候補（ゴーストテキスト）を完全停止
        ghost_text = { enabled = false },

        -- 2. 勝手に先頭の候補を自動挿入・選択しない
        list = {
          selection = { preselect = false, auto_insert = false },
        },

        -- 3. 画面を覆い尽くす巨大なドキュメント枠を自動表示しない
        documentation = {
          auto_show = false,
        },

        -- 4. 候補リストのポップアップ（メニュー）自体は正常に表示する
        menu = {
          auto_show = true,
        },
      },
      -- 邪魔な巨大スニペット（定型文）の割り込みを除外し、LSPと単語補完に絞る
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },
}
