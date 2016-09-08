class SurveysController < ApiController

	TOKEN = "12345"

	before_action :authenticate 								#, except: [ :index]
######################################Survey Obligation Controller######################################################
	def obligation_show
		@surveys = SurveyObligation.find(params[:id]) #SurveyObligation
		render json: @surveys, except: [:user_id,:updated_at,:created_at]
	end

	def obligation_due_this_week

		current_week = Date.today.beginning_of_week
		@surveys = SurveyObligation.where(user_id: @p_user_id).where(due_at:current_week).page(params[:page]).per(2) 	#### items_per_page = 2 : User Defined
		render json: @surveys, except:[:user_id,:updated_at,:created_at]					#### exclude user_id, updated_at, created_at
	end

	def obligation_submittable_now

		current_day = Date.today
		@surveys = SurveyObligation.where(user_id: @p_user_id).where("due_at <= ? AND expires_at >= ?",current_day,current_day).page(params[:page]).per(2)
		render json: @surveys, except:[:user_id,:updated_at,:created_at]
	end

	def obligation_missed
		@surveys = SurveyObligation.where(user_id: @p_user_id).where(:submission=>nil).where.not(:submitted_at=>nil).page(params[:page]).per(2)
		render json: @surveys, except:[:user_id,:updated_at,:created_at]
	end

	def obligation_due_to_week

		@surveys = SurveyObligation.where(user_id: @p_user_id).where("due_at <= ? AND expires_at >= ?",params[:week_index],params[:week_index]).page(params[:page]).per(2)
		render json: @surveys, except:[:user_id,:updated_at,:created_at]
		render :text =>"due to week"
	end


	def nourl
		render :text =>"no url"
	end
private
	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@p_user_id = User.find_by('token' => token).id
			User.find_by('token' => token).present?
#			token == TOKEN
		end
	end


########################################Survey Definition Contorller####################################################
=begin
	def definition_show
		@defs = SurveyDefinition.find(params[:id]); #SurveyObligation
		render :json => @defs.to_json
	end

	def definition_due_this_week

		current_week = Date.today.strftime("%U").to_i

		@defs = SurveyDefinition.find_by_sql(["SELECT * FROM survey_definitions where ?=ANY(week_indices)",current_week])
		render :json => @defs.to_json
	end

	def definition_submittable_now

		current_day = Date.today
		@defs = SurveyDefinition.find_by_sql(["SELECT * FROM survey_definitions where due_at <= ? AND expires_at >= ?",current_day,current_day])
		render :json => @defs.to_json
	end

	def definition_missed
		@defs = SurveyDefinition.find_by_sql(["SELECT * FROM survey_definitions where submitted_at IS NOT NULL AND submission IS NULL"])
		render :json => @defs.to_json
	end

	def definition_due_to_week
		
		render :text =>"due to week"
	end
=end
############################################################################################
=begin
1) All responses sent back to the requester in JSON
2) All actions that return lists must support pagination specified in the params (i.e items_per_page=y)
3) Users are identified & authenticated against the "token" column. You can choose whether you expect the value in the params or headers
4) Obviously, since all surveys obligations are user specific, all the information you query here must be specific to the current user
5) Unauthorized access should yield an error response in JSON
6) Any survey obligation/definition returned should have all fields EXCEPT user_id (if applicable), updated_at, and created_at
=end

end