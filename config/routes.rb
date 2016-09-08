Rails.application.routes.draw do

  scope '/api/v1/surveys' do

    get '/:id', to:               'surveys#obligation_show',        constraints: {id: /\d+/}
    get '/due_this_week', to:     'surveys#obligation_due_this_week'
    get '/submittable_now', to:   'surveys#obligation_submittable_now'
    get '/missed', to:            'surveys#obligation_missed'
    get '/due/:week_index' , to:  'surveys#obligation_due_to_week', constraints: {week_index: /\d+/}
  
  end
=begin
  scope '/api/v1/surveys/definitions' do

    get '/:id', to:               'surveys#definition_showbyId',        constraints: {id: /\d+/}
    get '/due_this_week', to:     'surveys#definition_due_this_week'
    get '/submittable_now', to:   'surveys#definition_submittable_now'
    get '/missed', to:            'surveys#definition_missed'
    get '/due/:week_index' , to:  'surveys#definition_due_to_week', constraints: {week_index: /\d+/}
  
  end

=end

  #We want: GET api/v1/surveys/:id OR :name -> single survey identified by id OR name
  #We want: GET api/v1/surveys/due_this_week -> list of surveys due this week, regardless of submission state
  #We want: GET api/v1/surveys/submittable_now -> list of unsubmitted surveys for which the current time is between due_at and expires_at
  #We want: GET api/v1/surveys/missed -> list of all surveys meant to be submitted but without submission
  #We want: GET api/v1/surveys/due/:week_index -> list of all survey whose definitions declare a week index equal to the one in the url

  #for ALL of the routes above, adding /definitions right after '/surveys/' should return the list of corresponding definitions INSTEAD of the obligations WITHOUT duplicates
  # for instance, api/v1/surveys/definitions/due_this_week is valid
  #a request without /definitions returns the list of obligations themselves

  #We want: POST api/v1/surveys/submit/:name -> where :name is the definition name. Since only one obligation of a survey may exist per week per person, you should be able to get a handle on that obligation using just the name.
  # You should of course handle illegal submission attempts.
  #A submission JSON body could look like {question_1: answer_1, ..., question_n: answer_n}
  #By the time you render a response, you should have the_appropriate_obligation.submission ==> {question_1: answer_1, ..., question_n: answer_n}

end


#curl http://localhost:3000/api/v1/surveys/due_this_week?page=1 -H 'Authorization: Token token=12345'
















