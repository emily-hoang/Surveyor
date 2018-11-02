require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "nhung@nhunghoang.com") }

  it "has an email" do
    expect(subject.email).to eq("nhung@nhunghoang.com")
  end

  it "can have asnwers added" do
    answer = double(:answer)
    subject.add_answer(answer)
    expect(subject.answers).to include(answer)
  end

  context "when the answer is invalid" do
    let(:answer) { nil }

    it "will raise an exception" do
      expect { subject.valid_answer?(answer) }.to raise_error(ResponseError)
    end
  end
end
