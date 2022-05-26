class SmallBusinessesController < ApplicationController
  def index
    matching_small_businesses = SmallBusiness.all

    @list_of_small_businesses = matching_small_businesses.order({ :created_at => :desc })

    render({ :template => "small_businesses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_small_businesses = SmallBusiness.where({ :id => the_id })

    @the_small_business = matching_small_businesses.at(0)

    render({ :template => "small_businesses/show.html.erb" })
  end

  def create
    the_small_business = SmallBusiness.new
    the_small_business.small_business_name = params.fetch("query_small_business_name")
    the_small_business.small_business_description = params.fetch("query_small_business_description")
    the_small_business.small_business_location = params.fetch("query_small_business_location")
    the_small_business.small_business_phone_number = params.fetch("query_small_business_phone_number")
    the_small_business.small_business_photo = params.fetch("query_small_business_photo")
    the_small_business.small_business_type = params.fetch("query_small_business_type")

    if the_small_business.valid?
      the_small_business.save
      redirect_to("/small_businesses", { :notice => "Small business created successfully." })
    else
      redirect_to("/small_businesses", { :alert => the_small_business.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_small_business = SmallBusiness.where({ :id => the_id }).at(0)

    the_small_business.small_business_name = params.fetch("query_small_business_name")
    the_small_business.small_business_description = params.fetch("query_small_business_description")
    the_small_business.small_business_location = params.fetch("query_small_business_location")
    the_small_business.small_business_phone_number = params.fetch("query_small_business_phone_number")
    the_small_business.small_business_photo = params.fetch("query_small_business_photo")
    the_small_business.small_business_type = params.fetch("query_small_business_type")

    if the_small_business.valid?
      the_small_business.save
      redirect_to("/small_businesses/#{the_small_business.id}", { :notice => "Small business updated successfully."} )
    else
      redirect_to("/small_businesses/#{the_small_business.id}", { :alert => the_small_business.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_small_business = SmallBusiness.where({ :id => the_id }).at(0)

    the_small_business.destroy

    redirect_to("/small_businesses", { :notice => "Small business deleted successfully."} )
  end
end
