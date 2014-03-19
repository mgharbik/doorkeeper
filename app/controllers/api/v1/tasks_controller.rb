module Api
  module V1
    class TasksController < ApplicationController
      doorkeeper_for :all

      def index
        render json: current_user.tasks
      end

      def create     
        render json: current_user.tasks.create(params[:task])
      end

      private
        def current_user
          @current_user ||= User.find(doorkeeper_token.resource_owner_id)
        end
    end
  end
end
