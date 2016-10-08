class MessengerController < ApplicationController
  
  def receive
    response = analyze(params[:message])
    render json: response
  end

  private

  require 'uri'

  def api_call(msg)
    msg = URI.encode(msg)
    info = JSON.parse(`curl -X POST "https://gateway-a.watsonplatform.net/calls/text/TextGetCombinedData?apikey=#{ALCHEMY['api_key']}&text=#{msg}&outputMode=json&extract=doc-emotion,entities,keywords,doc-sentiment,typed-rels"`)
  end

  def analyze(msg)
    res = api_call(msg)
    emotions = res["docEmotions"].sort_by{|k, v| -(v.to_f)}
    dominant_emotion = emotions[0][0]
    if dominant_emotion == "anger" || dominant_emotion == "disgust"
      if res["entities"].length > 0
        entity_type = res["entities"][0]["type"]
        entity_name = res["entities"][0]["text"]
        return generate_named_reply(entity_type, entity_name)
      else
        return generate_sympathetic_reply
      end
    elsif dominant_emotion == "joy"
      return generate_happy_reply
    elsif dominant_emotion == "sadness" || dominant_emotion == "fear"
      return generate_encouraging_reply
    else
      return "Strange..."
    end
  end

  def generate_named_reply(type, name)
    return ["Well, well, well you're feeling quite ughhh about #{name}, aren't ya?", "#{name} sure sounds like a shitty #{type} to be around"].sample
  end

  def generate_sympathetic_reply
    return ["That sounds annoying. Shake It Out with Florence? https://www.youtube.com/watch?v=WbN0nX61rIs", "You know what they say...'If you want something said, ask a man; if you want something done, ask a woman.'", "Hang in there! https://www.youtube.com/watch?v=ZBR2G-iI3-I"].sample
  end

  def generate_happy_reply
    return ["As Maya Angelou would say, you are a Phenomenal Woman!", "This calls for a happy dance! https://www.youtube.com/watch?v=zbYcte4ZEgQ", "Aren't women just great!"].sample
  end

  def generate_encouraging_reply
    ["Remember: A woman is like a tea bag—you never know how strong she is until she gets in hot water. :) —Eleanor Roosevelt", "Women are cool."].sample
  end

end

