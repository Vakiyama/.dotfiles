{ ... }:
{
  programs.opencode = {
    enable = true;
    tui.theme = "catppuccin";
    settings = {
      model = "llama-local/qwen3.6:27b";
      lsp = true;
      provider = {
        llama-local = {
          name = "llama-swap (local)";
          npm = "@ai-sdk/openai-compatible";
          options = {
            baseURL = "http://127.0.0.1:8089/v1";
          };
          models = {
            "qwen3.6:27b" = {
              name = "Qwen3.6 27B";
              tools = true;
              options.supportsToolCalls = true;
            };
          };
        };
      };
    };
  };
}
