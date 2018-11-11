require 'spec_helper'

RSpec.describe Surveyor::FreeTextQuestion do
  subject { described_class.new(title: "Hello World") }

  it 'has a title' do
    expect(subject.title).to eq("Hello World")
  end

  context 'valid_answer?' do
    it 'is valid when it is a String' do
      expect(subject.valid_answer?('Hello World')).to eq(true)
    end

    context "when the answer is invalid" do
      let(:answer) { nil }
  
      it "will raise an exception" do
        expect { subject.valid_answer?(answer) }.to raise_error(Surveyor::ResponseError)
      end
    end
  end
end
