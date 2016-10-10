module MessengerHelper
  def get_who
    'I\'m LadyBot. I love supporting women in the workplace!'
  end

  def get_what
    'I\'m a chat bot created using HPE Haven OnDemand\'s Sentiment Analysis API on a Ruby on Rails backend :D'
  end

  def get_features
    'Upcoming features include sharing on Facebook, connecting women in real time, and SMS functionality.'
  end

  def get_inspirational_quote
    [
      "As Beyoncé said, “Power’s not given to you. You have to take it.”",
      "As Diane von Furstenberg said, “You are the one that possesses the keys to your being. You carry the passport to your own happiness.”",
      "As Golda Meir said, “Make the most of yourself by fanning the tiny, inner sparks of possibility into flames of achievement.”",
      "As Estée Lauder said, “I didn’t get there by wishing for it or hoping for it, but by working for it.”",
      "As Barbara Corcoran said, “The difference between successful people and others is how long they spend time feeling sorry for themselves.”",
      "As Ruth Reichl said, “One of the secrets to staying young is to always do things you don’t know how to do, to keep learning.”",
      "As Oprah Winfrey said, “Step out of the history that is holding you back. Step into the new story you are willing to create.”",
      "As Jane Goodall said, “What you do makes a difference, and you have to decide what kind of difference you want to make.”",
      "As Ayn Rand said, “The question isn’t who is going to let me; it’s who is going to stop me.”",
      "As Nora Ephron said, “Above all, be the heroine of your life, not the victim.”",
      "As Jennifer Lopez said, “Doubt is a killer. You just have to know who you are and what you stand for.”",
    ].sample
  end

  def get_encouraging_response
    [
      "As Rosa Parks said, “Knowing what must be done does away with fear.”",
      "As Amelia Earhart said, “The most difficult thing is the decision to act, the rest is merely tenacity.”",
      "As Erica Jong said, “If you don’t risk anything, you risk even more.”",
      "As Chris Evert said, “You can’t give up! If you give up, you’re like everybody else.”",
      "As Coco Chanel said, “In order to be irreplaceable one must always be different.”",
      "As Sonia Sotomayor said, “A surplus of effort could overcome a deficit of confidence.”",

    ].sample
  end

  def get_supportive_response
    [
      'Hang in there! https://www.youtube.com/watch?v=ZBR2G-iI3-I',
      "Remember: A woman is like a tea bag—you never know how strong she is until she gets in hot water. :) —Eleanor Roosevelt",
      "As Helen Keller said, “Optimism is the faith that leads to achievement.”",
      "As Dolly Parton said, “If you don’t like the road you’re walking, start paving another one.”",
      "As Tory Johnson said, “Hold your head and your standards high even as people or circumstances try to pull you down.”",
    ].sample
  end


  def get_happy_response
    [
      'As Maya Angelou would say, you are a Phenomenal Woman!', 
      'This calls for a happy dance! https://www.youtube.com/watch?v=zbYcte4ZEgQ', 
      'Girl power!',
      'Represent!'
    ].sample
  end

  def get_go_women_response
    [
      'Aren\'t women just great!',
      "As Marge Piercy said, “A strong woman is a woman determined to do something others are determined not be done.”",
      "Us women have to stick together. As Audrey Hepburn said, “The best thing to hold onto in life is each other.”",
    ].sample
  end

  def get_talking_response 
    [
      'You know what they say... “If you want something said, ask a man; if you want something done, ask a woman.”',
      "Don't be afraid to assert yourself! As Leymah Gbowee said, “You can never leave footprints that last if you are always walking on tiptoe.”",
      "Speaking up can be hard, but it's worth practicing. As Madeleine Albright said, “It took me quite a long time to develop a voice, and now that I have it, I am not going to be silent.”",
      "Don't be afraid to assert yourself! “Drama is very important in life: You have to come on with a bang. You never want to go out with a whimper.” - Julia Child",
      "Don't be afraid to speak up! As Madonna said, “When I’m hungry, I eat. When I’m thirsty, I drink. When I feel like saying something, I say it.”",
    ].sample
  end

  def get_criticism_response
    [
      "As Hillary Clinton said, “Take criticism seriously, but not personally. If there is truth or merit in the criticism, try to learn from it. Otherwise, let it roll right off you.”",
    ].sample
  end

  def get_mistake_response
    [
      "As Sallie Krawcheck said, “If you’re not making some notable mistakes along the way, you’re certainly not taking enough business and career chances.”",
    ].sample
  end
end
