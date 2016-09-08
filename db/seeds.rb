Team.create!([
  {name: "team1", program_starts_at: "2016-06-10 00:00:00"},
  {name: "team2", program_starts_at: "2016-06-13 00:00:00"}
])
User.create!([
  {team_id: 1, first_name: "tom", last_name: "tom", token: "12345"},
  {team_id: 1, first_name: "jack", last_name: "bill", token: "12347"},
  {team_id: 2, first_name: "sam", last_name: "ken", token: "12342"}
])
SurveyDefinition.create!([
  {name: "surveydef1", week_indices: [1, 3, 5], lateness_allowed: 5, format: {"q1"=>"a1", "q2"=>"a2", "q3"=>"a3"}},
  {name: "surveydef2", week_indices: [1, 3, 6], lateness_allowed: 7, format: {"q4"=>"a4", "q5"=>"a5", "q6"=>"a6"}},
  {name: "definitions3", week_indices: [21, 22, 23, 24, 25, 26], lateness_allowed: 3, format: {"query1"=>"ans1", "query2"=>"ans2", "query3"=>"ans3"}},
  {name: "definitions4", week_indices: [27, 22, 23, 24, 25, 26], lateness_allowed: 3, format: {"query3"=>"ans3", "query5"=>"ans5", "query6"=>"ans7"}},
  {name: "definitions5", week_indices: [27, 28, 23, 24, 25, 26], lateness_allowed: 3, format: {"query3"=>"ans3", "query5"=>"ans5", "query6"=>"ans7"}},
  {name: "definitions6", week_indices: [20, 21, 22], lateness_allowed: 3, format: {"query3"=>"ans3", "query5"=>"ans5", "query6"=>"ans7"}}
])
SurveyObligation.create!([
  {user_id: 1, survey_definition_id: 1, due_at: "2016-06-17 00:00:00", expires_at: "2016-06-20 00:00:00", submitted_at: "2016-06-18 00:00:00", submission: {"query1"=>"answer1", "query2"=>"answer1", "query3"=>"answer1"}},
  {user_id: 1, survey_definition_id: 2, due_at: "2016-06-12 00:00:00", expires_at: "2016-06-19 00:00:00", submitted_at: "2016-06-17 00:00:00", submission: {"query1"=>"answer1", "xcv"=>"answer1","query3"=>"answer3"}},
  {user_id: 2, survey_definition_id: 2, due_at: "2016-06-12 00:00:00", expires_at: "2016-06-19 00:00:00", submitted_at: "2016-06-17 00:00:00", submission: nil},
  {user_id: 2, survey_definition_id: 2, due_at: "2016-06-13 00:00:00", expires_at: "2016-06-19 00:00:00", submitted_at: "2016-06-17 00:00:00", submission: {"query1"=>"answer1", "xcvv"=>"answer1", "xcvb"=>"answer1"}},
  {user_id: 1, survey_definition_id: 2, due_at: "2016-06-13 00:00:00", expires_at: "2016-06-19 00:00:00", submitted_at: "2016-06-17 00:00:00", submission: {"asd"=>"wer", "query1"=>"zvzx", "eee"=>"wersdf"}},
  {user_id: 1, survey_definition_id: 2, due_at: "2016-06-20 00:00:00", expires_at: "2016-06-25 00:00:00", submitted_at: "2016-06-22 00:00:00", submission: {"query1"=>"answer1", "zxcv"=>"answer1", "query4"=>"answer1"}},
  {user_id: 1, survey_definition_id: 2, due_at: "2016-06-13 00:00:00", expires_at: "2016-06-19 00:00:00", submitted_at: "2016-06-17 00:00:00", submission: {"query1"=>"sdf", "zzxc"=>"ret", "eee"=>"sdfzxcv"}},
  {user_id: 1, survey_definition_id: 3, due_at: "2016-06-14 00:00:00", expires_at: "2016-06-24 00:00:00", submitted_at: "2016-06-22 00:00:00", submission: nil},
  {user_id: 2, survey_definition_id: 2, due_at: "2016-06-17 00:00:00", expires_at: "2016-06-23 00:00:00", submitted_at: "2016-06-22 00:00:00", submission: nil},
  {user_id: 1, survey_definition_id: 2, due_at: "2016-06-20 00:00:00", expires_at: "2016-06-25 00:00:00", submitted_at: "2016-06-22 00:00:00", submission: {"query1"=>"answer1", "query5"=>"answer1", "query2"=>"xvb"}},
  {user_id: 1, survey_definition_id: 3, due_at: "2016-06-10 00:00:00", expires_at: "2016-06-24 00:00:00", submitted_at: "2016-06-22 00:00:00", submission: nil},
  {user_id: 3, survey_definition_id: 2, due_at: "2016-06-10 00:00:00", expires_at: "2016-06-23 00:00:00", submitted_at: "2016-06-22 00:00:00", submission: nil}
])
