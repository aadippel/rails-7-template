class AvailabilitiesController < ApplicationController
  def index
    matching_availabilities = Availability.all

    @list_of_availabilities = matching_availabilities.order({ :created_at => :desc })

    render({ :template => "availabilities/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_availabilities = Availability.where({ :id => the_id })

    @the_availability = matching_availabilities.at(0)

    render({ :template => "availabilities/show" })
  end

  def create
    the_availability = Availability.new
    the_availability.user_id = params.fetch("query_user_id")
    the_availability.start_time = params.fetch("query_start_time")
    the_availability.end_time = params.fetch("query_end_time")
    the_availability.day_of_week = params.fetch("query_day_of_week")

    if the_availability.valid?
      the_availability.save
      redirect_to("/availabilities", { :notice => "Availability created successfully." })
    else
      redirect_to("/availabilities", { :alert => the_availability.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_availability = Availability.where({ :id => the_id }).at(0)

    the_availability.user_id = params.fetch("query_user_id")
    the_availability.start_time = params.fetch("query_start_time")
    the_availability.end_time = params.fetch("query_end_time")
    the_availability.day_of_week = params.fetch("query_day_of_week")

    if the_availability.valid?
      the_availability.save
      redirect_to("/availabilities/#{the_availability.id}", { :notice => "Availability updated successfully."} )
    else
      redirect_to("/availabilities/#{the_availability.id}", { :alert => the_availability.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_availability = Availability.where({ :id => the_id }).at(0)

    the_availability.destroy

    redirect_to("/availabilities", { :notice => "Availability deleted successfully."} )
  end
end
