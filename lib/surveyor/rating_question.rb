module Surveyor
  class RatingQuestion < Question
    attr_reader :title
    
    def initialize(title:)
      @title = title
    end

    def valid_answer?(answer)
      return false if answer.class != Integer 
      answer >= 1 && answer <= 5
    end
  end
end
