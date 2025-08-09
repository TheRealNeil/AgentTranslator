class TranslationAgent < ApplicationAgent
  generate_with :ollama, model: "gemma3:latest", stream: true

  on_stream :broadcast_message

  def translate
    prompt
  end

  private

  def broadcast_message
    response = generation_provider.response

    # Broadcast the message to the specified channel
    Turbo::StreamsChannel.broadcast_update_to("translation_agent_messages",
                                              target: "response", html: "<p>Translating...</p><p> #{response.message.content} </p>")
  end
end
