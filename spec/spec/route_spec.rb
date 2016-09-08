require 'rails_helper'

RSpec.describe "routing to surveys", :type => :routing do
  it "routes /api/v1/surveys/due_this_week to surveys#due_this_week" do
    expect(:get => "/api/v1/surveys/due_this_week").to route_to(
                                                           :controller => "surveys",
                                                           :action => "obligation_due_this_week"
                                                       )
  end

  it "does not route to any" do
    expect(:get => "/surveys/1").not_to be_routable
  end

end

describe "test ^^^ Survey Obligation > due_this_week", :type => :request do

  it "returns all the students" do
    get "/api/v1/surveys/due_this_week?page=1",nil,'Authorization' => 'Token token="12345"'
    expect(response.body).to include('survey_definition_id')

  end
end

describe "test ^^^ Survey Obligation > :id ", :type => :request do

  it "returns all the students" do
    get "/api/v1/surveys/1",nil,'Authorization' => 'Token token="12345"'
    expect(response.body).to include('survey_definition_id')

  end
end


describe "test ^^^ Survey Obligation > submittable_now", :type => :request do

  it "returns all the students" do
    get "/api/v1/surveys/submittable_now?page=1",nil,'Authorization' => 'Token token="12345"'
    expect(response.body).to include('survey_definition_id')

  end
end



describe "test ^^^ Survey Obligation > missed", :type => :request do

  it "returns all the students" do
    get "/api/v1/surveys/missed?page=1",nil,'Authorization' => 'Token token="12345"'
    expect(response.body).to include('survey_definition_id')

  end
end