{ ... }:
{
  programs.opencode = {
    enable = true;
    tui.theme = "catppuccin";
    settings = {
      model = "gauge/Qwen3.6-35B-A3B-MTP-UD-IQ4_NL.gguf";  # default → remote
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
        gauge = {
          name = "Gauge Numerics (remote)";
          npm = "@ai-sdk/openai-compatible";
          options = {
            baseURL = "https://llm.gaugenumerics.com/v1";
            apiKey = "{file:/run/secrets/ethan_server_api_key}";
          };
          models = {
            "Qwen3.6-35B-A3B-MTP-UD-IQ4_NL.gguf" = {
              name = "Qwen3.6 35B A3B (remote)";
              tools = true;
              options.supportsToolCalls = true;
            };
          };
        };
      };
    };
  };
}
