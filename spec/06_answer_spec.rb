require 'spec_helper'

RSpec.describe Surveyor::Answer do
  subject { described_class.new(question: question, value: value) }
  let(:question) { Surveyor::Question.new(title: title) }
  let(:title) { "What motivates you at work?" }
  let(:value) { "" }

  describe "#new" do
    context 'when there are fewer than 2 paramaters' do
      it "will through an ArgumentError " do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end

    context 'when Answer is initialized correctly' do
      it "has a question" do
        expect(subject.question.title).to eq(title)
      end  
    end
  end

  describe '#question' do
    it "will open access to question" do
      expect(subject.question).to eq(question)
    end
  end

  describe "#value" do
    it "will open acess to value" do
      expect(subject.value).to eq(value)
    end
  end
end
