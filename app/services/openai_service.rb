require "openai"

class OpenaiService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: prompt }], # Required.
        temperature: 0.7,
        stream: false
      }
    )
    # you might want to inspect the response and see what the api is giving you
    return response["choices"][0]["message"]["content"]
  end
end
