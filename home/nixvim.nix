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
    ];
  };
}
