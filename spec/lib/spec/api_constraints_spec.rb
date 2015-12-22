require 'spec_helper'

describe ApiConstraints do

  let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
  let(:api_constraints_v7) { ApiConstraints.new(version: 7) }
  let(:api_constraints_v2_w_default) { ApiConstraints.new(version: 2, default: true) }

  describe 'matches?' do

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.marketplace.dev',
                       headers: {"Accept" => "application/vnd.marketplace.v1"})
      api_constraints_v1.matches?(request).should be_true
    end

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.marketplace.dev',
                       headers: {"Accept" => "application/vnd.marketplace.v7"})
      api_constraints_v7.matches?(request).should be_true
    end

    it "returns false when the version DOES NOT matche the 'Accept' header" do
      request = double(host: 'api.marketplace.dev',
                       headers: {"Accept" => "application/vnd.marketplace.v8"})
      api_constraints_v7.matches?(request).should be_false
    end


    it "returns the default version when the 'default' option is specified" do
      request = double(host: 'api.marketplace.dev')
      api_constraints_v2_w_default.matches?(request).should be_true
    end

  end
end
