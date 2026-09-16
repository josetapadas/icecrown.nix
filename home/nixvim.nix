{
  programs.nixvim = {
    enable = true;

    nixpkgs.useGlobalPackages = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    globals = {
      mapleader = ",";
      maplocalleader = ",";
    };

    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
    };

    plugins.nvim-tree = {
      enable = true;

      settings = {
        view = {
          side = "left";
          width = 32;
        };

        renderer = {
          group_empty = true;
        };
      };
    };

    plugins.treesitter = {
      enable = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    plugins.telescope = {
      enable = true;

      keymaps = {
        ",ff" = {
          action = "find_files";
          options.desc = "Procurar ficheiros";
        };
        ",fg" = {
          action = "live_grep";
          options.desc = "Procurar texto no projeto";
        };
        ",fb" = {
          action = "buffers";
          options.desc = "Procurar buffers abertos";
        };
        ",fh" = {
          action = "help_tags";
          options.desc = "Procurar ajuda";
        };
      };
    };

    plugins.lsp = {
      enable = true;

      servers.nixd.enable = true;
      servers.basedpyright.enable = true;
      servers.ruff.enable = true;

      keymaps = {
        silent = true;

        diagnostic = {
          ",dn" = "goto_next";
          ",dp" = "goto_prev";
        };

        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gi" = "implementation";
          "K" = "hover";
          ",rn" = "rename";
          ",ca" = "code_action";
        };
      };
    };

    plugins.lualine = {
      enable = true;

      settings.options.theme = "auto";
    };

    plugins.which-key = {
      enable = true;

      settings.spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "Procurar (Telescope)";
        }
      ];
    };

    keymaps = [
      {
        mode = "n";
        key = ",e";
        action = "<cmd>NvimTreeToggle<CR>";

        options = {
          silent = true;
          desc = "Abrir ou fechar explorador";
        };
      }
      {
        mode = "n";
        key = ",?";
        action = "<cmd>WhichKey<CR>";

        options = {
          silent = true;
          desc = "Mostrar todos os keymaps";
        };
      }
    ];
  };
}
