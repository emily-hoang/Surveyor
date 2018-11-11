module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    def add_question(question)
      @questions << question
    end
      
    def add_response(response)
      @responses << response
    end

    # NOTE: if there are multiple responses with the same email
    # it will return all
    def find_response_by_email(email)
      responses = @responses.select { |response| response.email == email }  
      if  responses.empty?
        return nil
      else
        return responses
      end
    end

    def has_responded_yet?(email)
      responses = @responses.select do |response| 
        response.email == email
      end

      if responses.count > 0
        return true
      else
        return false
      end
    end

    def get_answer_for_rating_question(rating_question)
      answers_summary = { 1 => 0, 2 => 0, 3 => 0, 4 =>0, 5 => 0 }

      @responses.each do |response|
        response.answers.each do |answer|
          if answer.question == rating_question
            if answer.value.class == Integer && answer.value >= 1 && answer.value <= 5
              answers_summary[answer.value] = answers_summary[answer.value] + 1
            end
          end
        end
      end

      answers_summary
    end
  end
end
