require "spec_helper"

describe Notifications do
  describe "became_owner" do
    let(:mail) { Notifications.became_owner }

    it "renders the headers" do
      mail.subject.should eq("Became owner")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "candidate_updated" do
    let(:mail) { Notifications.candidate_updated }

    it "renders the headers" do
      mail.subject.should eq("Candidate updated")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
