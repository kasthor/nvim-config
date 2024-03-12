return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  opts = {
    api_key_cmd = "security find-generic-password -s OpenAI_API_Key -a kasthor -w"
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
