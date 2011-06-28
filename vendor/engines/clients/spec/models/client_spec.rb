require 'spec_helper'

describe Client do

  def reset_client(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @client.destroy! if @client
    @client = Client.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_client
  end

  context "validations" do
    
    it "rejects empty name" do
      Client.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_client
      Client.new(@valid_attributes).should_not be_valid
    end
    
  end

end