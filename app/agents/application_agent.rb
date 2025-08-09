class ApplicationAgent < ActiveAgent::Base
  layout "agent"

  generate_with :ollama, model: "gemma3:latest", instructions: "You are a helpful assistant."
end
